//
//  TATriView.m
//  TriangleAni
//
//  Created by duan on 13-6-28.
//  Copyright (c) 2013年 duan. All rights reserved.
//

#import "TATriView.h"

@interface TATriView()
{
    NSTimer *aniTimer;
    double aniPoint;
    double maxAniPoint;
    BOOL isShow;
    
    double lrPoint;
    double maxLrPoint;
}

@end

@implementation TATriView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        aniPoint=0;
        maxAniPoint=10;
        
        lrPoint=0;
        maxLrPoint=10;
        
        self.backgroundColor=[UIColor clearColor];
    }
    return self;
}

-(void)showAni
{
    if (aniPoint==0) {
        isShow=YES;
        if (!aniTimer) {
            aniTimer=[NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(aniTimer_TimeInterval) userInfo:nil repeats:YES];
            [aniTimer retain];
        }
    }
    
}

-(void)hideAni
{
    if (aniPoint==maxAniPoint) {
        isShow=NO;
        if (!aniTimer) {
            aniTimer=[NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(aniTimer_TimeInterval) userInfo:nil repeats:YES];
            [aniTimer retain];
        }
    }
}

-(void)aniTimer_TimeInterval
{
    if (isShow) {
        aniPoint=aniPoint+1;
        lrPoint=lrPoint+1;
        if (lrPoint>maxLrPoint) {
            lrPoint=maxLrPoint;
        }
        [self setNeedsDisplay];
        if (aniPoint==maxAniPoint) {
            if (aniTimer) {
                [aniTimer invalidate];
                [aniTimer release];
                aniTimer=nil;
            }
        }
    }
    else
    {
        aniPoint=aniPoint-1;
        
        lrPoint=lrPoint-1;
        if (lrPoint<0) {
            lrPoint=0;
        }
        [self setNeedsDisplay];
        if (aniPoint==0) {
            if (aniTimer) {
                [aniTimer invalidate];
                [aniTimer release];
                aniTimer=nil;
            }
        }
    }
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor(context, 1, 0, 0, 1);
    CGContextMoveToPoint(context, 0, 0);
    CGContextAddLineToPoint(context, 260, 0);
    CGContextAddLineToPoint(context, 260, 30);
    CGContextAddLineToPoint(context, 110-lrPoint, 30);
    CGContextAddLineToPoint(context, 90, 30+aniPoint);
    CGContextAddLineToPoint(context, 70+lrPoint, 30);
    CGContextAddLineToPoint(context, 0, 30);
    CGContextAddLineToPoint(context, 0, 0);
    CGContextFillPath(context);
}


@end
