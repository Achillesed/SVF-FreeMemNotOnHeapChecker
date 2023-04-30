/*
 * FreeMemoryNotonHeapChecker.cpp
 *
 *  Created on: Apr 20, 2023
 *      Author: Mingyu Yang
 */

#include "SABER/FreeMemoryNotonHeapChecker.h"
#include "Util/SVFUtil.h"
#include "Util/Options.h"

using namespace SVF;
using namespace SVFUtil;

/*!
 * Initialize sources
 */
void FreeMemoryNotonHeapChecker::initSrcs()
{
    SVFIR* pag = getPAG();
    ICFG* icfg = pag->getICFG();
    for(SVFStmt::SVFStmtSetTy::iterator it = pag->getPTASVFStmtSet(SVFStmt::Addr).begin(),
            eit=pag->getPTASVFStmtSet(SVFStmt::Addr).end(); it!=eit; ++it)
    {
        const SVFStmt* sv = *it;
        //outs() << **it << "\n";
        auto objvar = dyn_cast<ObjVar>(sv->getSrcNode());
        if(pag->getObject(objvar)->isStack()||pag->getObject(objvar)->isGlobalObj()){
            StmtVFGNode* addrVfg=getSVFG()->getStmtVFGNode(sv);
            s.insert(addrVfg);
            
        }
    }

    for(SVFIR::CSToRetMap::iterator it = pag->getCallSiteRets().begin(),
            eit = pag->getCallSiteRets().end(); it!=eit; ++it)
    {
        const RetICFGNode* cs = it->first;
        /// if this callsite return reside in a dead function then we do not care about its leaks
        /// for example instruction `int* p = malloc(size)` is in a dead function, then program won't allocate this memory
        /// for example a customized malloc `int p = malloc()` returns an integer value, then program treat it as a system malloc
        if(cs->getCallSite()->ptrInUncalledFunction() || !cs->getCallSite()->getType()->isPointerTy())
            continue;

        PTACallGraph::FunctionSet callees;
        getCallgraph()->getCallees(cs->getCallICFGNode(),callees);
        for(PTACallGraph::FunctionSet::const_iterator cit = callees.begin(), ecit = callees.end(); cit!=ecit; cit++)
        {
            const SVFFunction* fun = *cit;
            if (isSourceLikeFun(fun))
            {
                CSWorkList worklist;
                SVFGNodeBS visited;
                worklist.push(it->first->getCallICFGNode());
                while (!worklist.empty())
                {
                    //CallICFGNode->RetICFGNode->RetPAGNode->RetSVFGNode
                    const CallICFGNode* cs = worklist.pop();
                    const RetICFGNode* retBlockNode = icfg->getRetICFGNode(cs->getCallSite());
                    const PAGNode* pagNode = pag->getCallSiteRet(retBlockNode);
                    const SVFGNode* node = getSVFG()->getDefSVFGNode(pagNode);
                    if (visited.test(node->getId()) == 0)
                        visited.set(node->getId());
                    else
                        continue;

                    CallSiteSet csSet;
                    // if this node is in an allocation wrapper, find all its call nodes
                    if (isInAWrapper(node, csSet))
                    {
                        for (CallSiteSet::iterator it = csSet.begin(), eit =
                                    csSet.end(); it != eit; ++it)
                        {
                            worklist.push(*it);
                        }
                    }
                    // otherwise, this is the source we are interested
                    else
                    {
                        // exclude sources in dead functions or sources in functions that have summary
                        if (!cs->getCallSite()->ptrInUncalledFunction() && !isExtCall(cs->getCallSite()->getParent()->getParent()))
                        {  
                            if(s.find(const_cast<SVF::SVFGNode *>(node))!=s.end()){
                                outs()<<*node<<"\n";
                                s.erase(const_cast<SVF::SVFGNode *>(node));
                            }
                        }
                    }
                }
            }
        }
    }
    for(const auto &a:s){
        outs()<<*a<<"\n";
        addToSources(a);
    }
}


void FreeMemoryNotonHeapChecker::reportBug(ProgSlice* slice)
{

    if(isSomePathReachable() == true )
    {
        auto svfsrc = slice->getSource();
        outs() << *svfsrc << "\n";
        SVFUtil::errs() << bugMsg2("\t FreeMemoryNotonHeap :") <<  " memory allocation on stack at : ("
                <<*svfsrc<< ")\n";
        
        auto snks = slice->getSinks();
        for(auto snk : snks){ 
            //outs() << *snk << "\n";
            SVFUtil::errs() << bugMsg2("\t FreeMemoryNotonHeap :") <<  " free at : ("
                <<snk->getICFGNode()->toString()<<"\n";
        }
        //SVFUtil::errs() << "\t\t conditional free path: \n" << slice->evalFinalCond() << "\n";
        //if(Options::ValidateTests())
            testsValidation(slice);
    }
}



