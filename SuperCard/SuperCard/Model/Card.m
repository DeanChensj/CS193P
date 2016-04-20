//
//  Card.m
//  Matchismo
//
//  Created by Dean Chen on 16/4/2.
//  Copyright © 2016年 Dean Chen. All rights reserved.
//

#import "Card.h"

@implementation Card

- (int) match:(NSArray *)otherCards {
    int score = 0;
    for (Card *card in otherCards) {
        if ([card.contents isEqualToString:self.contents]) {
            score = 1;
        }
    }
    return score;
}

@end
