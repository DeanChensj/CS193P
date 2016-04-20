//
//  SetCardDeck.m
//  Matchismo
//
//  Created by Dean Chen on 16/4/17.
//  Copyright © 2016年 Dean Chen. All rights reserved.
//

#import "SetCardDeck.h"
#import "SetCard.h"

@implementation SetCardDeck

#define PROPERTY_NUMS 3

- (instancetype) init { // use instancetype for init function
    self = [super init];
    if (self) {
        for (int i = 0; i < PROPERTY_NUMS; i++) {
            for (int j = 0; j < PROPERTY_NUMS; j++) {
                for (int k = 0; k < PROPERTY_NUMS; k++) {
                    for (int l = 0; l < PROPERTY_NUMS; l++) {
                        SetCard *card = [[SetCard alloc] init];
                        card.number = i;
                        card.symbol = j;
                        card.shading = k;
                        card.color = l;
                        [self addCard:card];
                    }
                }
            }
        }
    }
    return self;
}

@end
