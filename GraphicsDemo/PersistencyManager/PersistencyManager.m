//
//  PersistencyManager.m
//  GraphicsDemo
//
//  Created by Adela Toderici on 25/01/16.
//  Copyright © 2016 Adela Toderici. All rights reserved.
//

#import "PersistencyManager.h"
#import "Graph.h"

@interface PersistencyManager() {
    NSMutableArray *graphs;
}

@end

@implementation PersistencyManager

+ (PersistencyManager *)sharedInstance {
    
    static PersistencyManager *_sharedInstance = nil;
    
    static dispatch_once_t oncePredicate;
    
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[PersistencyManager alloc] init];
    });
    
    return _sharedInstance;
}

- (id)init {
    
    self = [super init];
    if (self) {
        
        graphs = [[NSMutableArray alloc] initWithObjects:[[Graph alloc] initWithTitle:@"First Graph" points:@[@6, @9, @5, @7, @10, @8, @3, @6, @5, @9, @4, @6]],
                 [[Graph alloc] initWithTitle:@"Second Graph" points:@[@3, @1, @7, @10, @4, @6, @5, @9, @3, @7]],
                 [[Graph alloc] initWithTitle:@"Third Graph" points:@[@10, @2, @9, @6, @10, @5]],
                 [[Graph alloc] initWithTitle:@"Fourth Graph" points:@[@2, @8, @6, @10, @4, @8, @6, @3, @6, @5, @9, @4, @10, @2, @8]] ,nil];
    }
    return self;
}

- (NSArray *)getGraphs {
    return graphs;
}

@end
