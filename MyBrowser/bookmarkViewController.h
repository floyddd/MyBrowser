//
//  bookmarkViewController.h
//  MyBrowser
//
//  Created by MokshaX on 3/16/14.
//  Copyright (c) 2014 MokshaX. All rights reserved.
//
@class bookmarkViewController;
@protocol passTextfield <NSObject>

- (void)addItemViewController:(bookmarkViewController *)controller didFinishEnteringItem:(NSString *)item;

@end
#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "myViewController.h"
@interface bookmarkViewController : UIViewController 


@property (weak, nonatomic) IBOutlet UITableView *tableView;


- (IBAction)goBac:(id)sender;



@end
