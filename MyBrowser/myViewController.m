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
    if (self.checkConnection==YES) {
        self.noConnectionLabel.hidden=YES;
    }
 self.addButton.enabled=NO;
    
}
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    self.addButton.enabled=YES;
   }
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)googleEntered:(UITextField *)sender {

    [self loadWebPageFromString:self.searchBar.text];
    [sender resignFirstResponder];
    self.addressBar.text=@"http://www.google.com/search?q=%@",[self.searchBar text ];
        self.addButton.enabled=YES;
    if (self.checkConnection) {
        self.noConnectionLabel.hidden=YES;
    } else if (!self.checkConnection){
        self.noConnectionLabel.hidden=NO;
        [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"about:blank"]]];
    }
}

- (IBAction)goBack:(id)sender {
    [self.webView goBack];
        self.searchBar.text=NULL;
       }

- (IBAction)goForward:(id)sender {
    [self.webView goForward];
    
}

- (IBAction)refreshWebView:(id)sender {
    [self.webView reload];
    
}

-(BOOL)checkConnection{
    NSURL *scriptUrl = [NSURL URLWithString:@"http://google.com"];
    NSData *data = [NSData dataWithContentsOfURL:scriptUrl];
    if (!data)
    {
 
        return NO;
    }
 return YES;
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    AppDelegate *maindelegate= (AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSMutableArray *a=maindelegate.sharedArray;
        if([segue.identifier isEqualToString:@"segueOne"]){
            
            if ([self.addressBar.text length]!=0){
                
                [a addObject:self.addressBar.text];
            
        
            }}}
   
    - (void) loadWebPageFromString:(NSString *)string {
    NSURL *url = [NSURL URLWithString:string];
    
  
    
        NSString *googleSearch = [string stringByReplacingOccurrencesOfString:@" " withString:@"+"];
        url = [NSURL URLWithString:[NSString stringWithFormat:@"http://www.google.com/search?q=%@", googleSearch]];
        NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
        [self.webView loadRequest:request];
    }


-(void)loadAddress:(NSString *)mystring{
        NSURL *myurl = [NSURL URLWithString:mystring];
    NSString *address=self.addressBar.text;
    myurl = [NSURL URLWithString:[NSString stringWithFormat:@"http://%@", address]];
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:myurl];
    [self.webView loadRequest:request];
  
        }


-(BOOL)webView:(UIWebView*)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{

    if (navigationType==UIWebViewNavigationTypeLinkClicked) {
       
        NSURL *URL=[request URL];
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
    self.addressBar.text=[NSString stringWithFormat:@"http://www.%@",self.addressBar.text];
    [sender resignFirstResponder];
    self.searchBar.text =NULL;
    if (self.checkConnection) {
        self.noConnectionLabel.hidden=YES;
    } else if (!self.checkConnection){
        self.noConnectionLabel.hidden=NO;
        [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"about:blank"]]];
    }
    
    
    
        
    }
@end
