//
//  NSString+PigLatin.m
//  PigLatinizer
//
//  Created by Alex Lee on 2017-06-02.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

#import "NSString+PigLatin.h"

@implementation NSString (PigLatin)

- (NSString *)stringByPigLatinization;
{
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    NSString *temp = [self substringWithRange:range];
    
    return temp;
}

@end
