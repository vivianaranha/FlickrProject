//
//  Flickr.h
//  FlickrProject
//
//  Created by Vivian Aranha on 2/2/13.
//  Copyright (c) 2013 Aranha, Vivian H. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entry.h"

@interface Flickr : NSObject {
    NSDate *updated;
    NSMutableArray *theEntries;
    
}

@property (nonatomic, retain) NSDate *updated;
@property (nonatomic, retain) NSMutableArray *theEntries;

-(id)initWithData:(NSDictionary *)theData;

@end
