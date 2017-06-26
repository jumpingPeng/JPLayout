//
//  JPLayout.h
//  JPLayout
//
//  Created by JUMPING on 2015/6/23.
//  Copyright © 2015年 JUMPING. All rights reserved.
//

#import <UIKit/UIKit.h>

//屏幕宽
#define WIDTH [[UIScreen mainScreen] bounds].size.width
//屏幕高
#define HEIGHT [[UIScreen mainScreen] bounds].size.height

//缩放比例
#define ZS_X (WIDTH/320.0)
#define ZS_Y (HEIGHT /568.0)


@interface JPLayout : NSObject

+ (JPLayout *)sharedPublic;

+ (void)makeView:(UIView *)view;
+ (void)makeFont:(UIView *)view;

+ (NSMutableArray *)findWithSuperView:(UIView *)superView;
+ (NSMutableArray *)findSubViewWithSuperView:(UIView *)superView class:(Class )class;

@end


#pragma mark -
#pragma mark 重新规划视图坐标宽高

CG_INLINE CGRect JPRectMake(CGRect rect)
{
    CGRect rect2;
    rect2.origin.x = rect.origin.x * (WIDTH / 320.0);
    rect2.origin.y = rect.origin.y * (HEIGHT / 568.0);
    rect2.size.width = rect.size.width * (WIDTH / 320.0);
    rect2.size.height = rect.size.height * (HEIGHT / 568.0);
    
    return rect2;
}


CG_INLINE CGRect JPRectMakeEqual(CGRect rect)
{
    CGRect rect2;
    rect2.origin.x = rect.origin.x * (WIDTH / 320.0);
    rect2.origin.y = rect.origin.y * (HEIGHT / 568.0);
    rect2.size.width = rect.size.width * (WIDTH / 320.0);
    rect2.size.height = rect.size.height * (WIDTH / 320.0);
    
    return rect2;
}


