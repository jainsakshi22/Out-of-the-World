//
//  OWOuterSpaceObject.h
//  Out of this World 11sept
//
//  Created by Sakshi Jain on 16/09/14.
//
//

#import <Foundation/Foundation.h>

@interface OWOuterSpaceObject : NSObject

@property (strong,nonatomic) NSString *name;
@property (nonatomic) float gravitationalForce;
@property (nonatomic) float diameter;
@property (nonatomic) float yearLength;
@property (nonatomic) float dayLength;
@property (nonatomic) float temperature;
@property (nonatomic) int numberOfMoon;
@property (strong,nonatomic) NSString *nickName;
@property (strong,nonatomic) NSString *interestFact;

@property (strong,nonatomic) UIImage *spaceImage;

-(id)initWithData : (NSDictionary *)data andImage : (UIImage *)image;

@end
