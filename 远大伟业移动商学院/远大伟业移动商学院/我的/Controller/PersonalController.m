//
//  PersonalController.m
//  远大伟业移动商学院
//
//  Created by YDWY on 16/9/6.
//  Copyright © 2016年 YDWY. All rights reserved.
//

#import "PersonalController.h"
#import "PersonalSettingController.h"
#import "LogInViewController.h"

@interface PersonalController ()
{
    NSMutableArray *dataArray; // data array
}
@end

@implementation PersonalController

static NSString *identifier=@"cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:identifier];
    self.tableView.tableFooterView=[[UIView alloc] init];
    
    // scroll enable,YES is Default
    self.tableView.scrollEnabled=NO;
    
    dataArray=[@[@"个人收藏",@"私人订制",@"系统消息",@"离线缓存",@"其它设置",@"注销"] mutableCopy];
    // setting headerView
    [self setupTableHeaderview];
}

// setting headerView
- (void)setupTableHeaderview{
    UIView *headView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 200)];
    self.tableView.tableHeaderView=headView;
    
    // setting headImage
    UIImageView *imgView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 200)];
    imgView.userInteractionEnabled=YES;
    imgView.backgroundColor=[UIColor purpleColor];
    [headView addSubview:imgView];
    
    // add tapGestureRecognizer
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [imgView addGestureRecognizer:tap];
}

// tap action
- (void)tap:(UITapGestureRecognizer *)tap{
    PersonalSettingController *personalSC=[PersonalSettingController new];
    [self.navigationController pushViewController:personalSC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (dataArray.count!=0) {
        return dataArray.count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    cell.textLabel.text=dataArray[indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==dataArray.count-1) {
        LogInViewController *logInVC=[LogInViewController new];
        [self presentViewController:logInVC animated:YES completion:nil];
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
