//
//  OWSpaceImageViewController.m
//  Out of this World 11sept
//
//  Created by Sakshi Jain on 16/09/14.
//
//

#import "OWSpaceImageViewController.h"

@interface OWSpaceImageViewController ()

@end

@implementation OWSpaceImageViewController

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
    self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Jupiter.jpg"]];
    self.scrollView.contentSize = self.imageView.frame.size;
    [self.scrollView addSubview: self.imageView];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
