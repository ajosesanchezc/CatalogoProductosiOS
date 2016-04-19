//
//  ViewController.h
//  TableViewSection&Rows
//
//  Created by IS on 27/11/12.
//  Copyright (c) 2012 Sanofi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (weak, nonatomic) IBOutlet UILabel *sectionSelectedDisplay;
@property (weak, nonatomic) IBOutlet UILabel *rowSelectedDisplay;

- (IBAction)addSectionButton:(id)sender;
- (IBAction)addRowButton:(id)sender;

@end
