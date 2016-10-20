//
//  XXPickerBaseViewController.m
//  XXTouchApp
//
//  Created by Zheng on 17/10/2016.
//  Copyright © 2016 Zheng. All rights reserved.
//

#import "XXCodeBlockNavigationController.h"
#import "XXPickerBaseViewController.h"
#import "XXCodeMakerService.h"

@interface XXPickerBaseViewController ()

@end

@implementation XXPickerBaseViewController

#pragma mark - View Events

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = NSLocalizedString(@"", nil);
    
    if (_codeBlock) {
        self.codeBlock.currentStep++;
        self.navigationItem.rightBarButtonItem = self.nextButton;
    }
}

#pragma mark - Next Step

- (void)next:(UIBarButtonItem *)sender {
    [self pushToNextControllerWithKeyword:self.keyword replacement:@""];
}

- (void)pushToNextControllerWithKeyword:(NSString *)keyword
                            replacement:(NSString *)replace {
    XXCodeBlockModel *newBlock = [_codeBlock mutableCopy];
    NSString *code = newBlock.code;
    NSRange range = [code rangeOfString:keyword];
    if (range.length == 0) return;
    newBlock.code = [code stringByReplacingCharactersInRange:range withString:replace];
    [XXCodeMakerService pushToMakerWithCodeBlockModel:newBlock controller:self];
}

- (UIBarButtonItem *)nextButton {
    if (!_nextButton) {
        UIBarButtonItem *nextButton = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Skip", nil)
                                                                       style:UIBarButtonItemStylePlain
                                                                      target:self
                                                                      action:@selector(next:)];
        nextButton.tintColor = [UIColor whiteColor];
        _nextButton = nextButton;
    }
    return _nextButton;
}

#pragma mark - Strings

- (void)setHeadtitle:(NSString *)headtitle {
    _headtitle = headtitle;
    ((XXCodeBlockNavigationController *)self.navigationController).popupBar.title = headtitle;
}

- (void)setSubtitle:(NSString *)subtitle {
    _subtitle = subtitle;
    ((XXCodeBlockNavigationController *)self.navigationController).popupBar.subtitle = subtitle;
}

@end