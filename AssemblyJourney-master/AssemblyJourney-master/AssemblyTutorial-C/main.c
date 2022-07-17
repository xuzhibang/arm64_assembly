//
//  main.c
//  AssemblyTutorial-C
//
//  Created by BeyondChao on 2020/2/8.
//  Copyright © 2020 BeyondChao. All rights reserved.
//

#include <stdio.h>
#include "operator.h"
#include "pointer.h"
/*
1. Build: 【Shift + CMD + P】 Task: Run Build Task
2. Run:   Run
*/

void one();
void two();
void three();
void four(int i);

void addOperator() 
{
    int a = 10;
    a = a + 1;
    a = a * 8;

    printf("sum = %d\n", a);
}
 
int main(int argc, const char * argv[]) {
    // insert code here...
    printf("Hello, World!!!\n");
    
    addOperator();
    greet();
    
    basic_pointer();
    
    one();

    return 0;
}

// call stack
void one() {
    two();
}

void two() {
    three();
}

void three() {
    four(4);
}

void four(int i) {
    printf("result = %d\n", i);
}