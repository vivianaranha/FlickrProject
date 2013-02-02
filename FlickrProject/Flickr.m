//
//  Flickr.m
//  FlickrProject
//
//  Created by Vivian Aranha on 2/2/13.
//  Copyright (c) 2013 Aranha, Vivian H. All rights reserved.
//

#import "Flickr.h"

@implementation Flickr

@synthesize updated, theEntries;

-(id)initWithData:(NSDictionary *)theData
{
    self = [super init];
    if (self) {
        
        //Check if the data is new
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
        NSDate *theDate = [dateFormatter dateFromString:[[[theData objectForKey:@"feed"] objectForKey:@"updated"] objectForKey:@"text"]];

        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        if ([defaults objectForKey:@"lastUpdatedDate"]) {
        
            NSString *theDateString = [NSString stringWithFormat:@"%@",[defaults objectForKey:@"lastUpdatedDate"]];
            [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ssZ"];
            NSDate *savedDate = [dateFormatter dateFromString:theDateString];
        
            if([savedDate compare:theDate] == NSOrderedSame){
                //Same DateTime so retuen nil
                return nil;
            } else {
                [defaults setObject:theDate forKey:@"lastUpdatedDate"];
                [defaults synchronize];
            }
        } else {
            [defaults setObject:theDate forKey:@"lastUpdatedDate"];
            [defaults synchronize];
        }
        self.theEntries = [[NSMutableArray alloc] init];
        for (NSDictionary *theEntryDictionary in [[theData objectForKey:@"feed"] objectForKey:@"entry"]) {
            Entry *theEntry = [[Entry alloc] initWithData:theEntryDictionary];
            [self.theEntries addObject:theEntry];
        }
        
    }
    return self;
}

@end
