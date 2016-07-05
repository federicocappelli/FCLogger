//
//  FCAppDelegate.m
//  FCLogger
//
//  Created by Federico Cappelli on 07/04/2016.
//  Copyright (c) 2016 Federico Cappelli. All rights reserved.
//

#import "FCAppDelegate.h"

@implementation FCAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    // create the FC logger
    self.fcLogger = [[FCLogger alloc] init];
    
    //enable auto scroll
    self.fcLogger.autoScrollsToBottom = YES;
    
    //enable colors support
    self.fcLogger.colorsEnabled = YES;
    
    //enable Apple Watch support
    //    self.fcLogger.watchSupportEnabled = YES;
    
    //enable notifications only for errors and warnings
    //    [self.fcLogger enableWatchNotificationsForFlags: DDLogFlagWarning | DDLogFlagError];
    
    //add logger to CocoaLumberjack
    [DDLog addLogger:self.fcLogger];
    
    //set custom color for specific log flag
    [self.fcLogger setLogColor:[UIColor blueColor] forFlag:DDLogFlagDebug];
    
    for (int i = 0; i<20; i++) {
        [self addRandomLog];
    }
    
    DDLogDebug(@"Test debug log");
    DDLogError(@"Test error log");
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(void)addRandomLog
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
