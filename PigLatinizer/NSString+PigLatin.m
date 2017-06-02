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
    NSMutableString *converted = [[NSMutableString alloc] init];
    
    //setup a set of vowels for searching the word (no need for uppercase chars as input was formatted to lowercase)
    NSString *vowelsList = @"aeiouy";
    NSCharacterSet *vowelSet = [NSCharacterSet characterSetWithCharactersInString:vowelsList];
    
    NSNumber *foundHere = nil;
    
    //go through each char of the word until a vowel is found, meaning we have our chunk of consonants to extract
    for (unsigned i = 0; i < self.length; i++) {
        NSString *checkChar = [NSString stringWithFormat:@"%c", [self characterAtIndex:i]];
        //NSLog(@"Checking character: %@",checkChar);
        NSRange foundVowel = [checkChar rangeOfCharacterFromSet:vowelSet];
        
        //once the first vowel is found, record the index and break out of the search loop
        if (foundVowel.location != NSNotFound) {
            foundHere = [NSNumber numberWithUnsignedInteger:i];
            //NSLog(@"Found a vowel at %tu",[foundHere unsignedIntegerValue]);
            break;
        }
    }
    
    //start with this string
    [converted appendString: [self substringFromIndex:[foundHere unsignedIntegerValue]]];
    NSLog(@"ORIGINAL CHUNK:%@",converted);
    
    //concatenate the first chunk of the original string (the consonant chunk), followed by the trailing 'ay'
    [converted appendString: [self substringToIndex:[foundHere unsignedIntegerValue]]];
    [converted appendString:@"ay"];
    
    return converted;
}

@end
