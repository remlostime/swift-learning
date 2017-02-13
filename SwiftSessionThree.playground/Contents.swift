//: Playground - noun: a place where people can play

import UIKit


/**********
 FUNCTIONS
 ************/

// Simple function with param
func greet(person: String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
}

// Simple function without params
func sayHelloWorld() -> String {
    return "hello, world"
}

// Simple function without return value
func greet(person: String) {
    print("Hello, \(person)!")
}

// Multiple return values
func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

// Same but with tuple being optional
func minMax(array: [Int]) -> (min: Int, max: Int)? {
    
    ////////////////////
    if array.isEmpty { return nil }
    //////////////////////
    
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

// Argument Labels
func greet(person: String, from hometown: String) -> String {
    return "Hello \(person)!  Glad you could visit from \(hometown)."
}
print(greet(person: "Bill", from: "Cupertino"))

// Omitting argument labels
func someFunction(_ firstParameterName: Int, secondParameterName: Int) {
    // In the function body, firstParameterName and secondParameterName
    // refer to the argument values for the first and second parameters.
}
someFunction(1, secondParameterName: 2)

// Default Parameter values
func someFunction(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) {
    // If you omit the second argument when calling this function, then
    // the value of parameterWithDefault is 12 inside the function body.
}
someFunction(parameterWithoutDefault: 3, parameterWithDefault: 6) //
someFunction(parameterWithoutDefault: 3) // parameterWithDefault will be 12 here

// Variadic parameters
func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(1, 2, 3, 4, 5)

// In-Out params

// inout keyword allow us to udpate value of parameters
// Otherwise, they are constants by default.
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")


// Function types
func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}
func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}

// addTwoInts, multiplyTwoInts, has same signature except function name.
var mathFunction: (Int, Int) -> Int = addTwoInts
// Usage example :
print("Result: \(mathFunction(2, 3))")

// You can pass function type to another function as parameter.
func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}
printMathResult(addTwoInts, 3, 5)

// Could also use function type for Return Type in function 

/*
 func stepForward(_ input: Int) -> Int {
    return input + 1
}
func stepBackward(_ input: Int) -> Int {
    return input - 1
}
func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    return backward ? stepBackward : stepForward
}
 */

// Nested functions
// Could be considered for very small functions like example below.
// Abusing with big functions, it's a bit abused, less readable.
func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backward ? stepBackward : stepForward
}

var currentValue = -4
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
// moveNearerToZero now refers to the nested stepForward() function
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")

/**********
 CLOSURES : Blocks equivalent of Obj-C
 ************/
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}
var reversedNames = names.sorted(by: backward)

reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})

// Inferring Type From Context
// Array sort method :
// public func sorted(by areInIncreasingOrder: (Element, Element) -> Bool) -> [Element]
reversedNames = names.sorted(by: { s1, s2 in
    return s1 > s2
})

// Single expresion:
reversedNames = names.sorted(by: { s1, s2 in s1 > s2 } )

// BELOW DOESN'T COMBINED, because it's multiple line
//reversedNames = names.sorted(by: { s1, s2 in
//    let s1count = s1.characters.count
//    let s2count = s2.characters.count
//    s1count > s2count
//})

// Shorthand argument names:
// This just allow to not add parameters in the closure signature
reversedNames = names.sorted(by: { $0 > $1 } )

// Operator methods
reversedNames = names.sorted(by: >)

// Trailing closures
func someFunctionThatTakesAClosure(closure: () -> Void) {
    // function body goes here
}

someFunctionThatTakesAClosure(closure: {
    // Closure's body
})

someFunctionThatTakesAClosure() {
    // Closure's body
}

// Even paranthesis are optional
reversedNames = names.sorted {
    $0 > $1
}

// Capturing Values
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    print("We got into makeIncrementer method")
    var runningTotal = 0
    func incrementer() -> Int {
        print("Running total before increment = \(runningTotal)")
        // Running total and amount are accessible
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}
let incrementByTen = makeIncrementer(forIncrement: 10)
incrementByTen()
incrementByTen()
incrementByTen()
incrementByTen()

let incrementBySeven = makeIncrementer(forIncrement: 7)
incrementBySeven()








