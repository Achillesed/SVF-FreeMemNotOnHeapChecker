/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_16.c
Label Definition File: CWE590_Free_Memory_Not_on_Heap__free.label.xml
Template File: sources-sink-16.tmpl.c
*/
/*
 * @description
 * CWE: 590 Free Memory Not on Heap
 * BadSource: static Data buffer is declared static on the stack
 * GoodSource: Allocate memory on the heap
 * Sink:
 *    BadSink : Print then free data
 * Flow Variant: 16 Control flow: while(1)
 *
 * */

#include "std_testcase.h"

#include <wchar.h>

#ifndef OMITBAD

void CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_16_bad()
{
    wchar_t * data;
    data = NULL; /* Initialize data */
    while(1)
    {
        {
            /* FLAW: data is allocated on the stack and deallocated in the BadSink */
            static wchar_t dataBuffer[100];
            wmemset(dataBuffer, L'A', 100-1); /* fill with 'A's */
            dataBuffer[100-1] = L'\0'; /* null terminate */
            data = dataBuffer;
        }
        break;
    }
    printWLine(data);
    /* POTENTIAL FLAW: Possibly deallocating memory allocated on the stack */
    free(data);
}

#endif /* OMITBAD */

#ifndef OMITGOOD

/* goodG2B() - use goodsource and badsink by changing the conditions on the while statements */
static void goodG2B()
{
    wchar_t * data;
    data = NULL; /* Initialize data */
    while(1)
    {
        {
            /* FIX: data is allocated on the heap and deallocated in the BadSink */
            wchar_t * dataBuffer = (wchar_t *)malloc(100*sizeof(wchar_t));
            if (dataBuffer == NULL)
            {
                printLine("malloc() failed");
                exit(1);
            }
            wmemset(dataBuffer, L'A', 100-1); /* fill with 'A's */
            dataBuffer[100-1] = L'\0'; /* null terminate */
            data = dataBuffer;
        }
        break;
    }
    printWLine(data);
    /* POTENTIAL FLAW: Possibly deallocating memory allocated on the stack */
    free(data);
}

void CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_16_good()
{
    goodG2B();
}

#endif /* OMITGOOD */

/* Below is the main(). It is only used when building this testcase on
 * its own for testing or for building a binary to use in testing binary
 * analysis tools. It is not used when compiling all the testcases as one
 * application, which is how source code analysis tools are tested.
 */

#ifdef INCLUDEMAIN

int main(int argc, char * argv[])
{
    /* seed randomness */
    srand( (unsigned)time(NULL) );
#ifndef OMITGOOD
    printLine("Calling good()...");
    CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_16_good();
    printLine("Finished good()");
#endif /* OMITGOOD */
#ifndef OMITBAD
    printLine("Calling bad()...");
    CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_16_bad();
    printLine("Finished bad()");
#endif /* OMITBAD */
    return 0;
}

#endif
