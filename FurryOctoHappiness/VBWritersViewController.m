//
//  VBWritersViewController.m
//  FurryOctoHappiness
//
//  Created by Ariel Rodriguez on 16/12/13.
//  Copyright (c) 2013 VolonBolon. All rights reserved.
//

#import "VBWritersViewController.h"

@interface VBWritersViewController ()
@property (strong) NSArray *writers;
@end

@implementation VBWritersViewController

- (void)awakeFromNib
{
    
    [super awakeFromNib];

    NSArray *writers = @[@"Franz Kafka", @"Domingo Sarmiento", @"Jorge Luis Borges", @"James Joyce"];
    
    [self setWriters:writers];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
 
    return 1;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return [[self writers] count];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"VBWriterCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];

    NSString *writerName = [[self writers] objectAtIndex:[indexPath row]];
    
    [[cell textLabel] setText:writerName];
    
    // Not needed, but i add this as a reminder of what we can do
    [[cell textLabel] setAccessibilityLabel:[NSString stringWithFormat:@"Accessibility Label: %@", writerName]];
    
    return cell;
    
}

@end
