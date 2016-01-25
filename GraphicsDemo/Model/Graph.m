//
//  Graph.m
//  GraphicsDemo
//
//  Created by Adela Toderici on 25/01/16.
//  Copyright © 2016 Adela Toderici. All rights reserved.
//

#import "Graph.h"

@implementation Graph

- (id)initWithTitle:(NSString *)title
             points:(NSArray *)points {
    self = [super init];
    if (self) {
        _title = title;
        _points = points;
    }
    return self;
}

@end
