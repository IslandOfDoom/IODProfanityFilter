//
//  IODProfanityFilter.h
//  IODProfanityFilter
//
//  Created by John Arnold on 2013-02-27.
//  Copyright (c) 2013 Island of Doom Software Inc. All rights reserved.
//

@interface IODProfanityFilter : NSObject

/**
 The word set is initialized from the IODProfanityWords.txt in the app bundle, using the current locale.
 It is exposed as a mutable set so you can easily add/remove words at runtime if needed.
 Note that changes to the word set are not persisted by this class between app launches.
 */
+ (NSMutableSet*)wordSet;

/**
 Returns an array of NSValue(NSRange) indicating where offending words were found in the string.
 If there are no offending words, returns an empty array.
 */
+ (NSArray*)rangesOfFilteredWordsInString:(NSString*)string;

/**
 Returns a string with offending words replaced by "∗"
 */
+ (NSString*)stringByFilteringString:(NSString*)string;

/**
 Returns a string with offending words replaced by the string you pass in (repeated to fit)
 */
+ (NSString*)stringByFilteringString:(NSString*)string withReplacementString:(NSString*)replacementString;

@end
