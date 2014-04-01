//
//  ViewController.h
//  MyBrowser
//
//  Created by MokshaX on 3/10/14.
//  Copyright (c) 2014 MokshaX. All rights reserved.
//

#import "bookmarkViewController.h"
#import <UIKit/UIKit.h>
#import "historyViewController.h"
#import "AppDelegate.h"
#import "Reachability.h"

@interface myViewController : UIViewController <UITextFieldDelegate,UIAlertViewDelegate,secondViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addButton;

- (IBAction)popBookmarkTable:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *addressBar;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UITextField *searchBar;
- (IBAction)goBack:(id)sender;
- (IBAction)goForward:(id)sender;
- (IBAction)refreshWebView:(id)sender;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *goBackButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *goForwardButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *refreshButton;
-(void)textFieldDidEndEditing:(UITextField *)textField;




- (void) loadWebPageFromString:(NSString *)string;


@end
