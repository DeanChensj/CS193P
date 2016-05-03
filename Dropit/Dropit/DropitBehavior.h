//
//  DropitBehavior.h
//  Dropit
//
//  Created by Dean Chen on 16/5/2.
//  Copyright © 2016年 Dean Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DropitBehavior : UIDynamicBehavior

- (void)addItem:(id <UIDynamicItem>)item;
- (void)removeItem:(id <UIDynamicItem>)item;

@end
