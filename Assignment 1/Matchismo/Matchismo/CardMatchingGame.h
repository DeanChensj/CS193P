//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Dean Chen on 16/4/10.
//  Copyright © 2016年 Dean Chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"
#import "GameResult.h"

@interface CardMatchingGame : NSObject

// designated initializer
- (instancetype)initWithCardCount:(NSUInteger)count
                       usingDeck:(Deck *)deck;

- (void)chooseCardAtIndex:(NSUInteger)index;

- (Card *)cardAtIndex:(NSUInteger)index;

- (GameResult *)getCurrentGameResult;

- (NSArray *)getAllGameResult;

@property (nonatomic, readonly) NSInteger score;

@property BOOL is2CardMatch;

@end
