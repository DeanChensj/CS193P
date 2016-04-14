//
//  TextStatusViewController.m
//  Attributor
//
//  Created by Dean Chen on 16/4/14.
//  Copyright © 2016年 Dean Chen. All rights reserved.
//

#import "TextStatusViewController.h"

@interface TextStatusViewController ()
@property (weak, nonatomic) IBOutlet UILabel *coloredLabel;
@property (weak, nonatomic) IBOutlet UILabel *outlinedLabel;

@end

@implementation TextStatusViewController

- (void) setTextToAnalyze:(NSAttributedString *)textToAnalyze
{
    _textToAnalyze = textToAnalyze;
    if(self.view.window)  [self updateUI];
}

- (void)updateUI
{
    self.coloredLabel.text = [NSString stringWithFormat:@"%ld coloered characters.", [[self charactersWithAttribute:NSForegroundColorAttributeName] length]];
    self.outlinedLabel.text = [NSString stringWithFormat:@"%ld outlined characters.", [[self charactersWithAttribute:NSStrokeWidthAttributeName] length]];
}

- (NSAttributedString *)charactersWithAttribute:(NSString *)attributeName
{
    NSMutableAttributedString *characters = [[NSMutableAttributedString alloc] init];
    unsigned long index = 0;
    while (index < [self.textToAnalyze length]) {
        NSRange range;
        id value = [self.textToAnalyze attribute:attributeName atIndex:index effectiveRange:&range];
        if (value) {
            [characters appendAttributedString:[self.textToAnalyze attributedSubstringFromRange:range]];
            index = range.location + range.length;
        } else index++;
    }
    return characters;
}

- (void)viewWillAppear:(BOOL) animated
{
    [super viewWillAppear:animated];
    [self updateUI];
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
