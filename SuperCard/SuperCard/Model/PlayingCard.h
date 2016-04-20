//
//  PlayingCard.h
//  Matchismo
//
//  Created by Dean Chen on 16/4/7.
//  Copyright © 2016年 Dean Chen. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card
@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *) validSuits;
+ (NSUInteger) maxRank;

@end
