//
//  ViewController.m
//  BIDimmerViewController
//
//  Created by 郑林琴 on 15/11/16.
//  Copyright © 2015年 Ice Butterfly. All rights reserved.
//

#import "ViewController.h"
#import "BIActivityViewController.h"
#import "BIAlertViewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *dataSources;

@end

@implementation ViewController

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = self.dataSources[indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSources.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
            [self showAlertViewController];
            break;
        case 1:
            [self showGridActivityController];
            break;
        default:
            break;
    }
}

- (void)showAlertViewController{
    BIAlertViewController *alertt = [BIAlertViewController new];
    
    BIAlertAction *action1 = [BIAlertAction actionWithTitle:@"action1" action:^{

    }];
    
    BIAlertAction *action2 = [BIAlertAction actionWithTitle:@"action2" action:^{
        
    }];
    
    BIAlertAction *action3 = [BIAlertAction actionWithTitle:@"action3" action:^{
        
    }];
    
    [alertt addAction:action1];
    [alertt addAction:action2];
    [alertt addAction:action3];

    [self presentViewController:alertt animated:YES completion:nil];

}

- (void)showGridActivityController{
    BIActivityViewController *activity = [BIActivityViewController new];
    
    BIActivityAction *share = [BIActivityAction actionViewActivityTitle:@"微信" image:[UIImage imageNamed:@"icon64_wx_logo"] action:^{
        NSLog(@"微信分享");
    }];
    
    BIActivityAction *wxCollect = [BIActivityAction actionViewActivityTitle:@"收藏" image:[UIImage imageNamed:@"icon_res_download_collect"] action:^{
        NSLog(@"收藏");
    }];
    
    BIActivityAction *sharetimeline = [BIActivityAction actionViewActivityTitle:@"朋友圈" image:[UIImage imageNamed:@"icon_res_download_moments"] action:^{
        NSLog(@"风向朋友圈");
    }];
    
    [activity addAction:share];
    [activity addAction:sharetimeline];
    [activity addAction:wxCollect];
    
    [activity addAction:share];
    [activity addAction:sharetimeline];
    [activity addAction:wxCollect];
    
    [activity addAction:share];
    [activity addAction:sharetimeline];
    [activity addAction:wxCollect];
    
    [activity addAction:share];
    [activity addAction:sharetimeline];
    [activity addAction:wxCollect];
    
    [self presentViewController:activity animated:YES completion:nil];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSources = @[@"alert view controller",@"grid activity view controller"];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
