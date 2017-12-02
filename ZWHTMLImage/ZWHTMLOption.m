//
//  ZWHTMLOption.m
//  ZWHTMLImageDemo
//
//  Created by kt on 2017/6/9.
//  Copyright © 2017年 keenteam. All rights reserved.
//

#import "ZWHTMLOption.h"

@implementation ZWHTMLOption
-(instancetype)init{
    self = [super init];
    if (self) {
        self.getAllImageCoreJS  = OPTION_DefaultCoreJS;
        self.splitURL           = OPTION_SplitURL;
        self.splitIndex         = OPTION_SplitIndex;
        self.hrefPrefix         = OPTION_HrefPrefix;
        self.zwPreviewJS        = @"";
        self.filterURL          = @[];
    }
    return self;
}
@end
