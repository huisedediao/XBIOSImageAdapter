//
//  ViewController.m
//  XBIOSImageAdapter
//
//  Created by xxb on 2018/1/31.
//  Copyright © 2018年 xxb. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+CustomFunctions.h"

#define savePath_base \
({\
NSInteger timeInterval = [[NSDate date] timeIntervalSince1970];\
NSString *base = [NSString stringWithFormat:@"/Users/xxb/Desktop/XBAdaptImages%zd/",timeInterval];\
base;\
})
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *directory = @"/Users/xxb/Desktop/anxinFile/切图 2/xxxhdpi";
    
    [self handleImagesAtDirectory:directory imageMultiple:8];\
}

- (void)handleImagesAtDirectory:(NSString *)directoryPath imageMultiple:(int)imageMultiple
{
    NSString *directory_new = savePath_base;

    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:directory_new] == NO)
    {
        [fileManager createDirectoryAtPath:directory_new withIntermediateDirectories:YES attributes:nil error:nil];
    }
    NSError *error = nil;
    NSArray *arr_imageFilePath = [fileManager subpathsOfDirectoryAtPath:directoryPath error:nil];
    if (error)
    {
        NSLog(@"%@",error);
    }
    for (NSString *path in arr_imageFilePath)
    {
        NSArray *arr_name = [[path lastPathComponent] componentsSeparatedByString:@"."];
        NSString *fileName_new = nil;
        UIImage *image = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",directoryPath,path]];
        CGFloat width_base = image.size.width / imageMultiple;
        CGFloat height_base = image.size.height / imageMultiple;
        for (int i = 2; i < 4; i++)
        {
            CGSize size_x = CGSizeMake(width_base * i, height_base * i);
            UIImage *image_x = [image scaledToSize:size_x];
            if (i == 2)
            {
                fileName_new = [NSString stringWithFormat:@"%@@2x.png",arr_name[0]];
            }
            else if (i == 3)
            {
                fileName_new = [NSString stringWithFormat:@"%@@3x.png",arr_name[0]];
            }
            NSString *filePathNew = [directory_new stringByAppendingString:fileName_new];
            NSLog(@"filePathNew:%@",filePathNew);
            [UIImagePNGRepresentation(image_x) writeToFile:filePathNew atomically:YES];
        }
    }
    
    NSLog(@"finish");
}



@end
