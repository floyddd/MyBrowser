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
    [_goBackButton setEnabled:NO];
	
}

- (void)webViewDidFinishLoad:(UIWebView *)webview
{
    
   
    _addButton.enabled=YES;
    _refreshButton.enabled=YES;
    if ([_webView canGoBack]) {
        [_goBackButton setEnabled:YES];
        
    } else [_goBackButton setEnabled:NO];
    
    if ([_webView canGoForward]) {
        [_goForwardButton setEnabled:YES];
        
    } else _goForwardButton.enabled=NO;

    
}

-(void)showAlert{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No Internet Connection"
                                                    message:@"Your device is not connected to internet."
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}
- (void)checkForWIFIConnection {
    Reachability* wifiReach = [Reachability reachabilityForLocalWiFi];
    
    NetworkStatus netStatus = [wifiReach currentReachabilityStatus];
   
    if (netStatus!=ReachableViaWiFi)
    {
        [self showAlert];
    }
}







- (void)viewDidLoad
{
    
        _refreshButton.enabled=NO;
    _addButton.enabled=NO;
    [_goBackButton setEnabled:NO];
    _goForwardButton.enabled=NO;
    [self checkForWIFIConnection];
    
    [super viewDidLoad];
    }


-(void)textFieldDidEndEditing :(UITextField *)textField
{
    
    
    if (textField.text){
        
        if (textField==_searchBar){
            
            AppDelegate *historydelegate= (AppDelegate *)[[UIApplication sharedApplication]delegate];
            NSMutableArray *a=historydelegate.historyArray;
            NSString *b=[NSString stringWithFormat:@"http://www.google.com/search?q=%@",textField.text] ;
            [a addObject:b];
        
        }}}


   
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)googleEntered:(UITextField *)sender {
    
    
    Reachability* wifiReach = [Reachability reachabilityForLocalWiFi];
    
    NetworkStatus netStatus = [wifiReach currentReachabilityStatus];
    
    if (netStatus==ReachableViaWiFi){
        [self loadWebPageFromString:_searchBar.text];
        [self textFieldDidEndEditing:_searchBar];
        _addressBar.text=[NSString stringWithFormat: @"http://www.google.com/search?q=%@",_searchBar.text] ;
    }else {[self checkForWIFIConnection];self.addressBar.text=NULL;}
       
    
}


- (IBAction)goBack:(id)sender {
    [_webView goBack];
   
    _searchBar.text=NULL;
    _addressBar.text=NULL;
}

- (IBAction)goForward:(id)sender {
        [_webView goForward];
    _searchBar.text=NULL;
   
}

- (IBAction)refreshWebView:(id)sender {
    [_webView reload];

    
    [self checkForWIFIConnection];
    
    
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    AppDelegate *maindelegate= (AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSMutableArray *a=maindelegate.bookmarksArray;
        if([segue.identifier isEqualToString:@"segueOne"]){
            
            if ([_addressBar.text length]!=0){
                NSString *b=[NSString stringWithFormat:@"%@",_addressBar.text];
                [a addObject:b];
                
               
                
            }}}
   
    - (void) loadWebPageFromString:(NSString *)string {
    NSURL *url = [NSURL URLWithString:string];
    
      
        
       
    
        NSString *googleSearch = [string stringByReplacingOccurrencesOfString:@" " withString:@"+"];
        url = [NSURL URLWithString:[NSString stringWithFormat:@"http://www.google.com/search?q=%@", googleSearch]];
        NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
        [_webView loadRequest:request];
    }


-(void)loadAddress:(NSString *)mystring{
    
        NSURL *myurl = [NSURL URLWithString:mystring];
    if(!myurl.scheme){
    myurl = [NSURL URLWithString:[NSString stringWithFormat:@"http://%@", mystring]];
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:myurl];
    [_webView loadRequest:request];}
    else{
        myurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@", mystring]];
        
        NSURLRequest *request = [[NSURLRequest alloc] initWithURL:myurl];
        [_webView loadRequest:request];
    
    }
  
        }


-(BOOL)webView:(UIWebView*)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
  

    if (navigationType==UIWebViewNavigationTypeLinkClicked) {
        
        NSURL *URL=[request URL];
        
                [self checkForWIFIConnection];
        if ([URL scheme] ) {
            Reachability* wifiReach = [Reachability reachabilityForLocalWiFi];
            
            NetworkStatus netStatus = [wifiReach currentReachabilityStatus];
            
            if (netStatus==ReachableViaWiFi ){
                _addressBar.text=URL.absoluteString;
                _searchBar.text=NULL;
                [_webView loadRequest:request];
                AppDelegate *historydelegate= (AppDelegate *)[[UIApplication sharedApplication]delegate];
                NSMutableArray *a=historydelegate.historyArray;
                [a addObject:URL.absoluteString];
            }

            
            
            
        }
        return NO;
    }
    return YES;
    
}

