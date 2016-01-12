# CSKeyNavigationController
CSKeyNavigationController 用key来导航的NavigationController


# 当前阶段
0.1版本

# 奉献者记录

- 苏冠超([ChaoSo](https://github.com/KoonChaoSo))

# 开始使用
## AppDelegate.m
```objective-c
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];

    UIViewController *mainVC = [UIStoryboard storyboardWithName:@"Main" bundle:nil].instantiateInitialViewController;
    CSKeyNavigationController *navC = [[CSKeyNavigationController alloc] initWithRootViewController:mainVC];

    self.window.rootViewController = navC;
    return YES;
}
```
