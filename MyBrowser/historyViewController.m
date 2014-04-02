//
//  historyViewController.m
//  MyBrowser
//
//  Created by MokshaX on 3/24/14.
//  Copyright (c) 2014 MokshaX. All rights reserved.
//

#import "historyViewController.h"

@interface historyViewController ()

@end

@implementation historyViewController

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    
    AppDelegate *maindelegate= (AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSMutableArray *a=[maindelegate historyArray];
    int i;
    for (i=0; i<[a count]; i++) {
        
        
        if ([indexPath row]==i) {
            Reachability* wifiReach = [Reachability reachabilityForLocalWiFi];
            
            NetworkStatus netStatus = [wifiReach currentReachabilityStatus];
            
            if (netStatus==ReachableViaWiFi){
            [_delegate clickHistory:cell.textLabel.text];
            [a addObject:cell.textLabel.text];
            [self dismissViewControllerAnimated:YES completion:nil];
            
            } else [self showAlert];
            
        }
        
    }
    
}
-(void)showAlert{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No Internet Connection"
                                                    message:@"Your device is not connected to internet."
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    AppDelegate *historydelegate= (AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSMutableArray *a=historydelegate.historyArray;
    // Return the number of rows in the section.
    return [a count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"historyCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    AppDelegate *historydelegate= (AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSMutableArray *a=historydelegate.historyArray;
    cell.textLabel.text = [a objectAtIndex:indexPath.row];
    return cell;
    
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
       	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)clearHistory:(UIButton *)sender {
    AppDelegate *historydelegate= (AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    [historydelegate.historyArray removeAllObjects ];
                       
    [_tableView reloadData];
}
@end
