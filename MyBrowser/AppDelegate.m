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
    
    _bookmarksArray = [[NSMutableArray alloc]initWithObjects:@"www.facebook.com",@"www.twitter.com",nil];
    _historyArray = [[NSMutableArray alloc] init];
    NSString *myPath = [self saveFilePath];

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

    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
   
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
  NSLog(@"enter background");
    NSArray *values = [[NSArray alloc] initWithArray:self.bookmarksArray];
	[values writeToFile:[self saveFilePath] atomically:YES];
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}
- (NSString *) saveFilePath
{
	NSArray *path =
	NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
	return [[path objectAtIndex:0] stringByAppendingPathComponent:@"bookmarks.plist"];
    
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
