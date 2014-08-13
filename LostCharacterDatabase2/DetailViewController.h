//
//  DetailViewController.h
//  LostCharacterDatabase2
//
//  Created by Chris Snyder on 8/12/14.
//  Copyright (c) 2014 Chris Snyder. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Character.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *passengerLabel;

@property Character *character;
@end
