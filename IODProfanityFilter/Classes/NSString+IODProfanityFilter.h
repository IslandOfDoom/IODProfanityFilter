//
//  NSString+IODProfanityFilter.h
//  IODProfanityFilter
//
//  Created by John Arnold on 2013-01-27.
//  Copyright (c) 2013 Island of Doom Software Inc. All rights reserved.
//

@interface NSString (IODProfanityFilter)

/**
 Returns an array of NSValue(NSRange) indicating where offending words were found in the string.
 If there are no offending words, returns an empty array.
 */
- (NSArray*)iod_rangesOfFilteredWords;

/**
 Returns a string with offending words replaced by "∗"
 */
- (NSString*)iod_filteredString;

/**
 Returns a string with offending words replaced by the string you pass in (repeated to fit)
 */
- (NSString*)iod_filteredStringWithReplacementString:(NSString*)replacementString;

@end
