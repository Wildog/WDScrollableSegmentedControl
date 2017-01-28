//
//  WDViewController.m
//  WDScrollableSegmentedControl
//
//  Created by Wildog on 01/29/2017.
//  Copyright (c) 2017 Wildog. All rights reserved.
//

#import "WDViewController.h"
#import "WDScrollableSegmentedControl.h"
#import "YTPageController.h"

@interface WDViewController () <WDScrollableSegmentedControlDelegate, YTPageControllerDelegate>

@property (weak, nonatomic) IBOutlet WDScrollableSegmentedControl *scrollSegment;
@property (strong, nonatomic) YTPageController *pageController;
@property (strong, nonatomic) NSArray *buttons;

@end

@implementation WDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.buttons = @[@"Foo", @"Button 1", @"Button 2", @"Another Button", @"Bar", @"Button Again", @"Finally"];
    self.scrollSegment.buttons = self.buttons;
    self.scrollSegment.delegate = self;
    
    [self addViewControllers];
    self.pageController.delegate = self;
}

- (void)addViewControllers {
    NSMutableArray *viewControllers = [NSMutableArray array];
    for (NSString *button in self.buttons) {
        UIViewController *vc = [[UIViewController alloc] init];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 150, 300, 100)];
        label.textAlignment = NSTextAlignmentCenter;
        label.numberOfLines = 0;
        label.text = [button stringByAppendingString:@"\nView Controller"];
        [vc.view addSubview:label];
        [viewControllers addObject:vc];
    }
    self.pageController.viewControllers = viewControllers;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"page_controller_segue"]) {
        self.pageController = segue.destinationViewController;
    }
}

#pragma mark Scrollable Segmented Control Delegate

- (void)didSelectButtonAtIndex:(NSInteger)index {
    [self.pageController setCurrentIndex:index animated:YES];
}

#pragma mark Page Controller Delegate

- (void)pageController:(YTPageController *)pageController willStartTransition:(id<YTPageTransitionContext>)context {
    [pageController.pageCoordinator animateAlongsidePagingInView:self.scrollSegment animation:^(id<YTPageTransitionContext>  _Nonnull context) {
        // update segmented control
        self.scrollSegment.userInteractionEnabled = NO;
        self.scrollSegment.selectedIndex = [context toIndex];
    } completion:^(id<YTPageTransitionContext>  _Nonnull context) {
        if ([context isCanceled]) {
            // if transition canceled, restore to the previous state
            self.scrollSegment.selectedIndex = [context fromIndex];
        }
        self.scrollSegment.userInteractionEnabled = YES;
    }];
}

@end
