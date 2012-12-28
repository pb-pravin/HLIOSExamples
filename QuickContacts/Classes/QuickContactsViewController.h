
#import <UIKit/UIKit.h>
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>

@interface QuickContactsViewController : UITableViewController < ABPeoplePickerNavigationControllerDelegate,
																 ABPersonViewControllerDelegate,
															     ABNewPersonViewControllerDelegate,
												                 ABUnknownPersonViewControllerDelegate>
{
	NSMutableArray *menuArray;
}
@property (nonatomic, retain) NSMutableArray *menuArray;

-(void)showPeoplePickerController;
-(void)showPersonViewController;
-(void)showNewPersonViewController;
-(void)showUnknownPersonViewController;

@end
