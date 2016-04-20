//
//  Deck.h
//  Matchismo
//
//  Created by Dean Chen on 16/4/4.
//  Copyright © 2016年 Dean Chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject
- (void) addCard: (Card *) card atTop: (BOOL) atTop;
- (void) addCard: (Card *) card;
- (Card *) drawRandomCard;

@end
