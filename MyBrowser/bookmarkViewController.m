//
//  bookmarkViewController.m
//  MyBrowser
//
//  Created by MokshaX on 3/16/14.
//  Copyright (c) 2014 MokshaX. All rights reserved.
//
#define delegatez  (((AppDelegate *)[[UIApplication sharedApplication] delegate]))
#define b [delegatez bookmarksArray]
#import "bookmarkViewController.h"
#import "AppDelegate.h"
@interface bookmarkViewController ()

@end

@implementation bookmarkViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    
    return 1;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    
    cell.textLabel.text = [b objectAtIndex:[indexPath row]];
    return cell;
   
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
   UITableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    
    AppDelegate *maindelegate= (AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    int i;
    for (i=0; i<[b count]; i++) {
        
    
              if ([indexPath row]==i) {
                  Reachability* wifiReach = [Reachability reachabilityForLocalWiFi];
                  
                  NetworkStatus netStatus = [wifiReach currentReachabilityStatus];
                  
                  if (netStatus==ReachableViaWiFi){
                  [_delegate clickBookmark:cell.textLabel.text];
                  [maindelegate.historyArray addObject:cell.textLabel.text];
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


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    
    return [b count];
}



- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        int index = indexPath.row;
        
        [b removeObjectAtIndex:index];

        
        [_tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                         withRowAnimation:UITableViewRowAnimationFade];
        
        
    }
}
-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    
    
    NSString *sourceItem = b[sourceIndexPath.row];
    [b removeObjectAtIndex:sourceIndexPath.row];
    [b insertObject:sourceItem atIndex:destinationIndexPath.row];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        return NO;}if (indexPath.row==1) {
            return NO;}
    
   else return YES;
}


- (void)viewDidLoad
{
   
   [super viewDidLoad];
    [[self tableView] reloadData];
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)editBookmark:(id)sender{
    if ([_editBookmarkButton.currentTitle isEqualToString:@"Edit"]) {
        
    
        [        _tableView setEditing:YES animated:YES ];
    [_editBookmarkButton setTitle:@"Done" forState:UIControlStateNormal];
    } else {[_editBookmarkButton setTitle:@"Edit" forState:UIControlStateNormal];
        [        _tableView setEditing:NO animated:YES ];

}
}


- (IBAction)dismiss:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    }
@end
