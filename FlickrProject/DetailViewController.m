//
//  DetailViewController.m
//  FlickrProject
//
//  Created by Vivian Aranha on 2/2/13.
//  Copyright (c) 2013 Aranha, Vivian H. All rights reserved.
//

#import "DetailViewController.h"
#import "UIImageView+AFNetworking.h"

@implementation DetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImageView *theImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 300, 300)];
    [theImage setImageWithURL:self.imageUrl placeholderImage:[UIImage imageNamed:@"defaultPhoto"]];
    theImage.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:theImage];
    
}

@end
