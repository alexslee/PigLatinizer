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
        NSString *parsedForWhitespace = [toParse stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        
        NSArray *words = [parsedForWhitespace componentsSeparatedByString:@" "];
        NSMutableArray *pigLatinizedWords = [[NSMutableArray alloc] init];
        
        for (NSString *word in words) {
            [pigLatinizedWords addObject:[word stringByPigLatinization]];
        }
        
        for (NSString *pigLatinWord in pigLatinizedWords) {
            NSLog(@"%@ ",pigLatinWord);
        }
    }
    return 0;
}
