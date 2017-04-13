//
//  XXTerminalViewController.h
//  XXTouchApp
//
//  Created by Zheng on 10/11/2016.
//  Copyright © 2016 Zheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XXBaseActivity.h"

@interface XXTerminalViewController : UIViewController
@property (nonatomic, copy) NSString *filePath;
@property (nonatomic, weak) XXBaseActivity *activity;

@property (nonatomic, assign) BOOL runImmediately;

@end
