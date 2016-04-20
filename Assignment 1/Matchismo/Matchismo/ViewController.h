//
//  ViewController.h
//  Matchismo
//
//  Created by Dean Chen on 16/4/1.
//  Copyright © 2016年 Dean Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Deck.h"
#import "Card.h"
#import "CardMatchingGame.h"

@interface ViewController : UIViewController {
    CardMatchingGame *_game;
}

// protected, must be implemented in subClass
- (Deck *)createDeck;

- (NSAttributedString *)showCard:(Card *)card;

- (NSAttributedString *)showGameResult:(GameResult *)gameResult;

- (NSAttributedString *)showAllGameResult;

@end

