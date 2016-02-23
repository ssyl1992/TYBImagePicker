//
//  TYBImagePickerController.h
//  danshili_ImagePicker
//
//  Created by 滕跃兵 on 16/2/16.
//  Copyright © 2016年 tyb. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^callBack)(id obj);

@interface TYBImagePickerController : UIAlertController





@property (nonatomic, strong) UIViewController *superController;

// 回调
@property (nonatomic, copy) callBack callBack;

+(instancetype)defaultImagePicker;

- (void)didSelectedMedia:(callBack)result;

@end
