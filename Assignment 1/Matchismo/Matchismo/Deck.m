//
//  Deck.m
//  Matchismo
//
//  Created by Dean Chen on 16/4/4.
//  Copyright © 2016年 Dean Chen. All rights reserved.
//

#import "Deck.h"

@interface Deck()
@property (strong, nonatomic) NSMutableArray *cards;
@end

@implementation Deck

- (void) addCard: (Card *) card atTop: (BOOL) atTop {
    
}

- (void) addCard: (Card *) card {
    [self addCard:card atTop:NO];
}

- (Card *) drawRandomCard { }


@end
