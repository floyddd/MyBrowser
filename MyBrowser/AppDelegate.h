//
//  AppDelegate.h
//  MyBrowser
//
//  Created by MokshaX on 3/10/14.
//  Copyright (c) 2014 MokshaX. All rights reserved.
//


#import <UIKit/UIKit.h>

#import "Reachability.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
   
}

@property (strong, nonatomic) UIWindow *window;
@property(nonatomic,retain) NSMutableArray *bookmarksArray;
@property(nonatomic,retain) NSMutableArray *historyArray;
@end
