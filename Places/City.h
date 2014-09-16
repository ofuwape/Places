//
//  City.h
//  Places
//
//  Created by Maputi Botlhole on 9/13/14.
//  Copyright (c) 2014 Oluwatoni Fuwape. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Place.h"

@interface City : NSObject//<NSCoding>

@property (strong,nonatomic) NSString *name;
@property (strong,nonatomic) NSString *state;
@property (strong,nonatomic) NSString *population;
@property (strong,nonatomic) NSString *notes;
@property (strong,nonatomic) NSArray *interestingPlaces;
+ (NSString *) getPathToArchive;
+(void)saveCity:(City *) aCity;
+(City *)getCity;
-(id) initWithJSON;

@end
