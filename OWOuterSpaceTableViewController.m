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
#import "OWSpaceDataViewController.h"

@interface OWOuterSpaceTableViewController ()

@end

@implementation OWOuterSpaceTableViewController

#define ADDED_SPACE_OBJECT_KEY @"Added Space Object Array"

#pragma mark -Lazy Instantiation of Properties

-(NSMutableArray *)planets
{
    if (!_planets)
    {
        _planets = [[NSMutableArray alloc] init];
    }
    return _planets;
}

-(NSMutableArray *)addedSpaceObjects
{
    if (!_addedSpaceObjects)
    {
        _addedSpaceObjects = [[NSMutableArray alloc] init];
    }
    return _addedSpaceObjects;
}

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
    
   // self.planets = [[NSMutableArray alloc] init]; //underscore is used in getter methods while self is used in other methods
    
    for (NSDictionary *planetData in [AstronomicalData allKnownPlanets])
    {
        NSString *imageName = [NSString stringWithFormat: @"%@.jpg", planetData[PLANET_NAME]];
        OWOuterSpaceObject *planet = [[OWOuterSpaceObject alloc] initWithData:planetData andImage: [UIImage imageNamed: imageName]];
        [self.planets addObject:planet];
    }
    
    
    NSArray *myPlanetsAsPropertyLists = [[NSUserDefaults standardUserDefaults] arrayForKey:ADDED_SPACE_OBJECT_KEY];
    
    for (NSDictionary *dictionary in myPlanetsAsPropertyLists)
    {
        OWOuterSpaceObject *spaceObject = [self spaceObjectForDictionary:dictionary];
        [self.addedSpaceObjects addObject:spaceObject];
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
            NSIndexPath *path = [self.tableView indexPathForCell:sender];
            OWOuterSpaceObject *selectedObject ;
            
            if (path.section == 0)
            {
                selectedObject = self.planets[path.row];
            }
            else if (path.section ==1)
            {
                selectedObject = self.addedSpaceObjects[path.row];
            }
            
            nextController.spaceObject = selectedObject;
           
        }
    }
    
    if ([sender isKindOfClass: [NSIndexPath class]])
    {
        if ([segue.destinationViewController isKindOfClass: [OWSpaceDataViewController class]])
        {
            OWSpaceDataViewController *targetViewController = segue.destinationViewController;
            NSIndexPath *path = sender;
            OWOuterSpaceObject *selectedObject;
            
            if (path.section == 0)
            {
                selectedObject = [self.planets objectAtIndex:path.row];
            }
            else if (path.section == 1)
            {
                selectedObject = [self.addedSpaceObjects objectAtIndex:path.row];
            }
            
            targetViewController.spaceObject = selectedObject;
        }
    }
    
    if ([segue.destinationViewController isKindOfClass: [OWAddSpaceObjectViewController class]])
    {
        OWAddSpaceObjectViewController *addSpaceObjectVC = segue.destinationViewController;
        addSpaceObjectVC.delegate = self;
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
    
    if ([self.addedSpaceObjects count] )
    {
        return 2;
    }
    else
    {
        return 1;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    if(section == 1)
    {
        return [self.addedSpaceObjects count];
    }
    else
    {
    return [self.planets count];
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    if (indexPath.section == 1)
    {
        /*Set new space object from added space object array*/
        OWOuterSpaceObject *spaceObject = [self.addedSpaceObjects objectAtIndex:indexPath.row];
        cell.textLabel.text = spaceObject.name;
        cell.detailTextLabel.text = spaceObject.nickName;
        cell.imageView.image = spaceObject.spaceImage;
        
    }
    else
    {
        /* Access the space object from planets array*/
    OWOuterSpaceObject *planet = [self.planets objectAtIndex:indexPath.row];
    cell.textLabel.text = planet.name;
    cell.detailTextLabel.text = planet.nickName;
    cell.imageView.image = planet.spaceImage;
    }
    
    /*** Customize the appearance of cell ***/
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
//method when accessory property is changed in this controller
-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier: @"push to space data" sender:indexPath];
}


#pragma mark - OWAddSPaceObjectDelegate Delegate

-(void)didCancel
{
    NSLog (@"cancel working");
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)addSpaceObject:(OWOuterSpaceObject *)spaceObject
{
    //Comment this code as we have declared a getter method above
//    if (!self.addedSpaceObjects)
//    {
//        self.addedSpaceObjects = [[NSMutableArray alloc] init];
//    }
    [self.addedSpaceObjects addObject:spaceObject];
    
    //Will save to NSUSerDefaults here
    NSMutableArray *spaceObjectAsPropertyLists = [[[NSUserDefaults standardUserDefaults] arrayForKey:ADDED_SPACE_OBJECT_KEY] mutableCopy];
    
    if(!spaceObjectAsPropertyLists) spaceObjectAsPropertyLists = [[NSMutableArray alloc] init];
        
    [spaceObjectAsPropertyLists addObject:[self spaceObjectAsAPropertyList:spaceObject]];
    
    [[NSUserDefaults standardUserDefaults] setObject:spaceObjectAsPropertyLists forKey:ADDED_SPACE_OBJECT_KEY];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    //NSLog(@"Add space object working");
    [self dismissViewControllerAnimated:YES completion:nil];
    
    [self.tableView reloadData];    // to display the newly added planet in planets list
}

#pragma mark - Helper methods

//convert space object to property list to save the data
-(NSDictionary *)spaceObjectAsAPropertyList :(OWOuterSpaceObject *)spaceObject
{
    //image is too large to save in NSUSerDefault, so convert it into NSData using UIImagePNGRepresentation
    NSData *imageData = UIImagePNGRepresentation(spaceObject.spaceImage);
    NSDictionary *dictionary = @{PLANET_NAME : spaceObject.name, PLANET_GRAVITY : @(spaceObject.gravitationalForce), PLANET_DIAMETER : @(spaceObject.diameter),PLANET_YEAR_LENGTH : @(spaceObject.yearLength), PLANET_DAY_LENGTH : @(spaceObject.dayLength), PLANET_TEMPERATURE : @(spaceObject.temperature), PLANET_NUMBER_OF_MOONS : @(spaceObject.numberOfMoon), PLANET_NICKNAME :spaceObject.nickName, PLANET_INTERESTING_FACT : spaceObject.interestFact, PLANET_IMAGE : imageData};
    
    return dictionary;
}

//Do opposite to spaceObjectAsAPropertyList  method - convert property list to OWOuterSpaceObject to get out the data
-(OWOuterSpaceObject *)spaceObjectForDictionary : (NSDictionary *)dictionary
{
    NSData *dataForImage = dictionary[PLANET_IMAGE];
    UIImage *spaceObjectImage = [UIImage imageWithData:dataForImage];
    OWOuterSpaceObject *spaceObject = [[OWOuterSpaceObject alloc] initWithData:dictionary andImage: spaceObjectImage];
    
    return spaceObject;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) return  YES;
    else return NO;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [self.addedSpaceObjects removeObjectAtIndex:indexPath.row];
        
        NSMutableArray *newSavedSpaceObjectData = [[NSMutableArray alloc] init];
        for (OWOuterSpaceObject *spaceObject in self.addedSpaceObjects)
        {
            [newSavedSpaceObjectData addObject:[self spaceObjectAsAPropertyList:spaceObject]];
        }
        [[NSUserDefaults standardUserDefaults] setObject:newSavedSpaceObjectData forKey:ADDED_SPACE_OBJECT_KEY];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


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
