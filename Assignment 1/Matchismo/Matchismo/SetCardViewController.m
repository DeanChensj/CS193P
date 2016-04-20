//
//  SetCardViewController.m
//  Matchismo
//
//  Created by Dean Chen on 16/4/17.
//  Copyright © 2016年 Dean Chen. All rights reserved.
//

#import "SetCardViewController.h"
#import "SetCardDeck.h"
#import "SetCard.h"

@interface SetCardViewController ()

@end

@implementation SetCardViewController

- (Deck *)createDeck
{
    return [[SetCardDeck alloc] init];
}

- (NSAttributedString *) showCard:(Card *)card
{
    if ([card isKindOfClass:[SetCard class]]) {
        SetCard *setCard = (SetCard *)card;
        NSMutableString *symbolStr = [[NSMutableString alloc] initWithString:[SetCard validSymbol][setCard.symbol]];
        for (int i = 0; i < setCard.number; i++) [symbolStr appendString:[SetCard validSymbol][setCard.symbol]];
        NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:symbolStr attributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
        
        //NSLog(@"sf");
        if (setCard.color == 0) {
            // open
            if (setCard.shading == 2) {
                [string addAttributes:@{ NSStrokeWidthAttributeName : @-5,
                                                        NSStrokeColorAttributeName : [UIColor redColor]}
                                range:NSMakeRange(0, [string length])];
            }
           else [string addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, [string length])];
        }
        if (setCard.color == 1) {
            if (setCard.shading == 2) {
                [string addAttributes:@{ NSStrokeWidthAttributeName : @-5,
                                         NSStrokeColorAttributeName : [UIColor greenColor]}
                                range:NSMakeRange(0, [string length])];
            }
            else [string addAttribute:NSForegroundColorAttributeName value:[UIColor greenColor] range:NSMakeRange(0, [string length])];
        }
        if (setCard.color == 2) {
            if (setCard.shading == 2) {
                [string addAttributes:@{ NSStrokeWidthAttributeName : @-5,
                                         NSStrokeColorAttributeName : [UIColor purpleColor]}
                                range:NSMakeRange(0, [string length])];
            }
            else [string addAttribute:NSForegroundColorAttributeName value:[UIColor purpleColor] range:NSMakeRange(0, [string length])];
        }
        
        // striped
        if (setCard.shading == 1) {
            [string addAttribute:NSUnderlineStyleAttributeName
                           value:[NSNumber numberWithInt:NSUnderlineStyleThick]
                                range:NSMakeRange(0, [string length])];
          
        }
        return string;
    }
    return nil;
}

- (NSAttributedString *)showGameResult:(GameResult *)gameResult
{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] init];
    if (gameResult) {
        if (gameResult.status == CHOSEN) {
            Card *card = (Card *)[gameResult.cards firstObject];
            [str appendAttributedString:[[NSAttributedString alloc] initWithString:@"Chosen:      "]];
            [str appendAttributedString:[self titleForCard:card]];
        } else if (gameResult.status == DISMISS){
            Card *card = [gameResult.cards firstObject];
            [str appendAttributedString:[[NSAttributedString alloc] initWithString:@"Unchosen:    "]];
            [str appendAttributedString:[self titleForCard:card]];
        } else {
            for (Card *card in gameResult.cards) {
                [str appendAttributedString:[self titleForCard:card]];
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
    return [self showCard:card];
}

- (UIImage *)backgroundImageForCard:(Card *)card
{
    return [UIImage imageNamed:card.isChosen ? @"setchosen" : @"cardfront"];
}


- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    _game.is2CardMatch = NO;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
