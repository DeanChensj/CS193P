//
//  BezierPathView.m
//  Dropit
//
//  Created by Dean Chen on 16/5/2.
//  Copyright © 2016年 Dean Chen. All rights reserved.
//

#import "BezierPathView.h"

@implementation BezierPathView

- (void)setPath:(UIBezierPath *)path
{
    _path = path;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    [self.path stroke];
}

@end
