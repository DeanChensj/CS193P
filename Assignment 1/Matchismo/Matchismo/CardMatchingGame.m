//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Dean Chen on 16/4/10.
//  Copyright © 2016年 Dean Chen. All rights reserved.
//

#import "CardMatchingGame.h"


@interface CardMatchingGame()
@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards; // of Cards
@property (nonatomic) NSInteger chosenCnt;
@property (nonatomic, readwrite) NSString *tag;
@end


@implementation CardMatchingGame

- (NSMutableArray *) cards
{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (instancetype) initWithCardCount:(NSUInteger)count
                         usingDeck:(Deck *)deck
{
    self = [super init];
    if (self) {
        for (int i  = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            } else {
                self = nil;
                break;
            }
        }
        self.chosenCnt = 0;
    }
    return self;
}

- (Card *)cardAtIndex:(NSUInteger)index
{
    return index < [self.cards count] ? self.cards[index] : nil;
}

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;

- (void)chooseCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    _tag = @"";
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
        } else {
            if (_is2CardMatch) {
                // match against other chosen cards
                for (Card *otherCard in self.cards) {
                    if (otherCard.isChosen && !otherCard.isMatched) {
                        int matchScore = [card match:@[otherCard]];
                        if (matchScore) {
                            self.score += matchScore * MATCH_BONUS;
                            card.matched = YES;
                            otherCard.matched = YES;
                            _tag = [NSString
                                    stringWithFormat:@"Matched %@ %@ for %d points", card.contents, otherCard.contents, matchScore * MATCH_BONUS];
                        } else {
                            self.score -= MISMATCH_PENALTY;
                            otherCard.chosen = NO;
                            _tag = [NSString
                                    stringWithFormat:@"%@ %@ don't match! %d point penalty!", card.contents, otherCard.contents, MISMATCH_PENALTY];
                        }
                        break; // can only choose 2 cards for now
                    }
                }
                if ([_tag isEqualToString:@""]) _tag = card.contents;
                
            } else {
                if (self.chosenCnt == 2) {
                    NSMutableArray *cards = [[NSMutableArray alloc] init];
                    
                    for (Card *otherCard in self.cards) {
                        if (otherCard.isChosen && !otherCard.isMatched) {
                            [cards addObject:otherCard];
                        }
                    }
             
                    int matchScore = [card match:cards];
                    if (matchScore) {
                        self.score += matchScore * MATCH_BONUS;
                        card.matched = YES;
                        for (Card *otherCard in cards) otherCard.matched = YES;
                        self.chosenCnt = -1;
                        _tag = [NSString
                                stringWithFormat:@"Matched %@ %@ %@ for %d points", card.contents, ((Card *)cards[0]).contents, ((Card *)cards[1]).contents, matchScore * MATCH_BONUS];
                    } else {
                        self.score -= MISMATCH_PENALTY;
                        for (Card *otherCard in cards) otherCard.chosen = NO;
                        self.chosenCnt = 0;
                        _tag = [NSString
                                stringWithFormat:@"%@ %@ %@ don't match! %d point penalty!", card.contents, ((Card *)cards[0]).contents, ((Card *)cards[1]).contents, MISMATCH_PENALTY];
                    }  
                }
                self.chosenCnt++;
           
            }
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
            if ([_tag isEqualToString:@""]) _tag = card.contents;
        }
        
    }
}







@end
