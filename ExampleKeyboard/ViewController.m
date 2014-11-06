//
//  ViewController.m
//  ExampleKeyboard
//
//  Created by David Mazza on 11/6/14.
//  Copyright (c) 2014 David Mazza. All rights reserved.
//

#import "ViewController.h"
#import "FleksyEmojiViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  
  FleksyEmojiViewController *collectionViewController = [[FleksyEmojiViewController alloc] initWithFrame:CGRectMake(0, 0, 320, 150)];
  [self.view addSubview:collectionViewController.view];
  [self addChildViewController:collectionViewController];
  [collectionViewController didMoveToParentViewController:self];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
