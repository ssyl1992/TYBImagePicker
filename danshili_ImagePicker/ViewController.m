//
//  ViewController.m
//  danshili_ImagePicker
//
//  Created by 滕跃兵 on 16/2/15.
//  Copyright © 2016年 tyb. All rights reserved.
//

#import "ViewController.h"
#import "TYBImagePickerController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)alert:(id)sender {
    TYBImagePickerController *picker = [TYBImagePickerController defaultImagePicker];
//   picker.title = @"图片";
    picker.superController = self;
    
    [self presentViewController:picker animated:YES completion:^{
//        picker.view.superview.userInteractionEnabled = YES;
//        NSLog(@"%@",picker.view.superview);
//        [picker.view.superview addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget: self action: @selector(alertControllerBackgroundTapped)]];
    }];
    [picker didSelectedMedia:^(id obj) {
        NSLog(@"%@",obj);
        self.imageView.image = obj[UIImagePickerControllerOriginalImage];
    }];
    
    
}

- (void)alertControllerBackgroundTapped
{
    [self dismissViewControllerAnimated: YES
                             completion: nil];
}

- (IBAction)getPhotoFromAbum:(id)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc]init];
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.allowsEditing = YES;
    
    [self presentViewController:picker animated:YES completion:nil];
}
- (IBAction)getPhoto:(id)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc]init];
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    NSArray *array = [UIImagePickerController availableMediaTypesForSourceType:picker.sourceType];
    NSLog(@"%@",array);
    picker.mediaTypes = @[@"public.image",@"public.movie"];
    picker.cameraCaptureMode = UIImagePickerControllerCameraCaptureModeVideo;
    [self presentViewController:picker animated:YES completion:nil];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
