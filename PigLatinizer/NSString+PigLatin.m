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
    
    NSMutableString *converted = [[NSMutableString alloc] init];
    
    NSString *temp = [self substringWithRange:range];
    
    NSString *vowelsList = @"aeiou";
    
    NSCharacterSet *vowelSet = [NSCharacterSet characterSetWithCharactersInString:vowelsList];
    
    for (unsigned i = 0; i < self.length; i++) {
        NSString *checkChar = [NSString stringWithFormat:@"%c", [self characterAtIndex:i]];
        NSLog(@"Checking character: %@",checkChar);
    }
    
    return temp;
}

@end
