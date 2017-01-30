//: Playground - noun: a place where people can play

import UIKit

/************************
 Assignment Operators
 ************************/

// Simple assignment
let b = 10
var a = 3
a = b
print("\(a)")
// Final Value of A = 10

// Assignment with multiple variable from a Tuple
let (x, y) = (1, 2)
print("x = \(x), y = \(y)")


/************************
 Arithmetic Operators
 ************************/

1 + 2       // equals 3
5 - 3       // equals 2
2 * 3       // equals 6
10.0 / 2.5  // equals 4.0

// Using variable from Assignment Section
var sumTotal = a + b

// String Concatenation
var stringSumtotal = "The total sum is " + "10"

// Remainder Operator
9 % 4
// In 9 :
// [1-2-3-4][5-6-7-8][9]
// We can fit 2 4s in 9, so the result is 1

10 % 2
// In 10:
// [1-2][3-4][5-6][7-8][9-10]
// We can fit 5 2s in 10, so the result is 0. There is nothing left

// Unary Minus Operator 
let three = 3
let minusThree = -three       // minusThree equals -3
let plusThree = -minusThree   // plusThree equals 3, or "minus minus three"
print("\(three), \(minusThree), \(plusThree)")

// Unary Plus Operator
let minusSix = -6
let alsoMinusSix = +minusSix  // alsoMinusSix equals -6
print("\(minusSix), \(alsoMinusSix)")

/************************
 Compound Operators
 ************************/
var c = 1
c += 2

/************************
 Comparaison Operators
 ************************/
1 == 1   // true because 1 is equal to 1
2 != 1   // true because 2 is not equal to 1
2 > 1    // true because 2 is greater than 1
1 < 2    // true because 1 is less than 2
1 >= 1   // true because 1 is greater than or equal to 1
2 <= 1   // false because 2 is not less than or equal to 1

let name = "world"
if name == "world" {
    // Prints "hello, world", because name is indeed equal to "world".
    print("hello, world")
} else {
    print("I'm sorry \(name), but I don't recognize you")
}

// Tuples comparaison
(1, "zebra") < (2, "apple")   // true because 1 is less than 2; "zebra" and "apple" are not compared
(3, "apple") < (3, "bird")    // true because 3 is equal to 3, and "apple" is less than "bird"
// 3 == 3, so the comparaison move the next elements "apple" < "bird"
(3, "e") < (3, "d")    // true because 3 is equal to 3, and "apple" is less than "bird"
(4, "dog") == (4, "dog")      // true because 4 is equal to 4, and "dog" is equal to "dog"

// Tuples comparaison Limited to 6 elements!
// This works :
(1, 2, 3, 4, 5, 5) < (1, 2, 3, 4, 5, 6)

// This doesn't build because there are 7 elements
//(1, 2, 3, 4, 5, 6, 7) < (1, 2, 3, 4, 5, 6, 8)

let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)

var destination: String?
destination = "Paris"
(destination != nil) ? destination! : "Current Location"
destination ?? "Current Location"


/************************
 Range Operators
 ************************/
// Closed Range Operator : ...
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}

for index in (1...5).reversed() {
    print("\(index) times 5 is \(index * 5)")
}


// Half-Open Range Operator
let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("Person \(i + 1) is called \(names[i])")
}

/************************
 Logical Operators
 ************************/
let hasDoorKey = false
var knowsOverridePassword = true
if hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}

knowsOverridePassword = false
let enteredDoorCode = true
let passedRetinaScan = true
if enteredDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}

