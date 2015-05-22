//
//  InterfaceController.m
//  FCLoggerSample WatchKit Extension
//
//  Created by Federico Cappelli on 11/05/2015.
//  Copyright (c) 2015 Federico Cappelli. All rights reserved.
//

#import "FCLoggerNotificationInterfaceController.h"


@interface FCLoggerNotificationInterfaceController()

@end


@implementation FCLoggerNotificationInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

-(void)didReceiveLocalNotification:(UILocalNotification *)localNotification withCompletion:(void (^)(WKUserNotificationInterfaceType))completionHandler
{
    
    completionHandler(WKUserNotificationInterfaceTypeCustom);
}

@end



