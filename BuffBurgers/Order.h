//
//  Order.h
//  BuffBurgers
//
//  Created by Callie Jones on 3/9/16.
//  Copyright © 2016 CSCI 3308. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EditInfoViewController.h"

@interface Order : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate, EditInfoViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UIPickerView *pckBurgy;//puts instory board as outlet
@property (weak, nonatomic) IBOutlet UIPickerView *pckHeat;//*picker
@property (weak, nonatomic) IBOutlet UIPickerView *pckBun;
@property (weak, nonatomic) IBOutlet UIPickerView *pckCheese;

@property (strong, nonatomic) IBOutlet UIButton *lettuce;
@property (strong, nonatomic) IBOutlet UIButton *tomato;
@property (strong, nonatomic) IBOutlet UIButton *onion;
@property (strong, nonatomic) IBOutlet UIButton *pickles;

//@property (nonatomic) int recordIDToEdit;
//@property (nonatomic) int orderNum;



//- (IBAction)addNewRecord:(id)sender;
- (IBAction)handleButtonLettuce:(id)sender;
- (IBAction)handleButtonTomato:(id)sender;
- (IBAction)handleButtonOnion:(id)sender;
- (IBAction)handleButtonPickles:(id)sender;



@end
