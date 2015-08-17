//
//  iCloudPhotoViewController.m
//  Blocstagram
//
//  Created by Henry Smith on 8/15/15.
//  Copyright (c) 2015 Henry Smith. All rights reserved.
//

#import "iCloudPhotoViewController.h"
#import "CropImageViewController.h"
#import <Photos/Photos.h>

@interface iCloudPhotoViewController() <CropImageViewControllerDelegate>

@end

@implementation iCloudPhotoViewController

- (void) viewDidLoad{
    [super viewDidLoad];

    self.navigationItem.title = NSLocalizedString(@"iCloud Photos", @"iCloud photographs");
    [self.navigationItem.rightBarButtonItem setTitle:@""];
    [self.navigationItem.rightBarButtonItem setAction:nil];
}

- (void) cancelPressed:(UIBarButtonItem *)sender {
    [self.delegate iCloudPhotoViewController:self didCompleteWithImage:nil];
}

- (void) loadAssets {
    PHFetchOptions *options = [[PHFetchOptions alloc] init];
    options.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:YES]];
    self.result = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeMoment subtype:PHAssetCollectionSubtypeAlbumCloudShared options:nil];
    NSLog(@"%@", [self.result description]);
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSInteger imageViewTag = 543210;
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    UIImageView *imageView = (UIImageView *)[cell.contentView viewWithTag:imageViewTag];
    
    if (!imageView) {
        imageView = [[UIImageView alloc] initWithFrame:cell.contentView.bounds];
        imageView.tag = imageViewTag;
        imageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.clipsToBounds = YES;
        imageView.frame = CGRectMake(CGRectGetMinX(imageView.frame) + 1, CGRectGetMinY(imageView.frame) + 1, CGRectGetMaxX(imageView.frame) - 1, CGRectGetMaxY(imageView.frame) - 1);
        [cell.contentView addSubview:imageView];
    }
    
    if (cell.tag != 0) {
        [[PHImageManager defaultManager] cancelImageRequest:(PHImageRequestID)cell.tag];
    }
    
    UICollectionViewFlowLayout *flowLayout = (UICollectionViewFlowLayout *)self.collectionViewLayout;
    PHAsset *asset = self.result[indexPath.row];

    PHImageRequestOptions *options = [[PHImageRequestOptions alloc] init];
    options.networkAccessAllowed = YES;
    options.deliveryMode = PHImageRequestOptionsDeliveryModeHighQualityFormat;
    options.synchronous = NO;
    
    cell.tag = [[PHImageManager defaultManager] requestImageForAsset:asset targetSize:flowLayout.itemSize contentMode:PHImageContentModeAspectFill options:options resultHandler:^(UIImage *result, NSDictionary *info) {
        UICollectionViewCell *cellToUpdate = [collectionView cellForItemAtIndexPath:indexPath];
        
        if (cellToUpdate) {
            UIImageView *imageView = (UIImageView *)[cellToUpdate.contentView viewWithTag:imageViewTag];
            imageView.image = result;
        }
    }];
    
    return cell;
}

#pragma mark - CropImageViewControllerDelegate

- (void) cropControllerFinishedWithImage:(UIImage *)croppedImage {
    [self.delegate iCloudPhotoViewController:self didCompleteWithImage:croppedImage];
}



@end
