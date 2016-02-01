//
//  GraphicView.h
//  GraphicsDemo
//
//  Created by Adela Toderici on 21/12/15.
//  Copyright © 2015 Adela Toderici. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GraphViewDelegate;

@interface GraphicView : UIView

@property (nonatomic, weak) id <GraphViewDelegate> delegate;

@property (nonatomic, strong) NSArray *graphPoints;
@property (strong, nonatomic) UILabel *titleGraphLabel;
@property (nonatomic, assign) NSInteger counter;

- (CGFloat)columnXPoint:(int)column;

@end

@protocol GraphViewDelegate <NSObject>

- (void)moveView:(GraphicView *)view withSwipe:(UISwipeGestureRecognizer *)swipe;

@end
