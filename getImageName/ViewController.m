//
//  ViewController.m
//  getImageName
//
//  Created by Code_Hou on 2017/3/26.
//  Copyright © 2017年 侯森魁. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    libs();
    allClassName();
    // Do any additional setup after loading the view, typically from a nib.
}
void libs(){
    
    NSLog(@"获取指定类所在的动态库");
    
    NSLog(@"UIView's Framework's:%s",class_getImageName(NSClassFromString(@"UIView")));
    
    
}

void allClassName(){
    NSLog(@"获取指定库或框架中所有类的类名");
    uint outCount = 0;
    const char **classes = objc_copyClassNamesForImage(class_getImageName(NSClassFromString(@"UIView")), &outCount);
    NSLog(@"count  =%d",outCount);
    //UIKit.framework/UIKit 2052个类，包括隐藏类和公开类
    for (int i = 0 ; i<outCount; i++) {
        
        NSLog(@"class name :%s",classes[i]);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
