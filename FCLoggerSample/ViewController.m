//
//  ViewController.m
//  FCLoggerSample
//
//  Created by Federico Cappelli on 08/05/2015.
//  Copyright (c) 2015 Federico Cappelli. All rights reserved.
//

#import "ViewController.h"
#import "FCLogger.h"
#include <stdlib.h>

@interface ViewController ()

@property(nonatomic, strong) FCLogger * fcLogger;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // create the FC logger
    self.fcLogger = [[FCLogger alloc] init];
    
    //set the UITextView
    self.fcLogger.textView = self.textView;

    //enable auto scroll
    self.fcLogger.autoScrollsToBottom = YES;
    
    //enable colors support
    self.fcLogger.colorsEnabled = YES;
    
    //enable Apple Watch support
    self.fcLogger.watchSupportEnabled = YES;
    
    //enable notifications only for errors and warnings
    [self.fcLogger enableWatchNotificationsForFlags: DDLogFlagWarning | DDLogFlagError];
    
    //add logger to CocoaLumberjack
    [DDLog addLogger:self.fcLogger];
    
    //set custom color for specific log flag
    [self.fcLogger setLogColor:[UIColor blueColor] forFlag:DDLogFlagDebug];

    DDLogDebug(@"Test debug log");
    DDLogError(@"Test error log");
}

-(void)addLogHandler:(id)sender
{
    int randomFlag = arc4random_uniform(4);
    switch (randomFlag)
    {
        case 0:
        {
            DDLogError(@"Error log test string");
        }
            break;
        case 1:
        {
            DDLogWarn(@"Warning log test string");
        }
            break;
        case 2:
        {
            DDLogInfo(@"Info log test string");
        }
            break;
        case 3:
        {
            DDLogDebug(@"Debug log test string");
        }
            break;
        case 4:
        {
            DDLogVerbose(@"Verbose log test string");
        }
            break;
    }
}

@end
