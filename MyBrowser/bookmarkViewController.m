//
//  bookmarkViewController.m
//  MyBrowser
//
//  Created by MokshaX on 3/16/14.
//  Copyright (c) 2014 MokshaX. All rights reserved.
//

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
    AppDelegate *maindelegate= (AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSMutableArray *a=[maindelegate bookmarksArray];
    cell.textLabel.text = [a objectAtIndex:[indexPath row]];
    return cell;
   
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
   UITableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    
    AppDelegate *maindelegate= (AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSMutableArray *a=[maindelegate bookmarksArray];
    int i;
    for (i=0; i<[a count]; i++) {
        
    
              if ([indexPath row]==i) {
                  
                  [_delegate clickBookmark:cell.textLabel.text];
                  [self dismissViewControllerAnimated:YES completion:nil];
                 
                
              
              }
              
              }
    
}
                  
 


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    AppDelegate *maindelegate= (AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSMutableArray *a=[maindelegate bookmarksArray];
    return [a count];
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



- (IBAction)goBac:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    }
@end
