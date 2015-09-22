//
//  SDTableViewController.m
//  SDPhotoBrowser
//
//  Created by aier on 15-2-4.
//  Copyright (c) 2015年 GSD. All rights reserved.
//

#import "SDTableViewController.h"
#import "SDPhotoGroup.h"
#import "SDPhotoItem.h"
#import "AppDelegate.h"

@interface SDTableViewController ()

@property (nonatomic, strong) NSArray *srcStringArray;
@property (nonatomic, strong) UISwipeGestureRecognizer *swipeLeftReturnGesture;

@end

@implementation SDTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.rowHeight = 200;
    
    _srcStringArray = @[@"http://110.67.250.249:21414/h/8e93b91f7d67d92f6a496b7ab502f6495344a834-741116-1200-1703-jpg/keystamp=1442291100-d79a27ee55/3_003.jpg",
                        @"http://114.34.54.125:1040/h/570ca5153cee69cd680eb7d176ea7cccf41de8da-634188-1200-1703-jpg/keystamp=1442291100-1e351f0010/3_004.jpg",
                        @"http://ww2.sinaimg.cn/thumbnail/67307b53jw1epqq3bmwr6j20c80axmy5.jpg",
                        @"http://ww2.sinaimg.cn/thumbnail/9ecab84ejw1emgd5nd6eaj20c80c8q4a.jpg",
                        @"http://ww2.sinaimg.cn/thumbnail/642beb18gw1ep3629gfm0g206o050b2a.gif",
                        @"http://ww1.sinaimg.cn/thumbnail/9be2329dgw1etlyb1yu49j20c82p6qc1.jpg",
                        @"http://www.07692.com/uploads/allimg/1311/1-13111FTR5.jpg",
                        @"http://www.07692.com/uploads/allimg/1311/1-13111FTR5.jpg",
                        @"http://www.07692.com/uploads/allimg/1311/1-13111FTR5.jpg",
                        @"http://www.07692.com/uploads/allimg/1311/1-13111FTR5.jpg",
                        ];
    self.swipeLeftReturnGesture = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeLeftReturnGestureRun)];
    [self.view addGestureRecognizer:self.swipeLeftReturnGesture];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_srcStringArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"photo";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    SDPhotoGroup *photoGroup = [[SDPhotoGroup alloc] init];
    
    NSMutableArray *temp = [NSMutableArray array];
    [_srcStringArray enumerateObjectsUsingBlock:^(NSString *src, NSUInteger idx, BOOL *stop) {
        SDPhotoItem *item = [[SDPhotoItem alloc] init];
        item.thumbnail_pic = src;
        [temp addObject:item];
    }];
    
    photoGroup.photoItemArray = [temp copy];
//    [cell.contentView addSubview:photoGroup];
    [self.tableView addSubview:photoGroup];
    return cell;
}
#pragma mark - Custom Methods
-(void)swipeLeftReturnGestureRun{
    AppDelegate *appdelegate = [UIApplication sharedApplication].delegate;
    [appdelegate.navigationController popToRootViewControllerAnimated:YES];
}

@end
