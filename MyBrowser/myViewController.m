//
//  ViewController.m
//  MyBrowser
//
//  Created by MokshaX on 3/10/14.
//  Copyright (c) 2014 MokshaX. All rights reserved.
//

#import "myViewController.h"


@interface myViewController ()

@end

@implementation myViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
 [self checkConnection ];
  [self.webView loadRequest:[NSURLRequest requestWithURL: [NSURL URLWithString:@"http:/www.google.com/"]]];
    }
-(void)textFieldDidEndEditing:(UITextField *)textField
{
   }
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)googleEntered:(UITextField *)sender {

    [self loadWebPageFromString:self.searchBar.text];
    [sender resignFirstResponder];
    self.addressBar.text=NULL;
 [self checkConnection ];
    
}

- (IBAction)goBack:(id)sender {
    [self.webView goBack];
       }

- (IBAction)goForward:(id)sender {
    [self.webView goForward];
    
}

- (IBAction)refreshWebView:(id)sender {
    [self.webView reload];
    
}

-(void)checkConnection{
    NSURL *scriptUrl = [NSURL URLWithString:@"http://google.com"];
    NSData *data = [NSData dataWithContentsOfURL:scriptUrl];
    if (!data)
    {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No Connection"
    message:@"Your device is not connected to internet."
    delegate:self cancelButtonTitle:@"OK"
    otherButtonTitles:nil];
    [alert show];
        
    }

}


- (void) loadWebPageFromString:(NSString *)string {
    NSURL *url = [NSURL URLWithString:string];
    
  
    
        NSString *googleSearch = [string stringByReplacingOccurrencesOfString:@" " withString:@"+"];
        url = [NSURL URLWithString:[NSString stringWithFormat:@"http://www.google.com/search?q=%@", googleSearch]];
        NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
        [self.webView loadRequest:request];
    }


-(void)loadAddress:(NSString *)mystring{
    NSURL *myurl = [NSURL URLWithString:mystring];
    NSString *address= self.addressBar.text;
    myurl = [NSURL URLWithString:[NSString stringWithFormat:@"http://%@", address]];
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:myurl];
    [self.webView loadRequest:request];
  
        }


-(BOOL)webView:(UIWebView*)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{

    if (navigationType==UIWebViewNavigationTypeLinkClicked) {
        NSURL *URL=[request URL];
        if ([URL scheme] ) {
            self.addressBar.text=URL.absoluteString;
            [self addressEntered:nil];
            [self.webView loadRequest:request];
        }
        return NO;
    }
    return YES;
}




-(IBAction)addressEntered:(UITextField *)sender {
    [self loadAddress:self.addressBar.text];
     [sender resignFirstResponder];
    self.searchBar.text =NULL;

    [self checkConnection ];
    historyViewController *vc=[[historyViewController alloc]init];
    [vc.histories addObject:self.addressBar.text];
    
    
        
    }
@end
