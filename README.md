HLIOSExamples
=============

A collection of examples of my IOS code

### ControlDemo (ARC project)
1. Demo how to use corner radius.
2. Demo how to use SDWebImage library.
3. Demo Labels, buttons, and image views.
4. Demo how to use NSAttributedString
5. Demo how to open the phone application to make a dial.
6. Demo the delegate methods of text field and text view.
7. URL -> NSData -> UIImage
8. Another way of automatic ajusta label's height according to its content.
9. Demo how to handle a UIView object's event. And demo the usage of inputView / firstResponder
10. Demo how to handle emotion event.

### LabelTextFieldCellDemo
1. LabelTextFieldCell
2. Customized UINavigationBar and UINavigationItem
2. ModalView
3. Change the background image of UISearchBar
4. Demo how to access address book
5. Demo how to center an image in a UIImageView
6. Demo the usage of memory warning

![LabelTextFieldCell](http://www.anhailin.co/blog/wp-content/uploads/2012/12/LabelTextFieldCell.png)
![](http://www.anhailin.co/blog/wp-content/uploads/2012/12/UISeachBarChnagingBackgroundImage.png)

### AutoSize
1. How to animate view change between potrait and landscape

![](http://www.anhailin.co/blog/wp-content/uploads/2012/12/AutoSize_landscape.png)
![](http://www.anhailin.co/blog/wp-content/uploads/2012/12/AutoSize_Potrait.png)

### TextFieldDemo
1. TextFieldCell
2. configure the background image of UINavigationBar.
3. customize title view for UINavigationItem.
4. configure the background image of UIBarButtonItem.
5. make a UIImageView clickable
6. demo how to use long press guesture recognizer.

![](http://www.anhailin.co/blog/wp-content/uploads/2013/01/TextFieldCellDemo-e1357111612984.png)

### ObjcTest
This project is primarly for testing some features of Objective-C language.

1. Test `+initialize` NSObject class method, which is invoked before it's used.
2. Test `+load` NSObject class method, which is  invoked whenever a class or category is added to the Objective-C runtime; 
3. Demo how to use NSMutableIndexSet.
4. Demo how to use NSRange struct.
5. Demo how to use NSRegularExpression class
6. Demo the convertion from string to int
7. Demo the path property of NSURL object
8. Demo the character replacement method of NSMutableString
9. NSLog format specifiers guide
10. Demo NSDate method: + (NSDate *)dateWithTimeIntervalSince1970:(NSTimeInterval)secs;
11. Demo NSString method: - (NSString *)substringToIndex:(NSUInteger)to;
12. Demo Objective-C type encoding.
13. Demo the [] accessor for NSDictionary / NSArray.
14. Demo how to use CFBridgingRelease function.
15. Demo how to use respondsToSelector
16. Demo whether the mutable dictionary in another dictionary could be modified.

### AdvancedTableViewCells
1. This project demos how to use customized UITableViewCell class

### LongPressGestureDemo
1. Demo the usage of UILongPressGestureRecognizer class.
2. the state of UIGestureRecognizer, UIGestureRecognizerBegan UIGestureRecognizerEnd
3. minimumPressDuration, numberOfTapsRequired, numberOfTouchesRequired, allowableMovement

### TapGestureDemo
1. Demo the usage of UITapGestureRecognizer class.
2. numberOfTapsRequired, numberOfTouchesRequired.
3. Get the generic single-point location of the tap gesture, a generic single-point location is usually the centeroid of the touches involved.
4. the correct declaration of gesture handling method.

### HUDDemo
1. Demo the usage of MBProgressHUD library

### PersistenceDemo
1. Demo how to create data model apply to NSCoding/NScopying protocol.
2. Demo how to archive/unarchive.

### PersistenceWithSQLiteDemo
1. Demo how to code with sqlite3 library.

### KivaJSONDemo
1. Work with JSON in IOS5.0
2. URL -> NSData(json) -> Foundation Objects; Foundation Objects(NSArry/NSDictionary) -> NSData -> File

### ExtensionUtilDemo
1. The collection of Extension Utils for some classes.
2. Demo the usage of NSDictionary/NSMutableDictionary JSONCategories

### SlowWorker
1. Demo the usage of GCD
2. Demo how to use dispatch_group_create/dispatch_release

### PlaceHolderTextView
1. Demo the textview with a placeholder label, like the placeholder in a UITextField.
2. Demo the label used to show the left number of characters available to input.

### CoreDataPersistence
1. Demo how to use CoreData framework.

### NSTimerTest
1. Demo how to use NSTimer class.

### ImagePickerDemo
1. Demo how to use UIImagePickerController

### WebViewDemo
1. Demo how to use UIWebViewController

### LazyTabelImage
This sample demonstrates a multi-stage approach to loading and displaying a UITableView. It begins by loading the relevant text from an RSS feed so the table can load as quickly as possible, and then downloads the images for each row asynchronously so the UI is more responsive.

### FakeContactGenerator
1. Demo how to create a ABRecord object and how to insert it into contact database.

### SMSDemo
1. [MFMessageComposeViewController canSendText] shoudl retrun NO in Simulator, however, for iphone simulator5 and later, it returns YES.
please refer to http://stackoverflow.com/questions/9349381/mfmessagecomposeviewcontroller-on-simulator-cansendtext

### SearchTable
1. Demo how to use UISearchDisplayController.

