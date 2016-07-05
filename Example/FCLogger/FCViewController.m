//
//  FCViewController.m
//  FCLogger
//
//  Created by Federico Cappelli on 07/04/2016.
//  Copyright (c) 2016 Federico Cappelli. All rights reserved.
//

#import "FCViewController.h"
#import "FCAppDelegate.h"
#import <FCLogger/FCLogger.h>
#include <stdlib.h>

@interface FCViewController ()

@property(nonatomic, weak) FCAppDelegate *appDelegate;

@end

@implementation FCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.appDelegate = (FCAppDelegate *)[[UIApplication sharedApplication] delegate];
    
    //set the UITextView
    self.appDelegate.fcLogger.textView = self.textView;
}

-(void)addLogHandler:(id)sender
{
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
        for (int i = 0; i< 100; i++) {
            [self.appDelegate addRandomLog];
            [NSThread sleepForTimeInterval:0.05];
        }
    });
}

@end
