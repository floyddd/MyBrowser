//
//  bookmarkViewController.h
//  MyBrowser
//
//  Created by MokshaX on 3/16/14.
//  Copyright (c) 2014 MokshaX. All rights reserved.
//

@protocol secondViewControllerDelegate <NSObject>

@required

- (void)passData:(NSString *)data;

@end

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "myViewController.h"
@interface bookmarkViewController : UIViewController 
@property (nonatomic, weak) id<secondViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)goBac:(id)sender;



@end