- (BOOL) urlIsValid: (NSString *) url
{
    NSString *regex =
    @"((?:http|https)://)?(?:www\\.)?[\\w\\d\\-_]+\\.\\w{2,3}(\\.\\w{2})?(/(?<=/)(?:[\\w\\d\\-./_]+)?)?";
    /// OR use this
    ///NSString *regex = "(http|ftp|https)://[\w-_]+(.[\w-_]+)+([\w-.,@?^=%&:/~+#]* [\w-\@?^=%&/~+#])?";
    NSPredicate *regextest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    if ([regextest evaluateWithObject: url] == NO) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid URL"
                                                        message:@"Enter valid URL."
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
    
    return [regextest evaluateWithObject:url];
}

-(IBAction)addressEntered:(UITextField *)sender {
        Reachability* wifiReach = [Reachability reachabilityForLocalWiFi];
    
    NetworkStatus netStatus = [wifiReach currentReachabilityStatus];
    
    if (netStatus==ReachableViaWiFi && [self urlIsValid:_addressBar.text]){
       
        
        
    [self loadAddress:_addressBar.text];
        AppDelegate *historydelegate= (AppDelegate *)[[UIApplication sharedApplication]delegate];
        NSMutableArray *a=historydelegate.historyArray;
        
        [a addObject:_addressBar.text];

    }else [self checkForWIFIConnection];
    [sender resignFirstResponder];
    _searchBar.text =NULL;
    
}

- (void)clickBookmark:(NSString *)bookmark
{
    [self loadAddress:bookmark];
          _addressBar.text=bookmark;
    
    }

- (void)clickHistory:(NSString *)history
{
    [self loadAddress:history];
    _addressBar.text=history;
    
}

- (IBAction)popHistoryTable:(id)sender {
    UIStoryboard *a = [UIStoryboard storyboardWithName:[[NSBundle mainBundle].infoDictionary objectForKey:@"UIMainStoryboardFile"] bundle:[NSBundle mainBundle]];
    historyViewController *new = [a instantiateViewControllerWithIdentifier:@"historyViewController"];
    [self presentViewController:new animated:YES completion:nil];
    
    new.delegate=self;
    
}

- (IBAction)newTab:(id)sender {
    
    UIStoryboard *st = [UIStoryboard storyboardWithName:[[NSBundle mainBundle].infoDictionary objectForKey:@"UIMainStoryboardFile"] bundle:[NSBundle mainBundle]];
    myViewController *newTab = [st instantiateViewControllerWithIdentifier:@"myViewController"];
    [self presentViewController:newTab animated:YES completion:nil];
    AppDelegate *historydelegate= (AppDelegate *)[[UIApplication sharedApplication]delegate];
    [historydelegate.arrayOfControllers addObject:newTab];
    
    
    
}
- (IBAction)previousTab:(id)sender {
  AppDelegate *historydelegate= (AppDelegate *)[[UIApplication sharedApplication]delegate];
    int i;
    for (i=0; i<[historydelegate.arrayOfControllers count]; i++) {
    [[historydelegate.arrayOfControllers objectAtIndex:i  ]
                       dismissViewControllerAnimated:YES completion:nil
     ];
      
    }
}


- (IBAction)popBookmarkTable:(id)sender {
    UIStoryboard *st = [UIStoryboard storyboardWithName:[[NSBundle mainBundle].infoDictionary objectForKey:@"UIMainStoryboardFile"] bundle:[NSBundle mainBundle]];
    bookmarkViewController *secView = [st instantiateViewControllerWithIdentifier:@"bookmarkViewController"];
[self presentViewController:secView animated:YES completion:nil];
    
    secView.delegate=self;

    
}
- (IBAction)nextTab:(id)sender {
    AppDelegate *historydelegate= (AppDelegate *)[[UIApplication sharedApplication]delegate];
    int i;
    for (i=0; i<[historydelegate.arrayOfControllers count]; i++) {
        [self presentViewController:[historydelegate.arrayOfControllers objectAtIndex:[historydelegate.arrayOfControllers count]-i  ] animated:YES completion:nil];
    }
}
@end
