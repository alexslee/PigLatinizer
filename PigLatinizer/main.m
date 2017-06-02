//
//  main.m
//  PigLatinizer
//
//  Created by Alex Lee on 2017-06-02.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+PigLatin.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"Say something, I'll echo it back in Pig Latin: ");
        char str[255];
        fgets(str,255,stdin);
        
        NSString *toParse = [[NSString alloc] initWithUTF8String:str];
        toParse = [toParse lowercaseString];
        NSString *parsedForWhitespace = [toParse stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        
        NSArray *words = [parsedForWhitespace componentsSeparatedByString:@" "];
        //NSMutableArray *pigLatinizedWords = [[NSMutableArray alloc] init];
        
        NSMutableString *finalSentence = [[NSMutableString alloc] init];
        
        for (unsigned i = 0; i < [words count]; i++) {
            NSString *word = [words objectAtIndex:i];
            //[pigLatinizedWords addObject:[word stringByPigLatinization]];
            [finalSentence appendString:[word stringByPigLatinization]];
            if (i < [words count] - 1) {
                [finalSentence appendString:@" "];
            }
        }
        NSString *finalCapitalized = [finalSentence stringByReplacingCharactersInRange:NSMakeRange(0,1) withString:[[finalSentence substringToIndex:1] capitalizedString]];
        
        NSLog(@"%@",finalCapitalized);
        
//        for (NSString *pigLatinWord in pigLatinizedWords) {
//            NSLog(@"%@ ",pigLatinWord);
//        }
    }
    return 0;
}
