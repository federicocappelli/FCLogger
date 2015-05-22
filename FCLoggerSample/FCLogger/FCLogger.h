//
//  FCLogger
//  FCLoggerSample
//
//  Created by Federico Cappelli on 08/05/2015.
//  Copyright (c) 2015 Federico Cappelli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CocoaLumberjack/CocoaLumberjack.h>

/*
 * A logger for CocoaLumberjack that outputs the messages to
 * a UITextView.
 * 
 * If textView is not set up, the logs will be cached and then
 * flushed when it's set up.
 */
@interface FCLogger : DDAbstractLogger <DDLogger>

@property (nonatomic, weak) UITextView *textView;

/**
 *  Automatically scroll to the bottom when a new log is added.
 */
@property (nonatomic, assign) BOOL autoScrollsToBottom;

#pragma mark - Colors

/**
 *  Enable colors
 */
@property (nonatomic, assign) BOOL colorsEnabled;

/**
 *  Set a custom color for the specific DDLogFlag
 *
 *  @param txtColor UIColor in this case
 *  @param mask     Not used as a mask, only single values: DDLogFlagError, DDLogFlagWarning, DDLogFlagInfo, DDLogFlagDebug, DDLogFlagVerbose
 */
- (void)setLogColor:(DDColor *)txtColor forFlag:(DDLogFlag)flag;

#pragma mark - Apple watch

/**
 *  Enable local notifications, each notification uses apple watch long-look notification provided (if implemented) otherwise a static notification.
 */
@property (nonatomic, assign) BOOL watchSupportEnabled;

- (void)enableWatchNotificationsForFlags:(DDLogFlag)mask;

@end
