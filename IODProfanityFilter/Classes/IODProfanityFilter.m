//
//  IODProfanityFilter.m
//  IODProfanityFilter
//
//  Created by John Arnold on 2013-02-27.
//  Copyright (c) 2013 Island of Doom Software Inc. All rights reserved.
//

#import "IODProfanityFilter.h"

@implementation IODProfanityFilter

static NSMutableSet *IODProfanityFilterWordSet;

+ (NSMutableSet*)wordSet
{
    // Load up our word list and keep it around
    if (!IODProfanityFilterWordSet)
    {
        NSStringEncoding encoding;
        NSError *error;
        NSString *fileName = [[NSBundle mainBundle] pathForResource:@"IODProfanityWords" ofType:@"txt"];
        NSString *wordStr = [NSString stringWithContentsOfFile:fileName usedEncoding:&encoding error:&error];
        NSArray *wordArray = [wordStr componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
        IODProfanityFilterWordSet = [NSMutableSet setWithArray:wordArray];
    }
    
    return IODProfanityFilterWordSet;
}

+ (NSArray*)rangesOfFilteredWordsInString:(NSString*)string
{
    NSMutableArray *result = [NSMutableArray array];
    
    NSSet *wordSet = [self wordSet];
    
    NSScanner *scanner = [NSScanner scannerWithString:string];
    scanner.charactersToBeSkipped = nil;
    
    NSCharacterSet *wordCharacters = [NSCharacterSet alphanumericCharacterSet];
    NSCharacterSet *nonWordCharacters = [wordCharacters invertedSet];
    
    while (![scanner isAtEnd])
    {
        // Look for words
        NSString *scanned;
        if ([scanner scanCharactersFromSet:wordCharacters intoString:&scanned]) {
            
            // Found a word, look it up in the word set
            if ([wordSet containsObject:[scanned lowercaseString]])
            {
                // The scan location is now at the end of the word
                NSRange range = NSMakeRange(scanner.scanLocation - scanned.length, scanned.length);
                [result addObject:[NSValue valueWithRange:range]];
            }
        }
        else
        {
            // Skip over non-word characters
            [scanner scanCharactersFromSet:nonWordCharacters intoString:&scanned];
        }
    }
    
    return result;
}

+ (NSString *)stringByFilteringString:(NSString *)string
{
    return [self stringByFilteringString:string withReplacementString:@"∗"];
}

+ (NSString*)stringByFilteringString:(NSString *)string withReplacementString:(NSString *)replacementString
{
    NSMutableString *result = [string mutableCopy];
    
    NSArray *rangesToFilter = [self rangesOfFilteredWordsInString:string];
    for (NSValue *rangeValue in rangesToFilter) {
        NSRange range = [rangeValue rangeValue];
        NSString *replacement = [@"" stringByPaddingToLength:range.length withString:replacementString startingAtIndex:0];
        [result replaceCharactersInRange:range withString:replacement];
    }
    
    return result;
}

@end
