//
//  MasterViewController.h
//  InAppRage
//
//  Created by podevor@gmail.com on 12-9-17.
//

#import <UIKit/UIKit.h>
// Before @interface
#import "MBProgressHUD.h"
@class DetailViewController;

@interface MasterViewController : UITableViewController{   
    
    // Inside @interface
    MBProgressHUD *_hud;

}

@property (strong, nonatomic) DetailViewController *detailViewController;
// After @interface
@property (retain) MBProgressHUD *hud;
@end
