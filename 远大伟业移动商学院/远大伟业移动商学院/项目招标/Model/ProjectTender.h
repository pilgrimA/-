//
//  ProjectTender.h
//  远大伟业移动商学院
//
//  Created by YDWY on 16/9/19.
//  Copyright © 2016年 YDWY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProjectTender : NSObject

@property (nonatomic,assign) NSInteger id;
@property (nonatomic,strong) NSString *project_name; // project name
@property (nonatomic,strong) NSString *price; // project price
@property (nonatomic,strong) NSString *project_intro; // project introduce
@property (nonatomic,strong) NSString *start_time; // start time
@property (nonatomic,strong) NSString *end_time; // end time
@property (nonatomic,strong) NSString *my_company; // head of company
@property (nonatomic,strong) NSString *charge_company; // receive company
@property (nonatomic,strong) NSString *addr; // address
@property (nonatomic,strong) NSString *phone; // phone

@end
