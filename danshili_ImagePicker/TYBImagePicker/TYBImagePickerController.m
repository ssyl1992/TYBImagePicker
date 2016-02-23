//
//  TYBImagePickerController.m
//  danshili_ImagePicker
//
//  Created by 滕跃兵 on 16/2/16.
//  Copyright © 2016年 tyb. All rights reserved.
//

#import "TYBImagePickerController.h"
#import "AppDelegate.h"

@interface TYBImagePickerController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@end

@implementation TYBImagePickerController


+ (instancetype)defaultImagePicker{
    return [TYBImagePickerController alertControllerWithTitle:@"请选择一种方式来获取图片" message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
}



- (void)setItems{
    UIAlertAction *actionAbum = [UIAlertAction actionWithTitle:@"从相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"从相册选择");
        UIImagePickerController *picker = [[UIImagePickerController alloc]init];
        picker.delegate = self;
        
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
             picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            [self.superController presentViewController:picker animated:YES completion:nil];
            
        }else {
            
        }
        
    }];
    [self addAction:actionAbum];
    UIAlertAction *actionPhoto = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"拍照");
        
        UIImagePickerController *picker = [[UIImagePickerController alloc]init];
        picker.delegate = self;
        
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            picker.sourceType = UIImagePickerControllerSourceTypeCamera;
            [self.superController presentViewController:picker animated:YES completion:nil];
            
        }else {
            NSLog(@"模拟器不支持该功能，请在真机上调试");
        }
    }];
    [self addAction:actionPhoto];
    
    UIAlertAction *actionCancle = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [self addAction:actionCancle];
    
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self setItems];
}
- (void)viewDidLoad {
    [super viewDidLoad];
//    AppDelegate *delegate = [[AppDelegate alloc]init];
//    NSLog(@"alertController---View:%@",self.view);
//    NSLog(@"alertController---subView:%@",self.view.subviews);
//    NSLog(@"alertController---superview:%@",self.view.superview);
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




#pragma mark -- UIImagePickerController delegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    if(picker.sourceType == UIImagePickerControllerSourceTypeCamera){
        UIImage *image = info[UIImagePickerControllerOriginalImage];
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
    }
    self.callBack(info);
    [self.superController dismissViewControllerAnimated:YES completion:nil];
}
- (void)didSelectedMedia:(callBack)result {
    _callBack = result;
}


@end
