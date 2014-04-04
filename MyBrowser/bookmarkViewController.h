//
//  bookmarkViewController.h
//  MyBrowser
//
//  Created by MokshaX on 3/16/14.
//  Copyright (c) 2014 MokshaX. All rights reserved.
//

@protocol clickBookmarkDelegate <NSObject>

@required

- (void)clickBookmark:(NSString *)bookmark;

@end

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "myViewController.h"
@interface bookmarkViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *editBookmarkButton;

@property (nonatomic, weak) id<clickBookmarkDelegate> delegate;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)editBookmark:(id)sender;

- (IBAction)dismiss:(id)sender;



@end
