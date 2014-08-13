//
//  MasterViewController.m
//  LostCharacterDatabase2
//
//  Created by Chris Snyder on 8/12/14.
//  Copyright (c) 2014 Chris Snyder. All rights reserved.
//

#import "MasterViewController.h"
#import "Character.h"
#import "DetailViewController.h"

@interface MasterViewController ()
@property NSArray *characters;
@end

@implementation MasterViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self loadData];
}
-(void)loadData
{
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc]initWithKey:@"passenger" ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObject: sortDescriptor];
    NSFetchRequest *request = [[NSFetchRequest alloc]initWithEntityName:@"Character"];
    request.sortDescriptors = sortDescriptors;
    self.characters = [self.managedObjectContext executeFetchRequest:request error:nil];
}
- (IBAction)onAddCharacter:(UITextField *)sender
{
    Character *character = [NSEntityDescription insertNewObjectForEntityForName:@"Character" inManagedObjectContext:self.managedObjectContext];
    character.passenger = sender.text;
    [self.managedObjectContext save:nil];
    [sender resignFirstResponder];
    
}
-(void)loadPlistData
{
    NSURL *url = [NSURL URLWithString:@"file:///Users/chris.snyder/Downloads/lost.plist"];
    NSMutableArray *temporaryCharacterArray = [NSArray arrayWithContentsOfURL:url];

    for (NSDictionary *dict in temporaryCharacterArray)
    {
        Character *character = [NSEntityDescription insertNewObjectForEntityForName:@"Character" inManagedObjectContext:_managedObjectContext];
        character.actor = dict[@"actor"];
        character.passenger = dict[@"passenger"];
        [_managedObjectContext save:nil];
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    Character *newGuy=[self.characters objectAtIndex:indexPath.row];
    cell.textLabel.text = newGuy.passenger;
    cell.detailTextLabel.text = newGuy.actor;

    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  self.characters.count;
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{

    [self.tableView reloadData];

}
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"SMOKE MONSTER";
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    DetailViewController *vc = segue.destinationViewController;
    vc.character = self.characters[[[self.tableView indexPathForSelectedRow ]row]];
}
@end
