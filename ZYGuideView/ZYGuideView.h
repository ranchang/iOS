//
//  GuideView.h
//  GuideView
//
//  Created by yan zhang on 16/8/24.
//  Copyright © 2016年 yan zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYGuideView : UIView

@property (nonatomic, strong) NSArray *imageNames;
@property (nonatomic, strong) NSString *entryTitle;

typedef void(^EntryClickBlock)();
@property (nonatomic, copy) EntryClickBlock entryClick;

@end
