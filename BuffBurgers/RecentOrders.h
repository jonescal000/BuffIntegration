//
//  RecentOrders.h
//  BuffBurgers
//
//  Created by Callie Jones on 3/9/16.
//  Copyright © 2016 CSCI 3308. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EditInfoViewController.h"

@interface RecentOrders : UIViewController <UITableViewDelegate, UITableViewDataSource, EditInfoViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tblUsers;
@property (strong, nonatomic) IBOutlet UIButton *order;


//- (IBAction)addNewRecord:(id)sender;
//- (IBAction)handleButtonOrder:(id)sender;


@end