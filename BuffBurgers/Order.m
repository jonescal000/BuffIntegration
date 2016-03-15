//
//  Order.m
//  BuffBurgers
//
//  Created by Callie Jones on 3/9/16.
//  Copyright © 2016 CSCI 3308. All rights reserved.
//

#import "Order.h"
#import "DBManager.h"

@interface Order ()

@property (nonatomic, strong) NSArray *_pckBurgyData;//idk...meant to b: NSArray *_pickerData;
@property (nonatomic, strong) NSArray *_pckHeatData;
@property (nonatomic, strong) NSArray *_pckBunData;
@property (nonatomic, strong) NSArray *_pckCheeseData;

@property (nonatomic, strong) DBManager *dbManager;

@property (nonatomic, strong) NSArray *arrOrders;


@property (nonatomic) int recordIDToEdit;
@property (nonatomic) int orderNum;
@property (nonatomic) int status;//need to setup idk rn
@property (nonatomic) int userID;//need to set this to the user_ID from table users


-(void)loadData;

@end

@implementation Order

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    // Initialize Data
    __pckBurgyData = @[@"Hamburger", @"Veggie Burger"];//Daily Special
    __pckHeatData = @[@"155", @"160", @"165", @"170", @"175"];
    __pckBunData = @[@"Regular Bun", @"Lettuce Wrap", @"Gluten Free Bun"];
    __pckCheeseData = @[@"Cheddar", @"Provolone", @"Swiss", @"Pepper Jack"];//_pickerData
    
    
    
    // Make self the delegate and datasource of the table view.==connect data
    self.pckBurgy.delegate = self;//picker
    self.pckBurgy.dataSource = self;
    self.pckHeat.delegate = self;
    self.pckHeat.dataSource = self;
    self.pckBun.delegate = self;
    self.pckBun.dataSource = self;
    self.pckCheese.delegate = self;
    self.pckCheese.dataSource = self;
    
    //self.orderNum = self;
    
    [self.lettuce setTitle:@"Lettuce" forState:UIControlStateNormal];
    [self.tomato setTitle:@"Tomato" forState:UIControlStateNormal];
    [self.onion setTitle:@"Onion" forState:UIControlStateNormal];
    [self.pickles setTitle:@"Pickles" forState:UIControlStateNormal];
    
    
    // Initialize the dbManager property.
    self.dbManager = [[DBManager alloc] initWithDatabaseFilename:@"buffsampledb.sql"];
    
    // Load the data.
    [self loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//buttons


- (IBAction)handleButtonLettuce:(id)sender {
}

- (IBAction)handleButtonTomato:(id)sender {
}

- (IBAction)handleButtonOnion:(id)sender {
}

- (IBAction)handleButtonPickles:(id)sender {
}





// The number of columns of data
- (int)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// The number of rows of data
- (int)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return __pckBurgyData.count;
}

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return __pckBurgyData[row];
}

// Catpure the picker view selection
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    // This method is triggered whenever the user makes a change to the picker selection.
    // The parameter named row and component represents what was selected.
}
/*
 
 order_num INTEGER PRIMARY KEY,
 user_id INTEGER NOT NULL,
 status INTEGER NOT NULL CHECK(status >= 0 and status < 3),
 burger INTEGER NOT NULL CHECK(burger >= 0 and burger < 3),
 heat INTEGER NOT NULL CHECK(heat >= 0 and heat < 5),
 cheese INTEGER NOT NULL CHECK(cheese >= 0 and cheese < 4),
 lettuce INTEGER NOT NULL CHECK(lettuce >= 0 and lettuce < 2),
 tomato INTEGER NOT NULL CHECK(tomato >= 0 and tomato < 2),
 onion INTEGER NOT NULL CHECK(onion >= 0 and onion < 2),
 pickle INTEGER NOT NULL CHECK(pickle >= 0 and pickle < 2),
 bun INTEGER NOT NULL CHECK(bun >= 0 and bun < 3),
 
 */


/*- (IBAction)addNewRecord:(id)sender {
    // Before performing the segue, set the -1 value to the recordIDToEdit. That way we'll indicate that we want to add a new record and not to edit an existing one.
    self.recordIDToEdit = -1;
    self.orderNum = 0;
    
    // Perform the segue.
    [self performSegueWithIdentifier:@"idSegueEditInfo" sender:self];
}*/

//NEED TO NOW INSERT CREATED ORDER INTO DB
- (IBAction)saveInfo:(id)sender {
    // Prepare the query string.
    // If the recordIDToEdit property has value other than -1, then create an update query. Otherwise create an insert query.
    
    self.orderNum = _orderNum+1;//everytime order is added to db increase orderNum
    NSString *query;
    query = [NSString stringWithFormat:@"insert into orders values(%d where user_id=%d, %d, '%@', %@, '%@', %@, %@, %@, %@, '%@')", self.orderNum, self.userID, self.status, self.pckBurgy, self.pckHeat, self.pckCheese, self.lettuce, self.tomato, self.onion, self.pickles, self.pckBun];//peopleInfo
    /*else{
        query = [NSString stringWithFormat:@"update orders set order_num=%d, user_id=%d, status=%d, burger='%@', heat=%d, cheese='%@', lettuce=%d, tomato=%d, onion=%d, pickle=%d, bun='%@'", self.pckBurgy, self.pckHeat, self.pckCheese, self.recordIDToEdit];// where peopleInfoID=%d"
    }*/
    
    
    // Execute the query.
    [self.dbManager executeQuery:query];
    
    // If the query was successfully executed then pop the view controller.
    if (self.dbManager.affectedRows != 0) {
        NSLog(@"Query was executed successfully. Affected rows = %d", self.dbManager.affectedRows);
        
        // Inform the delegate that the editing was finished.
        //[self.delegate editingInfoWasFinished];
        
        // Pop the view controller.
        //[self.navigationController popViewControllerAnimated:YES];
    }
    else{
        NSLog(@"Could not execute the query.");
    }
}




@end
