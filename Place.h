//
//  Place.h
//  Places
//
//  Created by Maputi Botlhole on 9/13/14.
//  Copyright (c) 2014 Oluwatoni Fuwape. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Place : NSObject<NSCoding>

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *description;

- (id) initWithName: (NSString *)aName
        description:(NSString *) aDescription;

@end
