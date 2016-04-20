//
//  PlayingCardView.h
//  SuperCard
//
//  Created by Dean Chen on 16/4/15.
//  Copyright © 2016年 Dean Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayingCardView : UIView

@property (nonatomic) NSUInteger rank;
@property (nonatomic, strong) NSString *suit;
@property (nonatomic) BOOL faceUp;

- (void)pinch:(UIPinchGestureRecognizer *)gesture;

@end
