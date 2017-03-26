//
//  main.m
//  Category
//
//  Created by Code_Hou on 2017/3/26.
//  Copyright © 2017年 侯森魁. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
@interface RuntimeCategoryClass:NSObject
- (void)method1;
@end
@implementation RuntimeCategoryClass

- (void)method1{
    
    NSLog(@"self class:%@",self.class);
    
    NSLog(@"super class:%@",super.class);
    

}
@end
@interface RuntimeCategoryClass (Categroy)
- (void)method2;
@end


@implementation RuntimeCategoryClass(Categroy)

- (void)method2{
    
  
}

@end
void test(){

#pragma mark---
    NSLog(@"测试objc_class中的方法列表是否包含分类中得到方法");
    
    uint outcount = 0;
    
    Class cls  = RuntimeCategoryClass.class;

    Method *methodList  =class_copyMethodList(cls, &outcount);
    
    for (int i = 0 ; i<outcount; i++) {
        
        Method method = methodList[i];
        
        const char *name = sel_getName(method_getName(method));
        
        NSLog(@"RuntimeCategoryClass's method:%s",name);
        
        if (strcmp(name , sel_getName(@selector(method2)))) {
            
            NSLog(@"分类中的方法method2在objc_class的方法列表中");
        }
        
    }
    
    //由于objc_super->receiver就是self本身，所以该方法实际与下面这个调用是相同的：
    
    //struct objc_super { id receiver; Class superClass; };
    
    //这个结构体由两个成员：
    /*
     1.receive:即消息的实际接收者
     2.superClas:指针当前类的父类
     
     */
    
    

    RuntimeCategoryClass *class= [[RuntimeCategoryClass alloc]init];
    
    [class method1];
    
    
    
 }



void libs(){
    
    NSLog(@"获取指定类所在的动态库");
    
    NSLog(@"UIView's Framework's:%s",class_getImageName(NSClassFromString(@"UIView")));
    
    
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        test();
        
        libs();
        // insert code here...
        NSLog(@"Hello, World!");
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    }
    return 0;
}
