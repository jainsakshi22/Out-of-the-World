//
//  OWOuterSpaceObject.m
//  Out of this World 11sept
//
//  Created by Sakshi Jain on 16/09/14.
//
//

#import "OWOuterSpaceObject.h"
#import "AstronomicalData.h"

@implementation OWOuterSpaceObject

//Secondary initializer -- Call Designated initializer using Self keyword
-(id)init
{
    self = [self initWithData:nil andImage:nil];
    return self;
}

//Designated Initializer -- Call immediate superclass initializer using Super keyword
-(id)initWithData : (NSDictionary *)data andImage : (UIImage *)image
{
    self = [super init];
    
    self.name = data[PLANET_NAME];
    self.gravitationalForce = [data[PLANET_GRAVITY] floatValue ];
    self.diameter = [data[PLANET_DIAMETER] floatValue];
    self.yearLength = [data[PLANET_YEAR_LENGTH] floatValue];
    self.dayLength = [data[PLANET_DAY_LENGTH] floatValue];
    self.temperature = [data[PLANET_TEMPERATURE] floatValue];
    self.numberOfMoon = [data[PLANET_NUMBER_OF_MOONS] intValue];
    self.nickName = data[PLANET_NICKNAME];
    self.interestFact = data[PLANET_INTERESTING_FACT];
    
    self.spaceImage = image;    //dont use dictionary as it is coming as separate parameter
    
    return self;
    
}

@end
