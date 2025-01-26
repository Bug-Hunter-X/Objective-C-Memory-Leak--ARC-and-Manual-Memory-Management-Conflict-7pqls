The solution involves ensuring that objects created without ARC management are explicitly released using `release` before the object's lifetime ends. This can be achieved by using `autorelease` when the object will be released in the current autorelease pool, or by explicitly releasing the object once done. However, in modern Objective-C development with ARC, this scenario should be avoided by using `strong` and `weak` properties and avoiding direct alloc/init whenever possible. 

```objectivec
@interface MyClass : NSObject
@property (strong, nonatomic) NSString *myString;
@end

@implementation MyClass
- (void)someMethod {
    NSString *tempString = [[NSString alloc] initWithString:@"Hello"];
    self.myString = tempString;
    [tempString release]; // Corrected: Explicitly release tempString
}
@end
```

**Better Approach (Recommended):**

Avoid manual memory management altogether.  In most cases, ARC handles memory management efficiently.  If you need temporary strings, use string literals or create them without `alloc` and `init`:

```objectivec
- (void)someMethod {
    NSString *tempString = @"Hello"; // No manual management needed
    self.myString = tempString; // ARC handles the memory management
}
```