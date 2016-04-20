//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Dean Chen on 16/4/1.
//  Copyright © 2016年 Dean Chen. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCard.h"
#import "ResultViewController.h"


@interface ViewController ()
@property (strong, nonatomic) CardMatchingGame *game;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@end

@implementation ViewController
@synthesize game = _game;

#pragma mark - Properties

- (CardMatchingGame *)game
{
    if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                          usingDeck: [self createDeck]];
    return _game;
}

- (Deck *)createDeck
{
    return nil;
}

#pragma mark - Buttons

- (IBAction)restartButton:(UIButton *)sender {
    bool matchMode = _game.is2CardMatch;
    _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                              usingDeck: [self createDeck]];
    _game.is2CardMatch = matchMode;
    
    for (UIButton *cardButton in self.cardButtons) {
        
        NSUInteger cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setAttributedTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = YES;
    }
    self.scoreLabel.text = @"Score:0";
    self.resultLabel.text = @"";
}

- (IBAction)touchCardButton:(UIButton *)sender
{
    NSUInteger chosenButtonIndex = [self.cardButtons indexOfObject:sender];
    
    [self.game chooseCardAtIndex:chosenButtonIndex];
    [self updateUI];
}

#pragma mark - UI

- (NSAttributedString *)showCard:(Card *)card{
    return nil;
}


- (void)updateUI
{
    for (UIButton *cardButton in self.cardButtons) {
        NSUInteger cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        
        [cardButton setAttributedTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card]
                              forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %ld", self.game.score];
    self.resultLabel.attributedText = [self showLatestGameResult];
    NSString *string = [[self showLatestGameResult] string];
    NSLog(string);
    
}

- (NSAttributedString *)titleForCard:(Card *)card
{
    return nil;
}

- (UIImage *)backgroundImageForCard:(Card *)card
{
    return nil;
}

#pragma mark - GameResult

- (NSAttributedString *)showAllGameResult
{
    NSArray *allResults = [_game getAllGameResult];
    NSMutableAttributedString *allResultsString = [[NSMutableAttributedString alloc] init];
    for (GameResult *itemResult in allResults) {
        [allResultsString appendAttributedString:[self showGameResult:itemResult]];
        [allResultsString appendAttributedString:[[NSAttributedString alloc] initWithString:@"\n"] ];
    }
    return allResultsString;
}

- (NSAttributedString *)showLatestGameResult
{
    GameResult *latestResult = [_game getCurrentGameResult];
    return [self showGameResult:latestResult];
}

- (NSAttributedString *)showGameResult:(GameResult *)gameResult
{
    return nil;
}

#pragma mark - ViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showresult"]) {
        if ([segue.destinationViewController isKindOfClass:[ResultViewController class]]) {
            ResultViewController *resultVC  = (ResultViewController *)segue.destinationViewController;
            resultVC.resultString = [self showAllGameResult];
        }
    }
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self updateUI];
}

@end
