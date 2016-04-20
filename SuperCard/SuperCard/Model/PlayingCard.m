//
//  PlayingCard.m
//  Matchismo
//
//  Created by Dean Chen on 16/4/7.
//  Copyright © 2016年 Dean Chen. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard
- (NSString *) contents {
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

static const int maxSuit = 4;
static const int maxRank = 13;

- (int) match:(NSArray *)otherCards
{
    int score = 0;
    if ([otherCards count]) {
        NSArray *cards = [otherCards arrayByAddingObject:self];
     
        int *rankCount = (int *) malloc (sizeof(int) * (maxRank+1));
        int *suitCount = (int *) malloc (sizeof(int) * maxSuit);
        memset(rankCount, 0, (maxRank+1) * sizeof(int));
        memset(suitCount, 0, maxSuit * sizeof(int));
        
        for (int i = 0; i < [cards count]; i++) {
            PlayingCard *card = [cards objectAtIndex:i];
            rankCount[card.rank]++;
            suitCount[[[PlayingCard validSuits] indexOfObject:card.suit]]++;
        }
        
        for (int i = 1; i <= maxRank; i++) score += rankCount[i] < 2 ? 0 : (rankCount[i] - 1) * 4;
        for (int i = 0; i < maxSuit; i++) score += suitCount[i] < 2 ? 0 : (suitCount[i] - 1);
    }
    
    return score;
}


@synthesize suit = _suit; // because we provide setter AND getter

+ (NSArray *) validSuits {
    return @[@"♥", @"♣", @"♠", @"♦"];
}

+ (NSArray *) rankStrings {
    return @[@"?", @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}

+ (NSUInteger) maxRank
{
    return maxRank;
}

- (void) setSuit:(NSString *)suit {
    if ([[PlayingCard validSuits]  containsObject:suit ])
        _suit = suit;
}

- (NSString *) suit {
    return _suit ? _suit : @"?";
}


- (void) setRank:(NSUInteger)rank {
    if (rank <= maxRank) {
        _rank = rank;
    }
}

@end
