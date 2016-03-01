//
//  ViewController.m
//  UIScrollView-App引导页
//
//  Created by 蒋永忠 on 16/3/1.
//  Copyright © 2016年 jiangadam. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation ViewController

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 按钮默认隐藏
    self.button.alpha = 0;
    self.button.layer.cornerRadius = 5;
    self.button.layer.masksToBounds = YES;
    self.button.userInteractionEnabled = NO;
    
    //
    int count = 4;
    for (int i = 0; i < count; i ++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        [self.scrollView addSubview:imageView];
        
        // 设置图片以及frame
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d", i + 1]];
        
        CGFloat x = self.scrollView.frame.size.width * i;
        imageView.frame = CGRectMake(x, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height);
    }
    
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * count, 0);
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.bounces = NO;
    
    // 设置分页控件
    self.pageControl.numberOfPages = 4;
    
    // 设置代理
    self.scrollView.delegate = self;
    
}

#pragma mark 重写uiscrollView的代理方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int page = scrollView.contentOffset.x / scrollView.frame.size.width;
    self.pageControl.currentPage = page;
    
    if (page == 3) {
        self.button.userInteractionEnabled = YES;
        
        [UIView animateWithDuration:0.4 animations:^{
            self.button.alpha = 1;
        }];
        
    }else{
        [UIView animateWithDuration:0.2 animations:^{
            self.button.alpha = 0;
        }];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
