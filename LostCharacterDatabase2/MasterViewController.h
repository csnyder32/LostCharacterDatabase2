//
//  MasterViewController.h
//  LostCharacterDatabase2
//
//  Created by Chris Snyder on 8/12/14.
//  Copyright (c) 2014 Chris Snyder. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <CoreData/CoreData.h>

@interface MasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
