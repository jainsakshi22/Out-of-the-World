//
//  OWSpaceDataViewController.h
//  Out of this World 11sept
//
//  Created by Sakshi Jain on 20/09/14.
//
//

#import <UIKit/UIKit.h>
#import "OWOuterSpaceObject.h"

@interface OWSpaceDataViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic) OWOuterSpaceObject *spaceObject;

@end
