//
//  Graph.h
//  GraphicsDemo
//
//  Created by Adela Toderici on 25/01/16.
//  Copyright © 2016 Adela Toderici. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Graph : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSArray *points;

- (id)initWithTitle:(NSString *)title
             points:(NSArray *)points;

@end
