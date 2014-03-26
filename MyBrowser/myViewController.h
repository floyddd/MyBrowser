//
//  ViewController.h
//  MyBrowser
//
//  Created by MokshaX on 3/10/14.
//  Copyright (c) 2014 MokshaX. All rights reserved.
//
@class myViewController;
@protocol passTextfield <NSObject>

- (void)addItemViewController:(myViewController *)controller didFinishEnteringItem:(NSString *)item;

@end
#import "bookmarkViewController.h"
#import <UIKit/UIKit.h>
#import "historyViewController.h"
#import "AppDelegate.h"

@interface myViewController : UIViewController <UITextFieldDelegate,UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addButton;


@property (weak, nonatomic) IBOutlet UILabel *noConnectionLabel;
@property (weak, nonatomic) IBOutlet UITextField *addressBar;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UITextField *searchBar;
- (IBAction)goBack:(id)sender;
- (IBAction)goForward:(id)sender;
- (IBAction)refreshWebView:(id)sender;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *goBackButton;

@property (nonatomic, weak) id <passTextfield> delegate;

-(BOOL)checkConnection;

- (void) loadWebPageFromString:(NSString *)string;


@end
