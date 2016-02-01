 //
//  ViewController.m
//  GraphicsDemo
//
//  Created by Adela Toderici on 21/12/15.
//  Copyright © 2015 Adela Toderici. All rights reserved.
//

#import "ViewController.h"
#import "GraphicView.h"
#import "HorizontalView.h"
#import "PersistencyManager.h"
#import "Graph.h"

#define Y_ORIGIN 20
#define DAMPING_VALUE 70.0f
#define VELOCITY_VALUE 10.0f

@interface ViewController () <HorizontalViewDelegate, GraphViewDelegate>

@property (strong, nonatomic) HorizontalView *horizontalView;
@property (strong, nonatomic) GraphicView *graphView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) UILabel *titleGraphLabel;
@property (strong, nonatomic) UIView *labelsContainer;
@property (nonatomic, strong) NSArray *graphArray;
@property (nonatomic, strong) NSArray *tableArray;
@property (nonatomic, assign) NSInteger counter;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTableView];
    _tableArray = [[PersistencyManager sharedInstance] getGraphs];
    
    _horizontalView = [[HorizontalView alloc] initWithFrame:CGRectMake(0, Y_ORIGIN, self.view.frame.size.width, self.view.frame.size.height/2.3)];
    _horizontalView.backgroundColor = [UIColor clearColor];
    _horizontalView.delegate = self;
    [self.view addSubview:_horizontalView];
}

- (void)setupTableView {
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"identifier"];
    _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

- (void)swipeGraphViewWithOptions:(UIViewAnimationOptions)option
                         andCount:(NSInteger)count {
    [self animateViewWithOptions:option
                           value:_horizontalView.frame.size.width/_tableArray.count*count];
}

- (void)animateViewWithOptions:(UIViewAnimationOptions)option value:(CGFloat)value {
    
    [UIView animateWithDuration:1.2
                          delay:0.0
         usingSpringWithDamping:DAMPING_VALUE
          initialSpringVelocity:VELOCITY_VALUE
                        options:option
                     animations:^{
                         _horizontalView.frame = CGRectMake(-value,
                                                            _horizontalView.frame.origin.y,
                                                            _horizontalView.frame.size.width,
                                                            _horizontalView.frame.size.height);
                     } completion:nil];
}

- (void)redrawGraphicWithArray:(NSArray *)array {
    _graphView.graphPoints = array;
    [_graphView setNeedsDisplay];
}

#pragma mark - UITableView Delegation
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _tableArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"identifier"];
    NSInteger index = indexPath.row + 1;
    cell.textLabel.text = [NSString stringWithFormat:@"Data content no#%li", (long)index];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.row > _counter) {
        _counter = indexPath.row;
        [self swipeGraphViewWithOptions:UIViewAnimationOptionTransitionFlipFromLeft
                               andCount:indexPath.row];
    } else {
        _counter = indexPath.row;
        [self swipeGraphViewWithOptions:UIViewAnimationOptionTransitionFlipFromRight
                               andCount:indexPath.row];
    }
}

#pragma mark - HorizontalScrollDelegate methods

- (NSInteger)numberOfGraphViewsInHorizontalView:(HorizontalView *)view {
    return _tableArray.count;
}

- (void)loadHorizontalView:(HorizontalView *)view withGraphicAtIndex:(NSInteger)index {
    
    Graph *graph = [_tableArray objectAtIndex:index];
    
    _graphArray = graph.points;
    _graphView.titleGraphLabel.text = graph.title;

    [self redrawGraphicWithArray:_graphArray];
}

- (UIView *)createGraphInHorizontalView:(HorizontalView *)view {
    _graphView = [[GraphicView alloc] init];
    _graphView.delegate = self;
    _graphView.backgroundColor = [UIColor clearColor];
    return _graphView;
}

#pragma mark - GraphViewDelegate methods

- (void)moveView:(GraphicView *)view withSwipe:(UISwipeGestureRecognizer *)swipe{
    if (swipe.direction == UISwipeGestureRecognizerDirectionLeft && _counter < _tableArray.count-1) {
        _counter++;
        [self swipeGraphViewWithOptions:UIViewAnimationOptionTransitionFlipFromLeft
                                        andCount:_counter];
    } else if (swipe.direction == UISwipeGestureRecognizerDirectionRight && _counter > 0) {
        _counter--;
        [self swipeGraphViewWithOptions:UIViewAnimationOptionTransitionFlipFromRight
                               andCount:_counter];
    }
}

@end
