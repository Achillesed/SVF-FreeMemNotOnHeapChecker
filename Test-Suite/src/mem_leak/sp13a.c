/*
 * Never free
 *
 * Author: Yule Sui
 * Date: 02/04/2014
 */

#include "memleak_check.h"

// TC13: relation between argument and return address 
struct List {
	  char *x;
	    char *y;
};

char * ra(char * dst, char *src){
	  struct List *p;
	    p = (struct List *)SAFEMALLOC(sizeof(struct List));
		  p->x = dst;
		    //p->y = src;
		    return p;
}

int main(){
	  char * p = SAFEMALLOC(10);
	    char * q = NFRMALLOC(10);
		  struct List * pp;
		    pp = ra(p,q);
		    free(pp);
		    free(pp->x);
		    free(pp->y);
			  return pp;
}



