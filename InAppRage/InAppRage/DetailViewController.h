//
//  DetailViewController.h
//  InAppRage
//
//  Created by podevor@gmail.com on 12-9-17.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end
