//
//  CustomCell.m
//  FlickrProject
//
//  Created by Vivian Aranha on 2/2/13.
//  Copyright (c) 2013 Aranha, Vivian H. All rights reserved.
//

#import "CustomCell.h"
#import "UIImageView+AFNetworking.h"

@implementation CustomCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.flickrThumb = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 80, 80)];
        self.flickrThumb.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:self.flickrThumb];
        
        self.flickrTitle = [[UILabel alloc] initWithFrame:CGRectMake(100, 10, 180, 80)];
        self.flickrTitle.numberOfLines = 0;
        self.flickrTitle.font = [UIFont boldSystemFontOfSize:12.0];
        self.flickrTitle.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.flickrTitle];
    }
    return self;
}

-(void)setFlickrImage:(NSURL *)theImageUrl andTitle:(NSString*)theTitle{
    
    [self.flickrThumb setImageWithURL:theImageUrl placeholderImage:[UIImage imageNamed:@"defaultPhoto"]];
    self.flickrTitle.text = theTitle;

}

@end
