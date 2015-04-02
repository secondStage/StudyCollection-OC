//
//  TestModel.m
//  poker2
//
//  Created by 作田諒 on 2015/04/02.
//  Copyright (c) 2015年 myname. All rights reserved.
//

#import "TestModel.h"

@implementation TestModel

static TestModel *sharedData_ = nil;

+ (TestModel *)sharedManager{
    if (!sharedData_) {
        sharedData_ = [TestModel new];
        
        
        
    }
    return sharedData_;
    
}

- (id)init
{
    self = [super init];
    if (self) {
        //Initialization
        
        [self setImage];
        
    }
    return self;
}


- (void) setImage{
    
    _imageArray = @[@"movie1.jpg"];
}

@end
