#FCLogger
FCLogger is a DDAbstractLogger implementation, usefull for log inside the app all the CocoaLumberjack logs, supports custom colors (Like XCodeColors ) and implements apple watch custom notifications.

##Requirements
CocoaLumberjack

## Screenshots:

<img src="https://github.com/federicocappelli/FCLogger/blob/master/Screenshots/fcLogger_sc1.png?raw=true" alt="Screenshot 1" width="200">

## How to use:
Have a look to the **FCLoggerSample** app provided.

## Steps
 1. import "FCLogger.h"
 2. Create your own UITextView in any part of your app
 3. Create the logger, configure it and set the UItextView, an example:

```
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

```
## TODO:
- Apple watch dynamic notification
