IODProfanityFilter
==================

IODProfanityFilter provides a basic profanity filter for iOS and Mac OS X apps. It has the following goals:

- Simplicity of use
- Performance
- Minimizing false positives

It is not intended to be the "be-all end-all" profanity filter; just something basic that doesn't have 
to worry about dealing with the [Scunthorpe Problem](http://en.wikipedia.org/wiki/Scunthorpe_problem).
I created this library because I needed a simple filter for an app that has user-generated content and is
used by a lot of kids. Nothing turned up for iOS, so here it is!

IODProfanityFilter only matches whole words and does not attempt to check for l33t-speak or anything like that.

The filter works on the user's locale and supports the following languages so far:
German, English, Spanish, French, Italian, Japanese, Dutch, Portuguese, Russian, and Chinese.

Installation:
-------------

The best way to include it in your project is with [CocoaPods](http://www.cocoapods.org). 
If you're not using CocoaPods, you should probably start using CocoaPods.

Usage:
------

To filter a string, use either the provided NSString category methods or the methods on IODProfanityFilter, 
whichever you prefer.

    NSString *filtered = [@"a great fucking example string" iod_filteredString]; // @"a great ∗∗∗∗∗∗∗ example string"

or

    NSString *filtered = [IODProfanityFilter stringByFilteringString:@"a great fucking example string"]; // @"a great ∗∗∗∗∗∗∗ example string"

You can have greater control over the output by using `stringByFilteringString:withReplacementString:` 
or by using `rangesOfFilteredWordsInString:`. The latter will give you the ranges so you can do whatever you want; 
perhaps give the user bonus points for using dirty words!

Acknowledgements:
----------------

The lovely word lists were initially created by 
[Shutterstock](https://github.com/shutterstock/List-of-Dirty-Naughty-Obscene-and-Otherwise-Bad-Words).
