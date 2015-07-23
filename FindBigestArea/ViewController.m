//
//  ViewController.m
//  FindBigestArea
//
//  Created by Teerapat on 7/23/2558 BE.
//  Copyright (c) 2558 Teerapat. All rights reserved.
//

#import "ViewController.h"
#import "Matrix.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //Set input array here
    /*
     [0 0 0 2 2]
     |1 1 7 2 2|
     |2 2 7 2 1|
     |2 1 7 4 4|
     |2 7 7 4 4|
     |4 6 6 0 4|
     |4 4 6 4 4|
     [4 4 6 4 4]
     */
    NSArray *inputArray = @[
                            @[ @0, @0, @0, @2, @2],
                            @[ @1, @1, @7, @2, @2],
                            @[ @2, @2, @7, @2, @1],
                            @[ @2, @1, @7, @4, @4],
                            @[ @2, @7, @7, @4, @4],
                            @[ @4, @6, @6, @0, @4],
                            @[ @4, @4, @6, @4, @4],
                            @[ @4, @4, @6, @4, @4],
                            ];
    
    Matrix *matrix = [[Matrix alloc] initFromArray:inputArray];
    int biggestArea = [matrix findCountElementOfBiggestArea];
    NSLog(@"Biggest area is %d",biggestArea);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
