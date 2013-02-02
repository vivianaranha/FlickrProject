//
//  CustomCell.h
//  FlickrProject
//
//  Created by Vivian Aranha on 2/2/13.
//  Copyright (c) 2013 Aranha, Vivian H. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell

@property (nonatomic, retain) UIImageView *flickrThumb;
@property (nonatomic, retain) UILabel *flickrTitle;

-(void)setFlickrImage:(NSURL *)theImageUrl andTitle:(NSString*)theTitle;

@end
