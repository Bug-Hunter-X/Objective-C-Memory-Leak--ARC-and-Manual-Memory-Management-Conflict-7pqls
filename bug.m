In Objective-C, a common yet subtle error arises when dealing with memory management, specifically with the interaction between ARC (Automatic Reference Counting) and manual memory management using retain/release.  Consider the following scenario:

```objectivec
@interface MyClass : NSObject
@property (strong, nonatomic) NSString *myString;
@end

@implementation MyClass
- (void)someMethod {
    NSString *tempString = [[NSString alloc] initWithString:@"Hello"];
    self.myString = tempString;
    // Forgot to release tempString!  ARC will handle self.myString, but tempString is leaked.
}
@end
```

While ARC handles `self.myString`, the `tempString` created with `alloc` and `init` isn't assigned to a property, thus ARC won't manage its release. This leads to a memory leak.  A more sophisticated example might involve creating temporary objects within blocks and forgetting that blocks retain their local variables. The leak may not be apparent immediately, manifesting only under heavy load or with time.