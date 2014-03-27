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
- (NSString *) saveFilePath
{
	NSArray *path =
	NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
	return [[path objectAtIndex:0] stringByAppendingPathComponent:@"savefile.plist"];
    
}



- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}



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
    NSMutableArray *a=maindelegate.bookmarksArray;
    cell.textLabel.text = [a objectAtIndex:indexPath.row];
    return cell;
   
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row==0) {
        
    }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    AppDelegate *maindelegate= (AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSMutableArray *a=maindelegate.bookmarksArray;
    return [a count];
}
- (void)viewDidLoad
{
    
        AppDelegate *maindelegate= (AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSMutableArray *a=maindelegate.bookmarksArray;
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    NSData * bookmarks = [defaults objectForKey:@"bookmarks"];
    if (bookmarks) {
        a = [[NSMutableArray alloc] initWithArray:[NSKeyedUnarchiver unarchiveObjectWithData:bookmarks]];
    } else {
        a = [[NSMutableArray alloc] initWithCapacity:1];
    }
    [self.tableView reloadData];
    NSString *myPath = [self saveFilePath];
    
	BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:myPath];
    
	if (fileExists)
	{
        
		a = [[NSMutableArray alloc] initWithContentsOfFile:myPath];
        maindelegate.bookmarksArray=a;
        UIApplication *myApp = [UIApplication sharedApplication];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(applicationDidEnterBackground:)
                                                     name:UIApplicationDidEnterBackgroundNotification
                                                   object:myApp];
    }
[super viewDidLoad];
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
