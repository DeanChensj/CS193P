//
//  SetCard.h
//  Matchismo
//
//  Created by Dean Chen on 16/4/17.
//  Copyright © 2016年 Dean Chen. All rights reserved.
//

#import "Card.h"

@interface SetCard : Card
// number (one, two, or three); symbol (diamond, squiggle, oval); shading (solid, striped, or open); and color (red, green, or purple)

@property (nonatomic) NSUInteger number;
@property (nonatomic) NSUInteger symbol;
@property (nonatomic) NSUInteger shading;
@property (nonatomic) NSUInteger color;

- (int) match: (NSArray *) otherCards;

+ (NSArray *) validSymbol;
@end
