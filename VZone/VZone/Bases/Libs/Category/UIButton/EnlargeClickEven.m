//
//  EnlargeClickEven.m
//  JYallXiangMuTong
//
//  Created by 葬花桥 on 16/2/27.
//  Copyright © 2016年 陈石. All rights reserved.
//

#import "EnlargeClickEven.h"

@interface EnlargeClickEven ()
@property (nonatomic, assign) CGFloat top;
@property (nonatomic, assign) CGFloat right;
@property (nonatomic, assign) CGFloat bottom;
@property (nonatomic, assign) CGFloat left;
@end

@implementation EnlargeClickEven

- (void)setEnlargeEdgeWithTop:(CGFloat) top right:(CGFloat) right bottom:(CGFloat) bottom left:(CGFloat) left
{
    _top = top;
    _right = right;
    _bottom = bottom;
    _left = left;
}

- (CGRect) enlargedRect
{
    if (_top && _right && _bottom && _left)
    {
        return CGRectMake(self.bounds.origin.x - _left,
                          self.bounds.origin.y - _top,
                          self.bounds.size.width + _left + _right,
                          self.bounds.size.height + _top + _bottom);
    }
    else
    {
        return self.bounds;
    }
}

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
