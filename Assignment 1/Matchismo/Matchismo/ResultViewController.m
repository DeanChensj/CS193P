//
//  ResultViewController.m
//  Matchismo
//
//  Created by Dean Chen on 16/4/18.
//  Copyright © 2016年 Dean Chen. All rights reserved.
//

#import "ResultViewController.h"

@interface ResultViewController ()
@property (weak, nonatomic) IBOutlet UITextView *gameResult;

@end

@implementation ResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTextViewWithString];
}

- (void)setTextViewWithString
{
    self.gameResult.attributedText = _resultString;
    
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
