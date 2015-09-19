//
//  ShowsTableViewCell.m
//  Thousands
//
//  Created by SeaHub on 15/9/9.
//  Copyright (c) 2015年 S3Develop. All rights reserved.
//

#import "ShowsTableViewCell.h"

@implementation ShowsTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        NSArray *views = [[NSBundle mainBundle]loadNibNamed:@"ShowsTableViewCell" owner:nil options:nil];
        self = [views firstObject];
    }
    return self;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
