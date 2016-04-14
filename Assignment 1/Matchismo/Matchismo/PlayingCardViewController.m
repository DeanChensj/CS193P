//
//  PlayingCardViewController.m
//  Matchismo
//
//  Created by Dean Chen on 16/4/14.
//  Copyright © 2016年 Dean Chen. All rights reserved.
//

#import "PlayingCardViewController.h"
#import "PlayingCardDeck.h"

@implementation PlayingCardViewController 

- (Deck *)createDeck
{
    return [[PlayingCardDeck alloc] init];
}

@end
