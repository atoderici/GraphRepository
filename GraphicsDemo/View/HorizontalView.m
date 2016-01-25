//
//  HorizontalView.m
//  GraphicsDemo
//
//  Created by Adela Toderici on 11/01/16.
//  Copyright © 2016 Adela Toderici. All rights reserved.
//

#import "HorizontalView.h"

#define PADDING 19
#define yPOSITION 20

@interface HorizontalView()

@end

@implementation HorizontalView {
    NSInteger counter;
}

- (void)reload {
    
    if (!self.delegate) return;

    CGFloat xValue = 0;
    CGFloat paddingValue = self.frame.size.width/PADDING;
    
    for (NSInteger i = 0; i < [self.delegate numberOfGraphViewsInHorizontalView:self]; i++) {
        xValue += paddingValue;
        
        UIView *view = [self.delegate createGraphInHorizontalView:self];
        [self.delegate loadHorizontalView:self withGraphicAtIndex:i];
        CGFloat width = self.frame.size.width - (paddingValue*2);
        view.frame = CGRectMake(xValue, yPOSITION, width, self.frame.size.height-yPOSITION);
        [self addSubview:view];
        
        xValue += width + paddingValue;
    }
    
    CGRect newFrame = self.frame;
    newFrame.size.width = xValue;
    self.frame = newFrame;
}

- (void)didMoveToSuperview {
    [self reload];
}



@end
