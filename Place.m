//
//  Place.m
//  Places
//
//  Created by Maputi Botlhole on 9/13/14.
//  Copyright (c) 2014 Oluwatoni Fuwape. All rights reserved.
//

#import "Place.h"

@implementation Place

-(id) init{
    self = [self initWithName:@"defaultName"
                  description:@"defaultDescription"];
    
    return self;
}

- (id) initWithName: (NSString *)aName
        description:(NSString *) aDescription
{
    self=[super init];
    if(self){
        self.name=aName;
        self.description=aDescription;
    }
    return self;
}

//archiving
-(void)encodeWithCoder:(NSCoder *)anEncoder
{

    [anEncoder encodeObject:self.name forKey:@"name"];
    [anEncoder encodeObject:self.description forKey:@"description"];
    
}

//unarchiving
-(Place *) initWithCoder:(NSCoder *)aDecoder
{
    self=[super init];
    if(self){

        self.name=[aDecoder decodeObjectForKey:@"name"];
        self.description=[aDecoder decodeObjectForKey:@"description"];
    }
    return self;
}

@end
