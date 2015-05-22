//
//  ViewController.h
//  FCLoggerSample
//
//  Created by Federico Cappelli on 08/05/2015.
//  Copyright (c) 2015 Federico Cappelli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property(nonatomic, weak) IBOutlet UITextView * textView;

-(IBAction)addLogHandler:(id)sender;

@end

