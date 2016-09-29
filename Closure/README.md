# Closures

### Escaping Closures

From Apple's [Swift 3 programming guide](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Closures.html#//apple_ref/doc/uid/TP40014097-CH11-ID546) it says "A closure is said to escape a function when the closure is passed as an argument to the function, but is called after the function returns".

In other words, in my opinion, the following two cases will get a compile error

1. Pass the closure to another function which has the parameter marked as `@escaping`.
2. Store the closure to another object, eg: another variable, a property of another object, in an array etc...

Before Swift 3, the closure parameters of a function is set to `@escaping` by default, not anymore in Swift 3. You have to add the attribute `@escaping` to all escaping closure parameters.

#### Examples:

* Store the closure in an array.
```
func storeEscapingClosureToAnArray(completionHandler: @escaping () -> Void) {
	var completionHandlers: [() -> Void] = []
    completionHandlers.append(completionHandler)
}
```

* Store the closure to a property of another project
```
func storeEscapingClosureToAPropertyOfAnotherObject(completionHandler: @escaping () -> Void) {
    let another = AnotherClass()
    another.closure = completionHandler
}
```

* Store the closure to anothe variable
```
func storeEscapingClosureToAnotherVariable(completionHandler: @escaping () -> Void) {
    let justAnotherVariable = completionHandler
    justAnotherVariable()
}
```

* Pass the closure and call another function whose parameter is `@escaping`. 
```
func callAnotherFunctionWithEscapingClosureParameters(completionHandler handler: @escaping () -> Void) {
    functionWithEscapingClosureForSomeReason(completionHandler: handler)
}
private func functionWithEscapingClosureForSomeReason(completionHandler: @escaping () -> Void) {
    completionHandler()
}
```

*Note that there is actually no escaping in the private function above, but you can still mark the closure @escaping, although this might break the purpose of using this attribute.*

Full example code is [here](EscapingClosures.swift), expected output of the example code:
```
Store the closure in an array
10
Call the closure stored in the array
100
Non-escaping, just call the closure
99
Store the closure to the `closure` property of AnotherClass.
Closure Escaped to AnotherClass and called here.
200
Just store the closure to another vairable, and then call the new variable
300
Call another function with escaping closure parametesr
400
```
