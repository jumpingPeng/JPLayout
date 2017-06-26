//
//  JPLayout.m
//  JPLayout
//
//  Created by JUMPING on 2015/6/23.
//  Copyright © 2015年 JUMPING. All rights reserved.
//

#import "JPLayout.h"


@implementation JPLayout

static JPLayout *sharedPublic = nil;

+ (JPLayout *)sharedPublic
{
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedPublic = [[self alloc] init];
    });
    return sharedPublic;
}

//递归获得子视图动态设置frame
+ (void)makeView:(UIView *)view
{
    NSMutableArray *subArray = [JPLayout findWithSuperView:view];
    for (int i = 0; i < subArray.count; i++) {
        UIView *subView = [subArray objectAtIndex:i];
        
        //宽高相同缩放
        if(subView.tag >= 1000 && subView.tag <= 2000){
            subView.frame = JPRectMakeEqual(subView.frame);
        }
        //常规缩放
        else{
            subView.frame = JPRectMake(subView.frame);
        }
        
    }
}

//递归获得子视图动态设置font
+ (void)makeFont:(UIView *)view
{
    NSMutableArray *buttonArray = [JPLayout findSubViewWithSuperView:view class:[UIButton class]];
    for (int i = 0; i < buttonArray.count; i++) {
        UIButton *subView = [buttonArray objectAtIndex:i];
        subView.titleLabel.font = [subView.titleLabel.font fontWithSize:subView.titleLabel.font.pointSize * ZS_X];
    }
    
    NSMutableArray *labels = [JPLayout findSubViewWithSuperView:view class:[UILabel class]];
    for (int i = 0; i < labels.count; i++) {
        UILabel *subView = [labels objectAtIndex:i];
        subView.font = [subView.font fontWithSize:subView.font.pointSize * ZS_X];
    }
}

//[subView isKindOfClass:[UIPickerView class]]|  [subView isKindOfClass:[UISwitch class]]
//动态获得所有子视图
+ (NSMutableArray *)findWithSuperView:(UIView *)superView {
    NSMutableArray *array = [NSMutableArray array];
    
    for (int i = 0; i < superView.subviews.count; i++) {
        UIView *subView = [superView.subviews objectAtIndex:i];
        if (![subView isKindOfClass:[UIPickerView class]]) {
            [array addObject:subView];
        }
        
        if(subView.subviews.count > 0
           && ![subView isKindOfClass:[UIButton class]]
           && ![subView isKindOfClass:[UISwitch class]]
           && ![subView isKindOfClass:[UIPickerView class]]) {
            [array addObjectsFromArray:[self findWithSuperView:subView]];
        }
    }
    return array;
}

//动态获得指定子视图
+ (NSMutableArray *)findSubViewWithSuperView:(UIView *)superView class:(Class )class{
    NSMutableArray *array = [NSMutableArray array];
    
    for (int i = 0; i < superView.subviews.count; i++) {
        UIView *subView = [superView.subviews objectAtIndex:i];
        if ([subView isKindOfClass:class]) {
            [array addObject:subView];
        } else if(subView.subviews.count > 0
                 && ![subView isKindOfClass:[UIButton class]] ) {
            [array addObjectsFromArray:[self findSubViewWithSuperView:subView class:class]];
        }
    }
    return array;
}



@end


