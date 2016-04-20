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
@property (nonatomic, strong) NSMutableArray *myGameResult; // of GameResult
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
        self.myGameResult = [[NSMutableArray alloc] init];
    }
    return self;
}

- (Card *)cardAtIndex:(NSUInteger)index
{
    return index < [self.cards count] ? self.cards[index] : nil;
}

static const int MISMATCH_PENALTY = 1;
static const int MATCH_BONUS = 5;
static const int COST_TO_CHOOSE = 1;

- (void)chooseCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    GameResult *currentResult = nil;
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
            self.chosenCnt--;
        } else {
            if (_is2CardMatch) {
                // match against other chosen PlayingCards
                NSMutableArray * cards = [[NSMutableArray alloc] initWithArray:@[card]];
                int matchScore = 0;
                
                for (Card *otherCard in self.cards) {
                    if (otherCard.isChosen && !otherCard.isMatched) {
                        [cards addObject:otherCard];
                        matchScore = [card match:@[otherCard]];
                        if (matchScore) {
                            matchScore *= MATCH_BONUS;
                            card.matched = YES;
                            otherCard.matched = YES;
                            
                            self.chosenCnt = -1;
                            currentResult = [[GameResult alloc] initWithCards:cards withMatchScore:matchScore * MATCH_BONUS withStatus: (enum Status) CARD_CHANGED];
                            
                        } else {
                            matchScore -= MISMATCH_PENALTY;
                            otherCard.chosen = NO;
                            self.chosenCnt = 0;
                            
                            currentResult = [[GameResult alloc] initWithCards:cards withMatchScore:-MISMATCH_PENALTY withStatus: (enum Status) CARD_CHANGED];
                            
                        }
                        self.score += matchScore;
                        currentResult = [[GameResult alloc] initWithCards:cards withMatchScore:matchScore withStatus: (enum Status) CARD_CHANGED];
                        break; // can only choose 2 cards for now
                    }
                }
                self.chosenCnt++;
                if (currentResult == nil) {
                    currentResult = [[GameResult alloc] initWithCards:@[card] withMatchScore:0 withStatus:(enum Status) CHOSEN];
                }
                
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
                        currentResult = [[GameResult alloc] initWithCards:cards withMatchScore:matchScore * MATCH_BONUS withStatus: (enum Status) SET_CHANGED];
                        
                    } else {
                        self.score -= MISMATCH_PENALTY;
                        for (Card *otherCard in cards) otherCard.chosen = NO;
                        self.chosenCnt = 0;
                        
                        currentResult = [[GameResult alloc] initWithCards:cards withMatchScore: - MISMATCH_PENALTY withStatus: (enum Status) SET_CHANGED];
                        
                    }
                    
                    [cards addObject:card];
                }
                self.chosenCnt++;
                
            }
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
            if (currentResult == nil) {
                currentResult = [[GameResult alloc] initWithCards:@[card] withMatchScore:0 withStatus:(enum Status) CHOSEN];
            }
        }
    }
    if (currentResult == nil) {
        currentResult = [[GameResult alloc] initWithCards:@[card] withMatchScore:0 withStatus:(enum Status) DISMISS];
    }
    [_myGameResult addObject:currentResult];
}

- (GameResult *)getCurrentGameResult
{
    return [_myGameResult lastObject];
}

- (NSArray *)getAllGameResult
{
    return _myGameResult;
}


@end
