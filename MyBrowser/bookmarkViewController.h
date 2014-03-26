//
//  bookmarkViewController.h
//  MyBrowser
//
//  Created by MokshaX on 3/16/14.
//  Copyright (c) 2014 MokshaX. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "myViewController.h"

@interface bookmarkViewController : UIViewController


@property (weak, nonatomic) IBOutlet UITableView *tableView;


- (IBAction)goBac:(id)sender;
@property(strong,nonatomic) NSMutableArray *bookmarks;


@end
