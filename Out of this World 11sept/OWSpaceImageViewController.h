//
//  OWSpaceImageViewController.h
//  Out of this World 11sept
//
//  Created by Sakshi Jain on 16/09/14.
//
//

#import <UIKit/UIKit.h>

@interface OWSpaceImageViewController : UIViewController <UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong,nonatomic) UIImageView *imageView;

@end
