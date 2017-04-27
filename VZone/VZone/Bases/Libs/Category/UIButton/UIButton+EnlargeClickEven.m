//
//  UIButton+EnlargeClickEven.m
//  JYallXiangMuTong
//
//  Created by 葬花桥 on 16/2/27.
//  Copyright © 2016年 陈石. All rights reserved.
//

#import "UIButton+EnlargeClickEven.h"
#import <objc/runtime.h>
@interface UIButton (EnlargeTouchArea)

- (void)setEnlargeEdgeWithTop:(CGFloat) top right:(CGFloat) right bottom:(CGFloat) bottom left:(CGFloat) left;

@end


@implementation UIButton (EnlargeTouchArea)


static char topNameKey;
static char rightNameKey;
static char bottomNameKey;
static char leftNameKey;

- (void)setEnlargeEdgeWithTop:(CGFloat) top right:(CGFloat) right bottom:(CGFloat) bottom left:(CGFloat) left
{
    objc_setAssociatedObject(self, &topNameKey, [NSNumber numberWithFloat:top], OBJC_ASSOCIATION_RETAIN);
    objc_setAssociatedObject(self, &rightNameKey, [NSNumber numberWithFloat:right], OBJC_ASSOCIATION_RETAIN);
    objc_setAssociatedObject(self, &bottomNameKey, [NSNumber numberWithFloat:bottom], OBJC_ASSOCIATION_RETAIN);
    objc_setAssociatedObject(self, &leftNameKey, [NSNumber numberWithFloat:left], OBJC_ASSOCIATION_RETAIN);
}

- (CGRect) enlargedRect
{
    NSNumber* topEdge = objc_getAssociatedObject(self, &topNameKey);
    NSNumber* rightEdge = objc_getAssociatedObject(self, &rightNameKey);
    NSNumber* bottomEdge = objc_getAssociatedObject(self, &bottomNameKey);
    NSNumber* leftEdge = objc_getAssociatedObject(self, &leftNameKey);
    if (topEdge && rightEdge && bottomEdge && leftEdge)
    {
        return CGRectMake(self.bounds.origin.x - leftEdge.floatValue,
                          self.bounds.origin.y - topEdge.floatValue,
                          self.bounds.size.width + leftEdge.floatValue + rightEdge.floatValue,
                          self.bounds.size.height + topEdge.floatValue + bottomEdge.floatValue);
    }
    else
    {
        return self.bounds;
    }
}

//- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
//{      //首先调用父类的方法确定点击的区域确实在按钮的区域中
//    BOOL res = [super pointInside:point withEvent:event];
//    if (res) {          //绘制一个圆形path
//        UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:self.bounds];          if ([path containsPoint:point]) {              //如果在path区域内，返回YES
//            return YES;
//        }
//        return NO;
//    }      return NO;
//}
- (UIView*)hitTest:(CGPoint) point withEvent:(UIEvent*) event
{
    CGRect rect = [self enlargedRect];
    if (CGRectEqualToRect(rect, self.bounds))
    {
        return [super hitTest:point withEvent:event];
    }
    return CGRectContainsPoint(rect, point) ? self : nil;
}
@end