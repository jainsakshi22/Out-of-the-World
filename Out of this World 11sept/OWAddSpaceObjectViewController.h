//
//  OWAddSpaceObjectViewController.h
//  Out of this World 11sept
//
//  Created by Sakshi Jain on 21/09/14.
//
//

#import <UIKit/UIKit.h>
#import "OWOuterSpaceObject.h"

@protocol OWAddSpaceObjectViewControllerDelegate <NSObject>

@required
-(void)addSpaceObject : (OWOuterSpaceObject *)spaceObject;
-(void)didCancel;

@end

@interface OWAddSpaceObjectViewController : UIViewController

@property (weak,nonatomic) id <OWAddSpaceObjectViewControllerDelegate> delegate;

@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UITextField *nicknameTextField;
@property (strong, nonatomic) IBOutlet UITextField *diamterTextField;
@property (strong, nonatomic) IBOutlet UITextField *temperatureTextField;
@property (strong, nonatomic) IBOutlet UITextField *numberOfMoonsTextField;
@property (strong, nonatomic) IBOutlet UITextField *interestingFactTextField;

- (IBAction)cancelButtonPressed:(UIButton *)sender;
- (IBAction)addButtonPressed:(UIButton *)sender;



@end
