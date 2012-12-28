
#import "QuickContactsAppDelegate.h"

@implementation QuickContactsAppDelegate
@synthesize window;
@synthesize navigationController;

- (void)applicationDidFinishLaunching:(UIApplication *)application 
{    
    [window addSubview:navigationController.view];
	// Override point for customization after application launch
    [window makeKeyAndVisible];
}


- (void)dealloc
{
	[navigationController release];
    [window release];
    [super dealloc];
}

@end
