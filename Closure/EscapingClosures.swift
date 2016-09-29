//: Playground - noun: a place where people can play

import UIKit

class EscapingClosureTestingClass {
    var x = 10

    var completionHandlers: [() -> Void] = []
    
    func storeEscapingClosureToAnArray(completionHandler: @escaping () -> Void) {
        completionHandlers.append(completionHandler)
    }
    
    func storeEscapingClosureToAPropertyOfAnotherObject(completionHandler: @escaping () -> Void) {
        let another = AnotherClass()
        another.closure = completionHandler
    }
    
    func storeEscapingClosureToAnotherVariable(completionHandler: @escaping () -> Void) {
        let justAnotherVariable = completionHandler
        justAnotherVariable()
    }
    
    func callAnotherFunctionWithEscapingClosureParameters(completionHandler handler: @escaping () -> Void) {
        functionWithEscapingClosureForSomeReason(completionHandler: handler)
    }
    
    private func functionWithEscapingClosureForSomeReason(completionHandler: @escaping () -> Void) {
        //NOTE: There is actually no escaping here, but you can still mark the closure @escaping, although this might break the purpose of using this attribute
        completionHandler()
    }
    
    func someFunctionWithNonescapingClosure(closure: () -> Void) {
        closure()
    }

    func do1stEscaping() {
        print("Store the closure in an array")
        storeEscapingClosureToAnArray {
            self.x = 100
        }
    }
    
    func do2ndEscaping() {
        print("Store the closure to the `closure` property of AnotherClass.")
        storeEscapingClosureToAPropertyOfAnotherObject {
            self.x = 200
        }
    }
    
    func do3rdEscaping() {
        print("Just store the closure to another vairable, and then call the new variable")
        storeEscapingClosureToAnotherVariable {
            self.x = 300
        }
    }
    
    func do4thEscaping() {
        print("Call another function with escaping closure parametesr")
        callAnotherFunctionWithEscapingClosureParameters {
            self.x = 400
        }
    }
    
    func doSomethingNonescaping() {
        print("Non-escaping, just call the closure")
        someFunctionWithNonescapingClosure {
            x = 99
        }
    }
}


class AnotherClass {
    var closure: (() -> Void)? {
        didSet {
            print("Closure Escaped to AnotherClass and called here.")
            closure?()
        }
    }
}


let instance = EscapingClosureTestingClass()
instance.do1stEscaping()
print(instance.x)
print("Call the closure stored in the array")
instance.completionHandlers.first?()
print(instance.x)
instance.doSomethingNonescaping()
print(instance.x)
instance.do2ndEscaping()
print(instance.x)
instance.do3rdEscaping()
print(instance.x)
instance.do4thEscaping()
print(instance.x)
