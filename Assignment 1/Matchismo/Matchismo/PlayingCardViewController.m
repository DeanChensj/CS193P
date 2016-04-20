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

- (NSAttributedString *)showGameResult:(GameResult *)gameResult
{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] init];
    
    if (gameResult) {
        if (gameResult.status == CHOSEN) {
            Card *card = [gameResult.cards firstObject];
            [str appendAttributedString:[[NSAttributedString alloc] initWithString:@"Chosen:      "]];
            [str appendAttributedString:[[NSAttributedString alloc] initWithString:card.contents]];
        } else if (gameResult.status == DISMISS){
            Card *card = [gameResult.cards firstObject];
            [str appendAttributedString:[[NSAttributedString alloc] initWithString:@"Unchosen:    "]];
            [str appendAttributedString:[[NSAttributedString alloc] initWithString:card.contents]];
        } else {
            for (Card *card in gameResult.cards) {
                [str appendAttributedString:[[NSAttributedString alloc] initWithString:card.contents]];
                [str appendAttributedString:[[NSAttributedString alloc] initWithString:@"    "]];
                
            }
            
            if (gameResult.matchScore > 0) {
                [str appendAttributedString:[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"Match:        +%ld", gameResult.matchScore]]];
            } else if (gameResult.matchScore < 0) {
                [str appendAttributedString:[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"Mismatch:     %ld", gameResult.matchScore]]];
            }
        }
        
    }
    return str;
}

- (NSAttributedString *)titleForCard:(Card *)card
{
    return card.isChosen ? [[NSAttributedString alloc] initWithString:card.contents] : [[NSAttributedString alloc] initWithString:@""];
}

- (UIImage *)backgroundImageForCard:(Card *)card
{
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
}

- (NSAttributedString *)showCard:(Card *)card
{
    return [self titleForCard:card];
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    _game.is2CardMatch = YES;
}

@end