void FreeMemoryNotonHeapChecker::testsValidation(ProgSlice *slice)
{
    //outs() << *slice->getSource() << "\n";
    assert(slice->getSource()!=NULL && "未找到src点");
    //auto snks = slice->getSinks();
    //for(auto snk : snks){ 
    //outs() <<snk->getICFGNode()->toString()<< "\n";
    //}
        assert(!slice->getSinks().empty() && "未找到snk点");
    /*
    if(slice->getSource()!=NULL && !slice->getSinks().empty())
    {
         SVFUtil::errs() << bugMsg2("success!")<<"\n";
        auto svfsrc = slice->getSource();
        SVFUtil::errs() << bugMsg2("\t FreeMemoryNotonHeap :") <<  " memory allocation on stack at : ("
                <<svfsrc->getICFGNode()->toString()<< ")\n";
        
        auto snks = slice->getSinks();
        for(auto snk : snks){ 
            //outs() << *snk << "\n";
            SVFUtil::errs() << bugMsg2("\t FreeMemoryNotonHeap :") <<  " free at : ("
                <<snk->getICFGNode()->toString()<<"\n";
        }
        SVFUtil::errs() << "\t\t conditional free path: \n" << slice->evalFinalCond() << "\n";
    }
    */
    //validateSuccessTests(slice,fun);
    //validateExpectedFailureTests(slice,fun);
}
/*
void FreeMemoryNotonHeapChecker::validateSuccessTests(ProgSlice *slice, const SVFFunction *fun)
{   
    const SVFGNode* source = slice->getSource();
    const CallICFGNode* cs = getSrcCSID(source);

    bool success = false;

    if(fun->getName() == "SAFEMALLOC")
    {
        if(slice->isSatisfiableForPairs() == true)
            success = true;
    }
    else if(fun->getName() == "DOUBLEFREEMALLOC")
    {
        if(slice->isSatisfiableForPairs() == false)
            success = true;
    }
    else if(fun->getName() == "DOUBLEFREEMALLOCFN" || fun->getName() == "SAFEMALLOCFP")
    {
        return;
    }
    else
    {
        writeWrnMsg("\t can not validate, check function not found, please put it at the right place!!");
        return;
    }

    std::string funName = source->getFun()->getName();

    if (success)
    {
        outs() << sucMsg("\t SUCCESS :") << funName << " check <src id:" << source->getId()
               << ", cs id:" << getSrcCSID(source)->getCallSite()->toString() << "> at ("
               << cs->getCallSite()->getSourceLoc() << ")\n";
        outs() << "\t\t double free path: \n" << slice->evalFinalCond() << "\n";
    }
    else
    {
        SVFUtil::errs() << errMsg("\t FAILURE :") << funName << " check <src id:" << source->getId()
                        << ", cs id:" <<getSrcCSID(source)->getCallSite()->toString() << "> at ("
                        << cs->getCallSite()->getSourceLoc() << ")\n";
        SVFUtil::errs() << "\t\t double free path: \n" << slice->evalFinalCond() << "\n";
        assert(false && "test case failed!");
    }
}

void FreeMemoryNotonHeapChecker::validateExpectedFailureTests(ProgSlice *slice, const SVFFunction *fun)
{
    const SVFGNode* source = slice->getSource();
    const CallICFGNode* cs = getSrcCSID(source);

    bool expectedFailure = false;
    /// output safe but should be double free
    if(fun->getName() == "DOUBLEFREEMALLOCFN")
    {
        if(slice->isSatisfiableForPairs() == true)
            expectedFailure = true;
    } /// output double free but should be safe
    else if(fun->getName() == "SAFEMALLOCFP")
    {
        if(slice->isSatisfiableForPairs() == false)
            expectedFailure = true;
    }
    else if(fun->getName() == "SAFEMALLOC" || fun->getName() == "DOUBLEFREEMALLOC")
    {
        return;
    }
    else
    {
        writeWrnMsg("\t can not validate, check function not found, please put it at the right place!!");
        return;
    }

    std::string funName = source->getFun()->getName();

    if (expectedFailure)
    {
        outs() << sucMsg("\t EXPECTED-FAILURE :") << funName << " check <src id:" << source->getId()
               << ", cs id:" << getSrcCSID(source)->getCallSite()->toString() << "> at ("
               << cs->getCallSite()->getSourceLoc() << ")\n";
        outs() << "\t\t double free path: \n" << slice->evalFinalCond() << "\n";
    }
    else
    {
        SVFUtil::errs() << errMsg("\t UNEXPECTED FAILURE :") << funName
                        << " check <src id:" << source->getId()
                        << ", cs id:" << getSrcCSID(source)->getCallSite()->toString() << "> at ("
                        << cs->getCallSite()->getSourceLoc() << ")\n";
        SVFUtil::errs() << "\t\t double free path: \n" << slice->evalFinalCond() << "\n";
        assert(false && "test case failed!");
    }
}
*/