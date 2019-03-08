//
//  isJB.m
//  JailbreakDetection_Objective-C
//
//  Created by KUSAMA YOSHIKI on 2019/03/08.
//  Copyright © 2019 yotti. All rights reserved.
//

#import "isJB.h"

@implementation isJB
+(BOOL)isJailbreak
{
    FILE *file = fopen("/Applications/Cydia.app","r");
    if(file){
        fclose(file);
        return true;
    }else{
        return false;
    }
}
@end
