#FCLogger
FCLogger is a DDAbstractLogger implementation that allow all the CocoaLumberjack logs to be displayed inside the app, supports custom colors (Like **XCodeColors**).

### Screenshots:

<img src="Example/Screenshots/fcLogger_sc1.png?raw=true" alt="Screenshot 1" width="200">

##Install
###Cocoapod
Add the pod to your podfile

```
pod 'FCLogger'
```
###Manual
Import the files in your project

```
FCLogger.hFCLogger.m
```

## How to use:
Have a look to the **FCLoggerSample** app provided.

## Steps
* Setup **Cocoalumberjack** as usual
* Import FCLogger

```
	 #import <FCLogger/FCLogger.h>
```
* Create your own **UITextView** in any part of your app
* Create and configure the logger:

```
// create the FC logger
self.fcLogger = [[FCLogger alloc] init];
    
//assign a standard UITextView
self.fcLogger.textView = self.textView;

//enable auto scroll
self.fcLogger.autoScrollsToBottom = YES;
    
//enable colors support
self.fcLogger.colorsEnabled = YES;
    
//add logger to CocoaLumberjack
[DDLog addLogger:self.fcLogger];
    
//set custom color for specific log flag
[self.fcLogger setLogColor:[UIColor blueColor] forFlag:DDLogFlagDebug];
```
* Use **Cocoalumberjack** as usual

```
DDLogDebug(@"Test debug log");
DDLogError(@"Test error log");

```