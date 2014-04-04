//
//  AppDelegate.m
//  MyBrowser
//
//  Created by MokshaX on 3/10/14.
//  Copyright (c) 2014 MokshaX. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    
    _bookmarksArray = [[NSMutableArray alloc]initWithObjects:@"http://www.facebook.com",@"http://www.twitter.com",@"http://www.imdb.com",nil];
    _historyArray = [[NSMutableArray alloc] init];
    NSString *myPath = [self saveBookmark];

    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    NSData *bookmarks = [defaults objectForKey:@"bookmarksArray"];
    if (bookmarks) {
     NSMutableArray   *w= [NSKeyedUnarchiver unarchiveObjectWithData:bookmarks];
        [_bookmarksArray addObjectsFromArray:w];
    }
    
    BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:myPath];
    if (fileExists)
	{
    NSMutableArray *b = [[NSMutableArray alloc] initWithContentsOfFile:myPath];
        _bookmarksArray =b;
   
    }

    NSString *historypath = [self saveHistory];
    
    NSUserDefaults * defaultsHistory = [NSUserDefaults standardUserDefaults];
    NSData *histories = [defaultsHistory objectForKey:@"historiesArray"];
    if (histories) {
        NSMutableArray   *q= [NSKeyedUnarchiver unarchiveObjectWithData:bookmarks];
        [_historyArray addObjectsFromArray:q];
    }
    
    BOOL historyfileExists = [[NSFileManager defaultManager] fileExistsAtPath:historypath];
    if (historyfileExists)
	{
        NSMutableArray *b = [[NSMutableArray alloc] initWithContentsOfFile:historypath];
        _historyArray =b;
        
    }

    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
  
    NSArray *bookmarksValues = [[NSArray alloc] initWithArray:self.bookmarksArray];
	[bookmarksValues writeToFile:[self saveBookmark] atomically:YES];
    NSArray *historyValues = [[NSArray alloc] initWithArray:self.historyArray];
	[historyValues writeToFile:[self saveHistory] atomically:YES];
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}
- (NSString *) saveBookmark
{
	NSArray *path =
	NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
	return [[path objectAtIndex:0] stringByAppendingPathComponent:@"bookmarklist.plist"];
    
}
- (NSString *) saveHistory
{
	NSArray *historyPath =
	NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
	return [[historyPath objectAtIndex:0] stringByAppendingPathComponent:@"historylist.plist"];
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    
         // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
