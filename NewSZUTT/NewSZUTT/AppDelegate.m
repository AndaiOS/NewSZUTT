//
//  AppDelegate.m
//  NewSZUTT
//
//  Created by 安达 on 16/3/30.
//  Copyright © 2016年 安达. All rights reserved.
//

#import "AppDelegate.h"
#import "LessonViewController.h"
#import "ProfileViewController.h"
#import "DiscoverViewController.h"
#import "LoginViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    NSString * flag = [[NSUserDefaults standardUserDefaults]objectForKey:@"clicklogout"];
    
    if(![[NSUserDefaults standardUserDefaults] boolForKey:@"firstLaunch"] || [flag isEqualToString:@"1"]){
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"firstLaunch"];
        NSLog(@"第一次启动或者点击了退出登录按钮还没有重新登录");
        //跳转至登录页面
        LoginViewController * loginVC = [[LoginViewController alloc]init];
        self.loginNav = [[UINavigationController alloc] initWithRootViewController:loginVC];
        
        self.window.rootViewController = self.loginNav;
        [self.window makeKeyAndVisible];
    }else{
        
        self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        LessonViewController *lessonVC = [[LessonViewController alloc]init];
        lessonVC.title = @"课程";
        lessonVC.tabBarItem.image = [[UIImage imageNamed:@"home_toolbar_fresh_icon.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        lessonVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"home_toolbar_fresh_icon_selected_meitu.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        self.lessonNav = [[UINavigationController alloc] initWithRootViewController:lessonVC];
        
        DiscoverViewController *discoverVC = [[DiscoverViewController alloc]init];
        discoverVC.title = @"发现";
        discoverVC.tabBarItem.image = [[UIImage imageNamed:@"home_toolbar_discover_icon.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        discoverVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"home_toolbar_discover_icon_selected_meitu.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        self.discoverNav = [[UINavigationController alloc] initWithRootViewController:discoverVC];
        
        ProfileViewController *profileVC = [[ProfileViewController alloc]init];
        profileVC.title = @"我";
        profileVC.tabBarItem.image = [[UIImage imageNamed:@"home_toolbar_me_icon.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        profileVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"home_toolbar_me_icon_selected_meitu.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        self.profileNav = [[UINavigationController alloc] initWithRootViewController:profileVC];
        
        self.tabBarController = [[UITabBarController alloc] init];
        self.tabBarController.viewControllers = @[self.lessonNav, self.discoverNav,self.profileNav];
        
        self.window.rootViewController = self.tabBarController;
        [self.window makeKeyAndVisible];

    }
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
