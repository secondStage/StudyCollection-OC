//
//  TestModel.h
//  poker2
//
//  Created by 作田諒 on 2015/04/02.
//  Copyright (c) 2015年 myname. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestModel : NSObject

@property NSArray *imageArray;

+ (TestModel *)sharedManager;

@end
