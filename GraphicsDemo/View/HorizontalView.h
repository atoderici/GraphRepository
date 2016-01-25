//
//  HorizontalView.h
//  GraphicsDemo
//
//  Created by Adela Toderici on 11/01/16.
//  Copyright © 2016 Adela Toderici. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HorizontalViewDelegate;


@interface HorizontalView : UIView

@property (nonatomic, weak) id <HorizontalViewDelegate> delegate;

@end


@protocol HorizontalViewDelegate <NSObject>

- (NSInteger)numberOfGraphViewsInHorizontalView:(HorizontalView *)view;
- (UIView *)createGraphInHorizontalView:(HorizontalView *)view;
- (void)loadHorizontalView:(HorizontalView *)view withGraphicAtIndex:(NSInteger)index;

@end
