//
//  AppDelegate.m
//  Thousands
//
//  Created by SeaHub on 15/9/9.
//  Copyright (c) 2015年 S3Develop. All rights reserved.
//

#import "AppDelegate.h"
#import "ShowsTableViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.window setBackgroundColor:[UIColor whiteColor]];
    
    ShowsTableViewController *showsTableViewController = [[ShowsTableViewController alloc]init];
    UINavigationController *navigationController = [[UINavigationController alloc]initWithRootViewController:showsTableViewController];
    [navigationController setNavigationBarHidden:YES];
    self.window.rootViewController = navigationController;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
   
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
   }

- (void)applicationWillEnterForeground:(UIApplication *)application {
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {

}

- (void)applicationWillTerminate:(UIApplication *)application {
  
}

@end
