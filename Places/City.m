//
//  City.m
//  Places
//
//  Created by Maputi Botlhole on 9/13/14.
//  Copyright (c) 2014 Oluwatoni Fuwape. All rights reserved.
//

#import "City.h"
#import "AFJSONRequestOperation.h"
@implementation City
-(id) init{
    self = [self initWithJSON];
    
    return self;
}

-(id) initWithJSON{
    self = [super init];
    if(self){
        self.notes=@"no notes yet...";
        self.interestingPlaces=[City getCity].interestingPlaces;
        NSURL *url = [[NSURL alloc] initWithString:@"http://beta.json-generator.com/api/json/get/CSAeTqO"];
        NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
        
        AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
            self.name = JSON[@"name"];
            self.state = JSON[@"state"];
            self.population = JSON[@"population"];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"initWithJSONFinishedLoading"
                                                                object:nil];
       
        } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
            NSLog(@"NSError: %@",[error localizedDescription]);
        }];
        
        [operation start];

      
    }
    return self;
}

//archiving
-(void)encodeWithCoder:(NSCoder *)anEncoder
{
    [anEncoder encodeObject:self.name forKey:@"name"];
    [anEncoder encodeObject:self.state forKey:@"state"];
    [anEncoder encodeObject:self.population forKey:@"population"];
    [anEncoder encodeObject:self.notes forKey:@"notes"];
    [anEncoder encodeObject:self.interestingPlaces forKey:@"interestingPlaces"];
    
}

//unarchiving
-(City *) initWithCoder:(NSCoder *)aDecoder
{
    self=[super init];
    if(self){
        self.name=[aDecoder decodeObjectForKey:@"name"];
        self.state=[aDecoder decodeObjectForKey:@"state"];
        self.population=[aDecoder decodeObjectForKey:@"population"];
        self.notes=[aDecoder decodeObjectForKey:@"notes"];
        self.interestingPlaces=[aDecoder decodeObjectForKey:@"interestingPlaces"];
    }
    return self;
}
+ (NSString *) getPathToArchive{
NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
NSString *docsDir=[paths objectAtIndex:0];
    
return [docsDir stringByAppendingPathComponent:@"city.model"];
}


+(void)saveCity:(City *) aCity
{
    NSLog(@"Archiving Data...");
    [NSKeyedArchiver archiveRootObject:aCity toFile:[City getPathToArchive]];
    
}


+(City *)getCity
{
     NSLog(@"Retrieving Data...");
    return [NSKeyedUnarchiver unarchiveObjectWithFile:[City getPathToArchive]];
}
@end
