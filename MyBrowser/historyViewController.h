//
//  historyViewController.h
//  MyBrowser
//
//  Created by MokshaX on 3/24/14.
//  Copyright (c) 2014 MokshaX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface historyViewController : UIViewController
- (IBAction)goBack:(id)sender;
@property(strong,nonatomic) NSMutableArray *histories;
@end
