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


@interface CardMatchingGame : NSObject

// designated initializer
- (instancetype)initWithCardCount:(NSUInteger)count
                       usingDeck:(Deck *)deck;

- (void)chooseCardAtIndex:(NSUInteger)index;

- (Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) NSInteger score;

@property BOOL is2CardMatch;

@property (nonatomic, readonly) NSString *tag;
@end
