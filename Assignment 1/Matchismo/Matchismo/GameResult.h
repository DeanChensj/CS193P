//
//  GameResult.h
//  Matchismo
//
//  Created by Dean Chen on 16/4/19.
//  Copyright © 2016年 Dean Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameResult : NSObject

@property (nonatomic) NSArray* cards;

@property (nonatomic) NSInteger matchScore;

@property (nonatomic) enum Status{
    CHOSEN,
    DISMISS,
    CARD_CHANGED,
    SET_CHANGED
} status;

- (void)addNewResult:(NSAttributedString *)newResult;

- (instancetype) initWithCards:(NSArray *)cards withMatchScore:(NSInteger)matchScore withStatus:(enum Status)status;

@end
