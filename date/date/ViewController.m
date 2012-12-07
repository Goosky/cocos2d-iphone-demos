//
//  ViewController.m
//  date
//
//  Created by podevor@gmail.com on 12-9-18.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    /*
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setCalendar:[NSCalendar currentCalendar]];
    NSLog(@"current Year is %d current month is  %d current day is  %d ",[comps year],[comps month],
          [comps day]);
     */
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init]; 
    [formatter setDateFormat:@"yyyy-MM-dd"]; 
    NSString *nowStr = [formatter stringFromDate:[NSDate date]]; 
    NSLog(@"now time without setting TimeZone\n Default TimeZone: %@, Local Time %@",[formatter timeZone], nowStr); 
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
