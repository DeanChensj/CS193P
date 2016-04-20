//
//  GameResult.m
//  Matchismo
//
//  Created by Dean Chen on 16/4/19.
//  Copyright © 2016年 Dean Chen. All rights reserved.
//

#import "GameResult.h"

@interface GameResult()

// @property (nonatomic, strong) NSMutableArray* results;

@end

@implementation GameResult

- (instancetype) initWithCards:(NSArray *)cards withMatchScore:(NSInteger)matchScore withStatus:(enum Status)status
{
    self = [super init];
    if (self){
        _cards = cards;
        _matchScore = matchScore;
        _status = status;
    }
    return self;
}

- (void)addNewResult:(NSAttributedString *)newResult
{
    // [self.results addObject:newResult];
}




@end
