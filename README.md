# CSKeyNavigationController
CSKeyNavigationController push ViewController With Key ! You can push easily to other viewcontroller and pop another with key.

# Version
  V0.1

# Who is behind?
- ChaoSo([ChaoSo](https://github.com/KoonChaoSo))

# Get Started
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
# License
MIT License
