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


-(void)loadView
{
    

    [super loadView];
    _goBackButton.enabled = NO;
	
}

- (void)webViewDidFinishLoad:(UIWebView *)webview
{
    if ([_webView canGoBack]) {
        _goBackButton.enabled=YES;
        
    } else _goBackButton.enabled=NO;
    
    if ([_webView canGoForward]) {
        _goForwardButton.enabled=YES;
        
    } else _goForwardButton.enabled=NO;

    
}

- (void)checkForWIFIConnection {
    Reachability* wifiReach = [Reachability reachabilityForLocalWiFi];
    
    NetworkStatus netStatus = [wifiReach currentReachabilityStatus];
    Reachability* wanReach = [Reachability reachabilityForInternetConnection];
    
    NetworkStatus netStat = [wanReach currentReachabilityStatus];
    if (netStatus!=ReachableViaWiFi && netStat!=ReachableViaWWAN)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No Internet Connection"
                                                        message:@"Your device is not connected to internet."
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];

        
    
    }
}



- (void)addItemViewController:(bookmarkViewController *)controller didFinishEnteringItem:(NSString *)item{
    
    
    
    
    
}




- (void)viewDidLoad
{
    
    self.addButton.enabled=NO;
    self.goBackButton.enabled=NO;
    self.goForwardButton.enabled=NO;
    [self checkForWIFIConnection];
    
    [super viewDidLoad];
    }


-(void)textFieldDidEndEditing :(UITextField *)textField
{
    
    
    if (textField.text){
        
        if (textField==self.searchBar){
            self.addButton.enabled=YES;
            AppDelegate *historydelegate= (AppDelegate *)[[UIApplication sharedApplication]delegate];
            NSMutableArray *a=historydelegate.historyArray;
            NSString *b=[NSString stringWithFormat:@"google.com/search?q=%@",textField.text] ;
            [a addObject:b];
        
        } else if (textField==self.addressBar){
        self.addButton.enabled=YES;
        AppDelegate *historydelegate= (AppDelegate *)[[UIApplication sharedApplication]delegate];
        NSMutableArray *a=historydelegate.historyArray;
        NSString *b=self.addressBar.text;
        [a addObject:b];
        }}
}


   
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)googleEntered:(UITextField *)sender {
   
        [self loadWebPageFromString:self.searchBar.text];
     self.addressBar.text=[NSString stringWithFormat: @"google.com/search?q=%@",self.searchBar.text] ;
    [self textFieldDidEndEditing:self.searchBar];
        self.addButton.enabled=YES;
   
       
    
}


- (IBAction)goBack:(id)sender {
    [self.webView goBack];
   
    self.searchBar.text=NULL;
    self.addressBar.text=NULL;
}

- (IBAction)goForward:(id)sender {
        [self.webView goForward];
    self.searchBar.text=NULL;
   
}

- (IBAction)refreshWebView:(id)sender {
    [self.webView reload];

    
    [self checkForWIFIConnection];
    
    
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    AppDelegate *maindelegate= (AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSMutableArray *a=maindelegate.bookmarksArray;
        if([segue.identifier isEqualToString:@"segueOne"]){
            
            if ([self.addressBar.text length]!=0){
                NSString *b=[NSString stringWithFormat:@"%@",self.addressBar.text];
                [a addObject:b];
                
               
                
            }}}
   
    - (void) loadWebPageFromString:(NSString *)string {
    NSURL *url = [NSURL URLWithString:string];
    
      
        
        [self checkForWIFIConnection];
    
        NSString *googleSearch = [string stringByReplacingOccurrencesOfString:@" " withString:@"+"];
        url = [NSURL URLWithString:[NSString stringWithFormat:@"http://www.google.com/search?q=%@", googleSearch]];
        NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
        [self.webView loadRequest:request];
    }


-(void)loadAddress:(NSString *)mystring{
       [self checkForWIFIConnection];
        NSURL *myurl = [NSURL URLWithString:mystring];
    NSString *address=self.addressBar.text;
    myurl = [NSURL URLWithString:[NSString stringWithFormat:@"http://%@", address]];
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:myurl];
    [self.webView loadRequest:request];
  
        }


-(BOOL)webView:(UIWebView*)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
  
  

    if (navigationType==UIWebViewNavigationTypeLinkClicked) {
        
        NSURL *URL=[request URL];
        AppDelegate *historydelegate= (AppDelegate *)[[UIApplication sharedApplication]delegate];
        NSMutableArray *a=historydelegate.historyArray;
        [a addObject:URL.absoluteString];
                [self checkForWIFIConnection];
        if ([URL scheme] ) {
            
            self.addressBar.text=URL.absoluteString;
            self.searchBar.text=NULL;
            
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
    
    
        
    }
@end
