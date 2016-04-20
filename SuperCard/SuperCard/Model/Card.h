//
//  Card.h
//  Matchismo
//
//  Created by Dean Chen on 16/4/2.
//  Copyright © 2016年 Dean Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;
@property (nonatomic, getter=isChosen) BOOL chosen;
@property (nonatomic, getter=isMatched) BOOL matched;


- (int) match: (NSArray *) otherCards;

@end
