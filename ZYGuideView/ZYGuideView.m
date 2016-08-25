//
//  GuideView.m
//  GuideView
//
//  Created by yan zhang on 16/8/24.
//  Copyright © 2016年 yan zhang. All rights reserved.
//

#import "ZYGuideView.h"

#define PageControlWidth  250
#define PageControlHeight 44
#define EntryButtonWidth  260
#define EntryButtonHeight 30

#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define ScreenWidth [UIScreen mainScreen].bounds.size.width

@interface ZYGuideView ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) UIButton *entryButton;

@end

@implementation ZYGuideView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        _scrollView.scrollEnabled = YES;
        _scrollView.pagingEnabled = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.delegate = self;
        _scrollView.bounces = NO;
        [self addSubview:_scrollView];
        
        _pageControl = [[UIPageControl alloc] init];
        _pageControl.userInteractionEnabled = NO;
        _pageControl.frame = CGRectMake((ScreenWidth-PageControlWidth)/2, ScreenHeight-PageControlHeight, PageControlWidth, PageControlHeight);
        [self insertSubview:_pageControl aboveSubview:_scrollView];
        
        _entryButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_entryButton setBackgroundColor:[UIColor clearColor]];
        [_entryButton addTarget:self action:@selector(clickEntryAction) forControlEvents:UIControlEventTouchUpInside];
        _entryButton.frame = CGRectMake((ScreenWidth-EntryButtonWidth)/2, ScreenHeight-EntryButtonHeight*2, EntryButtonWidth, EntryButtonHeight);
        [_entryButton setTitle:@"立即体验" forState:UIControlStateNormal];
        _entryButton.hidden = YES;
        [self insertSubview:_entryButton aboveSubview:_scrollView];
    }
    return self;
}

- (void)setImageNames:(NSArray *)imageNames
{
    _imageNames = imageNames;
    
    _scrollView.contentSize = CGSizeMake(ScreenWidth*_imageNames.count, ScreenHeight);
    for (NSInteger i=0; i<_imageNames.count; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i*ScreenWidth, 0, ScreenWidth, ScreenHeight)];
        [imageView setImage:[UIImage imageNamed:_imageNames[i]]];
        [_scrollView addSubview:imageView];
    }
    
    _pageControl.numberOfPages = _imageNames.count;
    _pageControl.currentPage = 0;
}

- (void)setEntryTitle:(NSString *)entryTitle
{
    if (entryTitle) {
        [_entryButton setTitle:entryTitle forState:UIControlStateNormal];
    }
}

#pragma mark - UIScrollViewDelegate method
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGPoint contentPoint = scrollView.contentOffset;
    CGFloat xPoint = contentPoint.x;
    NSInteger currentPage = xPoint/ScreenWidth;
    _pageControl.currentPage = currentPage;
    if (currentPage == _imageNames.count-1) {
        _entryButton.hidden = NO;
        _pageControl.hidden = YES;
    } else {
        _entryButton.hidden = YES;
        _pageControl.hidden = NO;
    }
}

- (void)clickEntryAction
{
    if (self.entryClick) {
        self.entryClick();
    }
}
@end
