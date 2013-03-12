//
//  ViewController.h
//  ProfanityFilterSample
//
//  Created by John Arnold on 2013-02-27.
//  Copyright (c) 2013 Island of Doom Software Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (assign, nonatomic) IBOutlet UITextField *inputTextField;
@property (assign, nonatomic) IBOutlet UILabel *filteredTextLabel;
- (IBAction)filter:(id)sender;

@end
