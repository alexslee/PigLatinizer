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
    
    NSString *vowelsList = @"aeiouy";
    
    NSCharacterSet *vowelSet = [NSCharacterSet characterSetWithCharactersInString:vowelsList];
    NSNumber *foundHere = nil;
    
    for (unsigned i = 0; i < self.length; i++) {
        NSString *checkChar = [NSString stringWithFormat:@"%c", [self characterAtIndex:i]];
        NSLog(@"Checking character: %@",checkChar);
        NSRange foundVowel = [checkChar rangeOfCharacterFromSet:vowelSet];
        
        if (foundVowel.location != NSNotFound) {
            foundHere = [NSNumber numberWithUnsignedInteger:i];
            NSLog(@"Found a vowel at %tu",[foundHere unsignedIntegerValue]);
            break;
        }
    }
    
    
    //get the range of the rest of the word (from the first vowel to the end)
//    NSRange restOfWord;
//    restOfWord.location = foundVowel.location;
//    restOfWord.length = self.length - 1;
    
    //start with this string
    [converted appendString: [self substringFromIndex:[foundHere unsignedIntegerValue]]];
    NSLog(@"ORIGINAL CHUNK:%@",converted);
    //concatenate the first chunk of the original string (the consonant chunk)
//    NSRange toMove;
//    toMove.location = 0;
//    toMove.length = foundVowel.location - 1;
    
    [converted appendString: [self substringToIndex:[foundHere unsignedIntegerValue]]];
    
    [converted appendString:@"ay"];
    return converted;
}

@end
