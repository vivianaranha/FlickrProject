//
//  DataGrabber.h
//  FlickrProject
//
//  Created by Vivian Aranha on 2/2/13.
//  Copyright (c) 2013 Aranha, Vivian H. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFKissXMLRequestOperation.h"
#import "XMLReader.h"
#import "Flickr.h"
#import "Entry.h"
#import "Reachability.h"

@protocol DataGrabberDelegate <NSObject>
@optional
-(void) provide:(NSArray *)freshData;
@end

@interface DataGrabber : NSObject

@property (nonatomic, assign) id <DataGrabberDelegate> dataGrabberDelegate;

-(void) getFreshData;

@end
