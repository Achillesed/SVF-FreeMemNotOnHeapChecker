/*
 * FreeMemoryNotonHeapChecker.h
 *
 *  Created on: Apr 24, 2023
 *      Author: Mingyu Yang
 */

#ifndef FREEMEMORYNOTONHEAP_H_
#define FREEMEMORYNOTONHEAP_H_

#include "SABER/LeakChecker.h"

namespace SVF
{

class FreeMemoryNotonHeapChecker : public LeakChecker
{

public:
    std::set<SVFGNode*> s;
    /// Constructor
    FreeMemoryNotonHeapChecker(): LeakChecker()
    {
    }

    /// Destructor
    virtual ~FreeMemoryNotonHeapChecker()
    {
    }

    /// We start from here
    virtual bool runOnModule(SVFIR* pag) override
    {
        /// start analysis
        analyze(pag->getModule());
        return false;
    }

    


    inline bool isnotSourceLikeFun(const SVFFunction* fun)
    {
        return SaberCheckerAPI::getCheckerAPI()->isMemAlloc(fun);
    }

    virtual void initSrcs() override;



    void reportBug(ProgSlice* slice) override;




    /// Validate test cases for regression test purpose
    void testsValidation(ProgSlice* slice);
    void validateSuccessTests(ProgSlice* slice, const SVFFunction* fun);
    void validateExpectedFailureTests(ProgSlice* slice, const SVFFunction* fun);

};

} // End namespace SVF

#endif /* FREEMEMORYNOTONHEAP_H_ */
