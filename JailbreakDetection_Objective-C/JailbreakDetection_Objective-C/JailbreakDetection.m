//
//  JailbreakDetection.m
//  JailbreakDetection_Objective-C
//
//  Created by KUSAMA YOSHIKI on 2019/03/08.
//  Copyright © 2019 yotti. All rights reserved.
//

#import "JailbreakDetection.h"

@implementation JailbreakDetection

+(BOOL)isJailbreak{
    JailbreakDetection *check = [[JailbreakDetection alloc] init];
    if ([check check_cydia]||[check check_file_path_access]){
        return true;
    }
    return false;
}

-(BOOL)check_cydia
{
    FILE *check_cydia = fopen("/Applications/Cydia.app","r");
    if(check_cydia){
        fclose(check_cydia);
        return true;
    }
    else{
        return false;
    }
}

-(BOOL)check_file_path_access{
    NSArray *file_path = [[NSArray alloc] initWithObjects:
                          @"/Library/MobileSubstrate/MobileSubstrate.dylib",
                          @"/bin/bash",
                          @"/etc/apt",
                          @"/usr/sbin/sshd",
                          @"private/var/lib/atp",
                          nil];
    
    NSString *file_path_string;
    for(int i=0; i<file_path.count; i++){
        file_path_string = [file_path objectAtIndex:i];
        
        if ([[NSFileManager defaultManager] fileExistsAtPath:file_path_string]){
            return true;
        }
    }
    return false;
}
@end
