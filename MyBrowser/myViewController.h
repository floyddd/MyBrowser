//
//  ViewController.h
//  MyBrowser
//
//  Created by MokshaX on 3/10/14.
//  Copyright (c) 2014 MokshaX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "historyViewController.h"

@interface myViewController : UIViewController <UITextFieldDelegate,UIAlertViewDelegate>


@property (weak, nonatomic) IBOutlet UITextField *addressBar;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UITextField *searchBar;
- (IBAction)goBack:(id)sender;
- (IBAction)goForward:(id)sender;
- (IBAction)refreshWebView:(id)sender;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *goBackButton;



-(void)checkConnection;

- (void) loadWebPageFromString:(NSString *)string;


@end
