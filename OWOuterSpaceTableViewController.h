//
//  OWOuterSpaceTableViewController.h
//  Out of this World 11sept
//
//  Created by Sakshi Jain on 11/09/14.
//
//

#import <UIKit/UIKit.h>
#import "OWOuterSpaceObject.h"
#import "OWAddSpaceObjectViewController.h"

@interface OWOuterSpaceTableViewController : UITableViewController <OWAddSpaceObjectViewControllerDelegate>

@property (strong,nonatomic) NSMutableArray *planets;
@property (strong,nonatomic) NSMutableArray *addedSpaceObjects;

@end
