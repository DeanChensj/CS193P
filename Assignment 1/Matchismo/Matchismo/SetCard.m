//
//  SetCard.m
//  Matchismo
//
//  Created by Dean Chen on 16/4/17.
//  Copyright © 2016年 Dean Chen. All rights reserved.
//

#import "SetCard.h"

@implementation SetCard

#define PROPERTY_NUMS 3
#define PROPERTY_TYPE_NUMS 4
#define NUMS PROPERTY_NUMS * PROPERTY_TYPE_NUMS

- (int) match: (NSArray *) otherCards{
    
    int score = 1;
    if ([otherCards count] == 2) {
        NSArray *cards = [otherCards arrayByAddingObject:self];
        
        int (*count)[PROPERTY_NUMS] = malloc (sizeof(int) * NUMS);
        for (int i = 0; i < PROPERTY_TYPE_NUMS; i++)
            for (int j = 0; j < PROPERTY_NUMS; j++)
                count[i][j] = 0;
        
        for (int i = 0; i < [cards count]; i++) {
            SetCard *card = [cards objectAtIndex:i];
            count[0][card.number]++;
            count[1][card.color]++;
            count[2][card.symbol]++;
            count[3][card.shading]++;
        }
        // debug
        NSMutableString *s = [[NSMutableString alloc] init];
        for (int i = 0; i < PROPERTY_TYPE_NUMS; i++){
            for (int j = 0; j < PROPERTY_NUMS; j++)
                [s appendFormat:@"%d ", count[i][j]];
            [s appendString:@"\n"];
        }
        // NSLog(s);
        
        for (int i = 0; i < PROPERTY_TYPE_NUMS; i++) {
            int tmpScore = 1;
            for (int j = 0; j < PROPERTY_NUMS; j++) {
                if (count[i][j] == 2) tmpScore = 0;
                else if (count[i][j] == 3) tmpScore = 1;
                
            }
            score = tmpScore ? score : 0;
            if (!score) return 0;
        }
    }
    return score ? 5 : 0;
}

+ (NSArray *) validSymbol
{
    return @[@"▲", @"●", @"■"];
}

- (NSString *) contents {
    return nil;
}





@end
