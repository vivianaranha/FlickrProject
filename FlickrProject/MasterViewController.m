//
//  MasterViewController.m
//  FlickrProject
//
//  Created by Aranha, Vivian H on 1/31/13.
//  Copyright (c) 2013 Aranha, Vivian H. All rights reserved.
//

#import "MasterViewController.h"


@implementation MasterViewController

@synthesize thePhotoArray;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.thePhotoArray = [[NSMutableArray alloc] init];
    checkScroll = YES;
    
    //Get the Data from Flickr
    dataGrabber = [[DataGrabber alloc] init];
    dataGrabber.dataGrabberDelegate = self;
    [dataGrabber getFreshData];
    
}

#pragma mark - Table view data source

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 100.0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.thePhotoArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
                             
    if(cell == nil){
        cell = [[CustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    Entry *theEntry = [self.thePhotoArray objectAtIndex:indexPath.row];
    NSString *theTitle = theEntry.theTitle;
    NSURL *theImageURL = theEntry.theImageURLThumb;
    
    [cell setFlickrImage:theImageURL andTitle:theTitle];
    cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController *theDetail = [[DetailViewController alloc] init];

    Entry *theEntry = [self.thePhotoArray objectAtIndex:indexPath.row];
    theDetail.title = theEntry.theTitle;
    theDetail.imageUrl = theEntry.theImageURLLarge;
    
    [self.navigationController pushViewController:theDetail animated:YES];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //Check if teh user scrolls to bottom - Get latest feed
    if(checkScroll){

        NSInteger currentOffset = scrollView.contentOffset.y;
        NSInteger maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height;
    
        if (maximumOffset - currentOffset <= 10.0) {
            [dataGrabber getFreshData];
            checkScroll = NO;
        }
    }
}

#pragma mark - DataGrabber delegate

-(void) provide:(NSArray *)freshData{

    [self.thePhotoArray addObjectsFromArray:freshData];
    [self.tableView reloadData];
    checkScroll = YES;
}


@end
