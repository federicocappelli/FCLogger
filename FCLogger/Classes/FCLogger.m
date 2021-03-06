//
//  FCLoggerTextView
//  FCLoggerSample
//
//  Created by Federico Cappelli on 08/05/2015.
//  Copyright (c) 2016 Federico Cappelli. All rights reserved.
//

#import "FCLogger.h"
#import "DDTTYLogger.h"

@interface FCLogger ()
{
    DDLogFlag _notificationMask;
}

@property (nonatomic, strong) NSMutableArray *logMsgCache;
@property (nonatomic, strong) NSMutableDictionary * colorProfilesDict;

@end

static NSString * const notificationName = @"FCLoggerNotification";

@implementation FCLogger

#pragma mark - Init

- (id)init
{
    if (self = [super init])
    {
        _autoScrollsToBottom = YES;
        _colorProfilesDict = [NSMutableDictionary new];
        [self loadDefaultColors];
    }
    return self;
}

#pragma mark - Private Stuff

-(void)loadDefaultColors
{
    [self setLogColor:[UIColor redColor] forFlag:DDLogFlagError];
    [self setLogColor:[UIColor orangeColor] forFlag:DDLogFlagWarning];
    [self setLogColor:[UIColor blackColor] forFlag:DDLogFlagInfo];
    [self setLogColor:[UIColor blackColor] forFlag:DDLogFlagDebug];
    [self setLogColor:[UIColor blackColor] forFlag:DDLogFlagVerbose];
}

- (void)appendTextViewString:(NSString *)string withColor:(UIColor *)color
{
    NSAssert(self.textView != nil, @"self.textView is nil");
    
    if(string == nil || string.length == 0)
    {
        return;
    }
    
    dispatch_async(dispatch_get_main_queue(), ^(void) {
        
        NSDictionary *attrs = @{ NSForegroundColorAttributeName : color };
        NSAttributedString *attrStr = [[NSAttributedString alloc] initWithString:string attributes:attrs];
        
        NSMutableAttributedString * resultAttributedString = [[NSMutableAttributedString alloc] initWithAttributedString:self.textView.attributedText];
        [resultAttributedString appendAttributedString:attrStr];
        [self.textView setAttributedText:resultAttributedString];
        
        [self scrollTextViewToBottom];
    });
}

#pragma mark - DDLogger

- (void)logMessage:(DDLogMessage *)logMessage
{
    NSString *logMsg = logMessage.message;
    if (_logFormatter)
    {
        logMsg = [_logFormatter formatLogMessage:logMessage];
    }
    
    if (logMsg)
    {
//        [self notifyLogMessage:logMessage];
        
        UIColor * logColor = nil;
        if (_colorsEnabled)
        {
            logColor = _colorProfilesDict[@(logMessage.flag).stringValue];
        }
        else
        {
            logColor = self.textView.textColor;
        }
        
        /* if textView is available, write to it,
         otherwise cache it */
        if (self.textView)
        {
            [self appendTextViewString:[NSString stringWithFormat:@"\n%@", logMsg] withColor:logColor];
        }
        else
        {
            if (self.logMsgCache == nil)
            {
                self.logMsgCache = [NSMutableArray new];
            }
            
            NSDictionary *attrs = @{ NSForegroundColorAttributeName : logColor };
            NSAttributedString *attrStr = [[NSAttributedString alloc] initWithString:logMsg attributes:attrs];
            [self.logMsgCache addObject:attrStr];
        }
    }
}

//TODO: implement
//-(void)notifyLogMessage:(DDLogMessage *)logMessage
//{
//    if( !self.watchSupportEnabled)
//    {
//        return;
//    }
//    
//    BOOL notificationEnabled = (_notificationMask & logMessage.flag) != 0;
//    
//    if( notificationEnabled )
//    {
//        UILocalNotification *localNotification = [[UILocalNotification alloc] init];
//        localNotification.category = notificationName;
//        localNotification.fireDate = [NSDate date];
//        localNotification.alertBody = [NSString stringWithFormat:@"Error: %@", logMessage.message];
//        localNotification.soundName = UILocalNotificationDefaultSoundName;
//        [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
//    }
//}

#pragma mark - Getters & Setters

- (void)setTextView:(UITextView *)textView
{
    if (_textView != textView)
    {
        NSMutableAttributedString *entireLog = [[NSMutableAttributedString alloc] initWithAttributedString: textView.attributedText];
        if (_textView != nil)
        {
            //transfer logs
            [entireLog appendAttributedString: _textView.attributedText];
        }
        
        _textView = textView;
        
        for (NSAttributedString * attrStr in self.logMsgCache)
        {
            [entireLog appendAttributedString:[[NSAttributedString alloc] initWithString:@"\n"]];
            [entireLog appendAttributedString:attrStr];
        }
        
        self.textView.attributedText = entireLog;
        
        self.logMsgCache = nil;
        
        [self scrollTextViewToBottom];
    }
}

- (void)setLogColor:(DDColor *)txtColor forFlag:(DDLogFlag)flag
{
    [_colorProfilesDict setValue:txtColor forKey:@(flag).stringValue];
}

//-(void)enableWatchNotificationsForFlags:(DDLogFlag)mask
//{
//    _notificationMask = mask;
//}

- (void)scrollTextViewToBottom
{
    if (self.autoScrollsToBottom)
    {
        //[self.textView scrollRangeToVisible:NSMakeRange(entireLog.length, 0)];
        dispatch_async(dispatch_get_main_queue(), ^(void) {
            NSRange range = NSMakeRange(self.textView.attributedText.length - 1, 1);
            [self.textView scrollRangeToVisible:range];
        });
    }
}

@end
