//
//  XXItemAttributesTableViewController.h
//  XXTouchApp
//
//  Created by Zheng on 9/2/16.
//  Copyright © 2016 Zheng. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString * const kXXItemAttributesTableViewControllerStoryboardID = @"kXXItemAttributesTableViewControllerStoryboardID";

@interface XXItemAttributesTableViewController : UITableViewController
@property (nonatomic, strong) NSString *currentName;
@property (nonatomic, strong) NSString *currentPath;

@end
