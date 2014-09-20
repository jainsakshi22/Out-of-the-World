//
//  OWOuterSpaceTableViewController.m
//  Out of this World 11sept
//
//  Created by Sakshi Jain on 11/09/14.
//
//

#import "OWOuterSpaceTableViewController.h"
#import "OWOuterSpaceObject.h"
#import "AstronomicalData.h"
#import "OWSpaceImageViewController.h"

@interface OWOuterSpaceTableViewController ()

@end

@implementation OWOuterSpaceTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
   
    //--Comment initialization of planets done before adding AstronomicalData file
//    NSString *planet1= @"Mercury";
//    NSString *planet2 = @"Venus";
//    NSString *planet3 = @"Earth";
//    NSString *planet4 = @"Mars";
//    NSString *planet5 = @"Jupitur";
//    NSString *planet6 = @"Saturn";
//    NSString *planet7 = @"Uranus";
//    NSString *planet8 = @"Neptune";
//    NSString *planet9 = @"Pluto";
    
    self.planets = [[NSMutableArray alloc] init];
    
    for (NSDictionary *planetData in [AstronomicalData allKnownPlanets])
    {
        NSString *imageName = [NSString stringWithFormat: @"%@.jpg", planetData[PLANET_NAME]];
        OWOuterSpaceObject *planet = [[OWOuterSpaceObject alloc] initWithData:planetData andImage: [UIImage imageNamed: imageName]];
        [self.planets addObject:planet];
    }
//    [self.planets addObject: planet9];
//    
//    NSMutableDictionary *myDictionary = [[NSMutableDictionary alloc] init];
//    NSString *firstColor= @"Red";
//    [myDictionary setObject: firstColor forKey:@"FireTruck Color"];
//    [myDictionary setObject: @"Blue" forKey:@"Ocean Color"];
//    [myDictionary setObject:@"Yellow" forKey: @"Star COlor"];
//    NSLog(@"%@", myDictionary);
//    NSString *blueString = [myDictionary objectForKey: @"Ocean Color"];
//    NSLog(@"%@",blueString);
    
//    NSNumber *intNumber1 = [NSNumber numberWithInt: 5]; //Initilaize with method
//    intNumber1 = [NSNumber numberWithInt: 16];  //Change value to 16
//    NSLog(@"%@", intNumber1);
//    
//    //Another way to define literals
//    NSNumber *intnumber2 =@20;  //initialize with literal
//    intnumber2 = @50;   //change value to 50
//    intnumber2 = [NSNumber numberWithInt: 100];
//    NSLog(@"%@", intnumber2);
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([sender isKindOfClass: [UITableViewCell class]])
    {
        if ([segue.destinationViewController isKindOfClass: [OWSpaceImageViewController class]])
        {
            OWSpaceImageViewController *nextController = segue.destinationViewController;
            NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
            OWOuterSpaceObject *selectedObject = self.planets[indexPath.row];
            nextController.spaceObject = selectedObject;
        }
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
//    if(section == 0)
//    {
//        return 3;
//    }
//    else
//    {
//        return 2;
//    }
    return [self.planets count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    OWOuterSpaceObject *planet = [self.planets objectAtIndex:indexPath.row];
    cell.textLabel.text = planet.name;
    cell.detailTextLabel.text = planet.nickName;
    cell.imageView.image = planet.spaceImage;
    
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.detailTextLabel.textColor = [UIColor colorWithWhite:0.5 alpha:1.0];
    
    // Configure the cell...
   // cell.textLabel.text = [NSString stringWithFormat: @"Row %i", indexPath.row];
 //   cell.textLabel.text = [self.planets objectAtIndex: indexPath.row];
    
//    if(indexPath.section == 0)
//    {
//        cell.backgroundColor = [UIColor redColor];
//    }
//    else
//    {
//        cell.backgroundColor = [UIColor blueColor];
//    }
    
    return cell;
}

#pragma mark - UITable View Delegate

-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"button pressed for %i row", indexPath.row);
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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
