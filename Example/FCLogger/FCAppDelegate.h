//
//  FCAppDelegate.h
//  FCLogger
//
//  Created by Federico Cappelli on 07/04/2016.
//  Copyright (c) 2016 Federico Cappelli. All rights reserved.
//

@import UIKit;

#import <FCLogger/FCLogger.h>

#if DEBUG
static const DDLogLevel ddLogLevel = DDLogLevelVerbose;
#else
static const DDLogLevel ddLogLevel = DDLogLevelWarning;
#endif

@interface FCAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property(nonatomic, strong) FCLogger * fcLogger;

-(void)addRandomLog;

@end
