//
//  AppDelegate.m
//  FlickrProject
//
//  Created by Aranha, Vivian H on 1/31/13.
//  Copyright (c) 2013 Aranha, Vivian H. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    //Adding a TableViewController with NavigationController to Window
    
    MasterViewController *masterViewController = [[MasterViewController alloc] initWithStyle:UITableViewStyleGrouped];
    masterViewController.title = @"Flickr";
    
    UINavigationController *theNavig = [[UINavigationController alloc] initWithRootViewController:masterViewController];
    theNavig.navigationBar.tintColor = [UIColor blackColor];
    self.window.rootViewController = theNavig;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
