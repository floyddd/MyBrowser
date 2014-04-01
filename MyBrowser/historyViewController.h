//
//  historyViewController.h
//  MyBrowser
//
//  Created by MokshaX on 3/24/14.
//  Copyright (c) 2014 MokshaX. All rights reserved.
//

@protocol clickHistoryDelegate <NSObject>

@required

- (void)clickHistory:(NSString *)history;

@end

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
@interface historyViewController : UIViewController
- (IBAction)goBack:(id)sender;
@property (nonatomic, weak) id<clickHistoryDelegate> delegate;

- (IBAction)clearHistory:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
