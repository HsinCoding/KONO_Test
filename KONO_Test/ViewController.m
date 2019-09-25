//
//  ViewController.m
//  KONO_Test
//
//  Created by CI-Starly.Chen on 2019/9/24.
//  Copyright © 2019 CI-Starly.Chen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    int number;
    NSString *string;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self tryDataRace];

   
}

-(void) deadLock1 {
    NSLog(@"1");
    dispatch_sync(dispatch_get_main_queue(), ^{
        NSLog(@"2");
    });
}

-(void) deadLock2 {
dispatch_async(dispatch_get_global_queue(0, 0), ^{
   NSLog(@"1");
   //回到主线程发现死循环后面就没法执行了
   dispatch_sync(dispatch_get_main_queue(), ^{
       NSLog(@"2");
   });
   NSLog(@"3");
});
NSLog(@"4");
//死循环
    while (1) {
       //
    }
}


-(void) deadLockSolution1 {
    NSLog(@"1");
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"2");
    });
}

-(void) deadLockSolution2 {
    NSLog(@"1");
    dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
         NSLog(@"2");
    });
}


-(void) tryDataRace {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
         for (int i = 0 ; i < 10; i++) {
             self->number += 1;
             NSLog(@"%d", self->number);
           }
    });
   
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for (int i = 0 ; i < 10; i++) {
            self->number -= 1;
            NSLog(@"%d", self->number);
        }
    });
}




@end
