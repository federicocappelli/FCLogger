//
//  FCViewController.h
//  FCLogger
//
//  Created by Federico Cappelli on 07/04/2016.
//  Copyright (c) 2016 Federico Cappelli. All rights reserved.
//

@import UIKit;

@interface FCViewController : UIViewController

@property(nonatomic, weak) IBOutlet UITextView * textView;

-(IBAction)addLogHandler:(id)sender;

@end
