//
//  ViewController.m
//  TableViewSection&Rows
//
//  Created by IS on 27/11/12.
//  Copyright (c) 2012 Sanofi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSMutableArray *sectionsArray;
    NSMutableArray *rowInSectionsArray;
}

@end

@implementation ViewController;
@synthesize myTableView;
@synthesize sectionSelectedDisplay;
@synthesize rowSelectedDisplay;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[self myTableView]setDelegate:self];
    [[self myTableView]setDataSource:self];
	sectionsArray = [[NSMutableArray alloc]init];
    rowInSectionsArray = [[NSMutableArray alloc]init];
}

- (IBAction)addSectionButton:(id)sender
{
    [sectionsArray addObject:[NSString stringWithFormat:@"Section %d",sectionsArray.count]];
    [[self myTableView]reloadData];
}

- (IBAction)addRowButton:(id) sender
{
    [rowInSectionsArray addObject:[NSString stringWithFormat:@"Row %d",rowInSectionsArray.count]];
    [[self myTableView]reloadData];   
    
}

- (void)viewDidUnload
{
    [self setMyTableView:nil];
    [self setSectionSelectedDisplay:nil];
    [self setRowSelectedDisplay:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

//metodos del table

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [sectionsArray count];
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [rowInSectionsArray count];
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [sectionsArray objectAtIndex:section];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = [rowInSectionsArray objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[self sectionSelectedDisplay] setText:[sectionsArray objectAtIndex:indexPath.section]];
    [[self rowSelectedDisplay] setText:[rowInSectionsArray objectAtIndex:indexPath.row]];
}


@end
