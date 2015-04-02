//
//  DetailViewController.m
//  poker2
//
//  Created by 作田諒 on 2015/02/05.
//  Copyright (c) 2015年 myname. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()


@property (weak, nonatomic) IBOutlet UIImageView *ImageView;
@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.ImageView setImage:_image];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
