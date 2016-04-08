//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Dean Chen on 16/4/1.
//  Copyright © 2016年 Dean Chen. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;

@property (nonatomic) int flipCount;
@property (nonatomic) Deck * deck;
@end

@implementation ViewController

- (Deck *) deck {
    if (!_deck) _deck = [[PlayingCardDeck alloc] init];
    return _deck;
}

- (void) setFlipCount:(int)flipCount {
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
    NSLog(@"flipsLable change to %d", self.flipCount);
}

- (IBAction)touchCardButton:(UIButton *)sender {
    if ([sender.currentTitle length]) {
        [sender setBackgroundImage: [UIImage imageNamed:@"cardback"]
                          forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
    } else if (self.flipCount < 104){
        [sender setBackgroundImage: [UIImage imageNamed:@"cardfront"]
                          forState:UIControlStateNormal];
        Card *card = [self.deck drawRandomCard];
        [sender setTitle:card.contents forState:UIControlStateNormal];
        NSLog(@"card =  %@", card.contents);
    }
    if (self.flipCount < 104) self.flipCount++;
    
}

@end
