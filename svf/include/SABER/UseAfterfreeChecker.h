/*
 * UseAfterFreeChecker.h
 *
 *  Created on: Apr 24, 2014
 *      Author: Yulei Sui
 */

#ifndef USEAFTERFREE_H_
#define USEAFTERFREE_H_

#include "SABER/LeakChecker.h"

namespace SVF
{

class UseAfterFreeChecker : public LeakChecker
{

public:
    /// Constructor
    UseAfterFreeChecker(): LeakChecker()
    {
    }

    /// Destructor
    virtual ~UseAfterFreeChecker()
    {
    }

    /// We start from here
    virtual bool runOnModule(SVFIR* pag) override
    {
        /// start analysis
        analyze(pag->getModule());
        return false;
    }






    /// Report file/close bugs
    void reportBug(ProgSlice* slice) override;


    /// Validate test cases for regression test purpose
    void testsValidation(ProgSlice* slice);
    void validateSuccessTests(ProgSlice* slice, const SVFFunction* fun);
    void validateExpectedFailureTests(ProgSlice* slice, const SVFFunction* fun);
};

} // End namespace SVF

#endif /* DOUBLEFREECHECKER_H_ */
