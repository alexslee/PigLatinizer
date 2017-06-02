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
    //variable setup
    NSMutableString *punctuation = [NSMutableString stringWithString:@""];
    NSMutableString *converted = [[NSMutableString alloc] init];
    NSMutableString *copy = [NSMutableString stringWithString:self];
    
    //setup a set of vowels for searching the word (no need for uppercase chars as input was formatted to lowercase)
    NSString *vowelsList = @"aeiouy";
    NSCharacterSet *vowelSet = [NSCharacterSet characterSetWithCharactersInString:vowelsList];
    
    //make a set of punctuation marks and then extract if there are any at the end of the word
    NSString *punctuationList = @",.?!;";
    NSCharacterSet *punctuationSet = [NSCharacterSet characterSetWithCharactersInString:punctuationList];
    NSRange ranger = [self rangeOfCharacterFromSet:punctuationSet options:NSBackwardsSearch range:NSMakeRange(self.length-1,1)];
    //if found, add to the punctuation string and remove from the word to be converted
    if (ranger.location != NSNotFound) {
        //NSLog(@"Found a mark for this word %@",self);
        [punctuation appendString:[copy substringWithRange:NSMakeRange(self.length-1,1)]];
        //NSLog(@"Extracted a %@",punctuation);
        copy = [NSMutableString stringWithString:[self substringWithRange:NSMakeRange(0,self.length-1)]];
    }
    
    NSNumber *foundHere = nil;
    //go through each char of the word until a vowel is found, meaning we have our chunk of consonants to extract
    for (unsigned i = 0; i < copy.length; i++) {
        NSString *checkChar = [NSString stringWithFormat:@"%c", [copy characterAtIndex:i]];
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
    [converted appendString: [copy substringFromIndex:[foundHere unsignedIntegerValue]]];
    //NSLog(@"ORIGINAL CHUNK:%@",converted);
    
    //concatenate the first chunk of the original string (the consonant chunk), followed by the trailing 'ay'
    [converted appendString: [copy substringToIndex:[foundHere unsignedIntegerValue]]];
    [converted appendString:@"ay"];
    //reappend punctuation (will add "" if nothing was there originally)
    [converted appendString:punctuation];
    
    return converted;
}

@end
