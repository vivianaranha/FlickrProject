//
//  Entry.m
//  FlickrProject
//
//  Created by Vivian Aranha on 2/2/13.
//  Copyright (c) 2013 Aranha, Vivian H. All rights reserved.
//

#import "Entry.h"

@implementation Entry

@synthesize theTitle, theImageURLThumb, theImageURLLarge;

- (id)initWithData:(NSDictionary *)theEntryData
{
    self = [super init];
    if (self) {
        self.theTitle = [[NSString alloc] initWithString:[[theEntryData objectForKey:@"title"] objectForKey:@"text"]];
        
        NSString *theImageThumb = [[[[theEntryData objectForKey:@"link"] lastObject] objectForKey:@"href"] stringByReplacingOccurrencesOfString:@"_b." withString:@"_t."];
        self.theImageURLThumb = [NSURL URLWithString:theImageThumb];
        
        NSString *theImageLarge = [[[theEntryData objectForKey:@"link"] lastObject] objectForKey:@"href"];
        self.theImageURLLarge = [NSURL URLWithString:theImageLarge];
    
    }
    return self;
}

@end
