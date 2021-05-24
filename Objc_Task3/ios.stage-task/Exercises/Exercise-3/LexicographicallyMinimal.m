#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {
    NSMutableString *mutable = [NSMutableString string];
       unichar currentCharString1;
       unichar currentCharString2;
       NSString *currentChar;
       NSRange substringRange = NSMakeRange(0, 1);
       
       while (string1.length || string2.length)
       {
           currentCharString1 = string1.length ? [string1 characterAtIndex:0] : -1;
           currentCharString2 = string2.length ? [string2 characterAtIndex:0] : -1;
           currentChar = currentCharString1 < currentCharString2 ? [string1 substringWithRange:substringRange] : [string2 substringWithRange:substringRange];
           
           if ([string1 hasPrefix:currentChar])
           {
               string1 = [string1 substringFromIndex:1];
           } else
           {
               string2 = [string2 substringFromIndex:1];
           }
           
           [mutable appendString:currentChar];
       }
       
       return mutable;

    
}

@end
