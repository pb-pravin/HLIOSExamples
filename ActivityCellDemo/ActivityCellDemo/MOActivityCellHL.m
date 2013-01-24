//
//  MOActivityCellHL.m
//  Mozat
//
//  Created by an hailin on 24/1/13.
//  Copyright (c) 2013 MOZAT Pte Ltd. All rights reserved.
//

#import "MOActivityCellHL.h"

@interface MOActivityCellHL () {
    SDWebImageManager *_avatarImageManager;
    SDWebImageManager *_profilePhotoImageManager;
}

@property (retain, nonatomic) IBOutlet UILabel *timeLabel;
@property (retain, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (retain, nonatomic) IBOutlet UILabel *nameLabel;
@property (retain, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (retain, nonatomic) IBOutlet UIImageView *contentImageView;

@end

@implementation MOActivityCellHL

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //self.avatarImage = ;
        //self.profilePhotoImage = [UIImage imageNamed:@"DefaultProfilePicture_96.png"];
        
        _avatarImageManager = [[SDWebImageManager alloc] init];
        _profilePhotoImageManager = [[SDWebImageManager alloc] init];
        
        
        
        
    }
    return self;
}

- (void)awakeFromNib {
    self.avatarImageView.image = [UIImage imageNamed:@"DefaultProfilePicture_32.png"];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {
    [_avatarImageManager release], _avatarImageManager = nil;
    [_profilePhotoImageManager release], _profilePhotoImageManager = nil;
    [_timeLabel release];
    [_avatarImageView release];
    [_nameLabel release];
    [_descriptionLabel release];
    [_contentImageView release];
    [super dealloc];
}

#pragma mark - Getter/Setter

- (void)setActivity:(MOActivity *)activity {
    if (_activity != activity && activity) {
        [_activity release];
        _activity = [activity retain];
        //self.timeLabel.text = activity.datetime
        self.nameLabel.text = activity.userName;
        self.descriptionLabel.text = @"1324";

        // Download avatar image
        NSURL *url = [NSURL URLWithString:activity.avatar];
        [_avatarImageManager downloadWithURL:url delegate:self];

        // Download profile photo image
        if (activity.type == MOActivityTypeAvatarChanged) {
            NSURL *url = [NSURL URLWithString:activity.content];
            [_profilePhotoImageManager downloadWithURL:url delegate:self];
        }
        
        [self setNeedsDisplay];
    }
}

- (void)setFirstCell:(BOOL)firstCell {
    if (_firstCell != firstCell) {
        _firstCell = firstCell;
        [self setNeedsDisplay];
    }
}

- (void)setLastCell:(BOOL)lastCell {
    if (_lastCell != lastCell) {
        _lastCell = lastCell;
        [self setNeedsDisplay];
    }
}

#pragma mark - Utility methods


#pragma mark - SDWebImageManagerDelegate

- (void)webImageManager:(SDWebImageManager *)imageManager
     didFinishWithImage:(UIImage *)image {
    if (imageManager == _avatarImageManager) {
        self.avatarImageView.image = image;
    } else if (imageManager == _profilePhotoImageManager) {
        self.contentImageView.image = image;
    }
}

- (void)webImageManager:(SDWebImageManager *)imageManager
       didFailWithError:(NSError *)error {
    // Do nothing.
}

@end
