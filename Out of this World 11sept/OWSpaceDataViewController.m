//
//  OWSpaceDataViewController.m
//  Out of this World 11sept
//
//  Created by Sakshi Jain on 20/09/14.
//
//

#import "OWSpaceDataViewController.h"
#import "AstronomicalData.h"

@interface OWSpaceDataViewController ()

@end

@implementation OWSpaceDataViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor blackColor];
    self.tableView.backgroundColor = [UIColor clearColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark- UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"DataCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
  //  cell.textLabel.text = @"Data";
    
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"Nickname";
            cell.detailTextLabel.text = self.spaceObject.nickName;
            break;
        case 1:
            cell.textLabel.text = @"Gravitational Force";
            cell.detailTextLabel.text = [NSString stringWithFormat: @"%f",self.spaceObject.gravitationalForce];
            break;
        case 2:
            cell.textLabel.text = @"Diameter";
            cell.detailTextLabel.text = [NSString stringWithFormat: @"%f",self.spaceObject.diameter];
            break;
        case 3:
            cell.textLabel.text = @"Length of the year (days)";
            cell.detailTextLabel.text = [NSString stringWithFormat: @"%f",self.spaceObject.yearLength];
            break;
        case 4:
            cell.textLabel.text = @"Length of the day (hours)";
            cell.detailTextLabel.text = [NSString stringWithFormat: @"%f",self.spaceObject.dayLength];
            break;
        case 5:
            cell.textLabel.text = @"Temperature";
            cell.detailTextLabel.text = [NSString stringWithFormat: @"%f",self.spaceObject.temperature];
            break;
        case 6:
            cell.textLabel.text = @"Number of moons";
            cell.detailTextLabel.text = [NSString stringWithFormat: @"%i",self.spaceObject.numberOfMoon];
            break;
        case 7:
            cell.textLabel.text = @"Interesting Fact";
            cell.detailTextLabel.text = self.spaceObject.interestFact;
            break;
        default:
            break;
    }
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return 8;
    NSArray *array = [AstronomicalData allKnownPlanets];
    NSDictionary *planet =[array objectAtIndex:0];
 //   NSLog(@"%i", [[planet allKeys] count]);
    // 1 is subtracted because dictionary has 9 keys and 1 key(name) is not displayed in row.
    return ([[planet allKeys] count]-1);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
