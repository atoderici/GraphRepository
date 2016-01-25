//
//  PersistencyManager.h
//  GraphicsDemo
//
//  Created by Adela Toderici on 25/01/16.
//  Copyright © 2016 Adela Toderici. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PersistencyManager : NSObject

+ (PersistencyManager *)sharedInstance;

- (NSArray *)getGraphs;

@end
