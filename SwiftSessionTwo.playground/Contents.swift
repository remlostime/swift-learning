//: Playground - noun: a place where people can play

import UIKit

// String concatenation
var str = "Hello, "
var fullStr = str + "Buddy"

// Characters treatment : Character
for character in fullStr.characters {
    print(character)
}
print("\n\n")
for character in "Dog!🐶".characters {
    print(character)
}

// String Interpolation
// Before : NSString stringWithFormat .... %@ %d %💩
let multiplier = 3
let message = "\(multiplier) times 2 is \(multiplier * 2)"

// Unicode
let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
// "Imagination is more important than knowledge" - Einstein
let dollarSign = "\u{24}"        // $,  Unicode scalar U+0024
let blackHeart = "\u{2665}"      // ♥,  Unicode scalar U+2665
let sparklingHeart = "\u{1F496}" // 💖, Unicode scalar U+1F496

// Index manipulation
let greeting = "Guten Tag!"
greeting[greeting.startIndex]
// G
greeting[greeting.index(before: greeting.endIndex)]
// !
greeting[greeting.index(after: greeting.startIndex)]
// u
let index = greeting.index(greeting.startIndex, offsetBy: 1)
greeting[index]

// hasPrefix(_:)
// hasSuffix(_:)

// COLLECTIONS TYPES

// ARRAYS
let arrayTest = [String]()
//arrayTest.append("LOL") == ERROR

var threeDoubles = Array(repeating: 0.0, count: 3)

var shoppingList = Array(repeating: "Pears", count: 8)
print(shoppingList)
shoppingList[4...6] = ["Bananas", "Apples", "Coconut"]
print(shoppingList)

// SETS
/*
 Use the intersection(_:) method to create a new set with only the values common to both sets.
 Use the symmetricDifference(_:) method to create a new set with values in either set, but not both.
 Use the union(_:) method to create a new set with all of the values in both sets.
 Use the subtracting(_:) method to create a new set with values not in the specified set.
*/

// Dictionnaries
var namesOfIntegers = [Int: String]()

var airports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
let airportCodes = [String](airports.keys)
// airportCodes is ["YYZ", "LHR"]

let airportNames = [String](airports.values)
// airportNames is ["Toronto Pearson", "London Heathrow"]


// Control Flows
// Repeat while

let finalSquare = 25
var board = [Int](repeating: 0, count: finalSquare + 1)
board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
var square = 0
var diceRoll = 0

repeat {
    // move up or down for a snake or ladder
    square += board[square]
    // roll the dice
    diceRoll += 1
    if diceRoll == 7 { diceRoll = 1 }
    // move by the rolled amount
    square += diceRoll
    print(square)
} while square < finalSquare

// Switch
// NO MORE BREAKS

let someCharacter: Character = "z"
switch someCharacter {
case "a":
    print("The first letter of the alphabet")
case "z":
    print("The last letter of the alphabet")
    //fallthrough
case "z":
    print("The last letter of the alphabet")
default:
    print("Some other character")
}

// Additional Criterias with where keyword:

let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}

// Compound Cases
let letter: Character = "e"
switch letter {
case "a", "e", "i", "o", "u":
    print("\(letter) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
     "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    print("\(letter) is a consonant")
default:
    print("\(letter) is not a vowel or a consonant")
}

let numberSymbol: Character = "三"  // Chinese symbol for the number 3
var possibleIntegerValue: Int?
switch numberSymbol {
case "1", "١", "一", "๑":
    possibleIntegerValue = 1
case "2", "٢", "二", "๒":
    possibleIntegerValue = 2
case "3", "٣", "三", "๓":
    possibleIntegerValue = 3
case "4", "٤", "四", "๔":
    possibleIntegerValue = 4
default:
    break
}
if let integerValue = possibleIntegerValue {
    print("The integer value of \(numberSymbol) is \(integerValue).")
} else {
    print("An integer value could not be found for \(numberSymbol).")
}


let finalSquareValue = 25
var boardValue = [Int](repeating: 0, count: finalSquare + 1)
board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
var squareValue = 0
var diceRollValue = 0


gameLoop: while squareValue != finalSquareValue {
    diceRollValue += 1
    if diceRollValue == 7 { diceRollValue = 1 }
    switch squareValue + diceRollValue {
    case finalSquareValue:
        // diceRoll will move us to the final square, so the game is over
        break gameLoop
    case let newSquare where newSquare > finalSquareValue:
        // diceRoll will move us beyond the final square, so roll again
        continue gameLoop
    default:
        // this is a valid move, so find out its effect
        squareValue += diceRollValue
        squareValue += boardValue[squareValue]
    }
}
print("Game over!")

// Early Exit : Guard Statement
func greet(person: [String: String]) {
    guard let name = person["name"] else {
        return
    }
    
    print("Hello \(name)!")
    
    guard let location = person["location"] else {
        print("I hope the weather is nice near you.")
        return
    }
    
    print("I hope the weather is nice in \(location).")
}

greet(person: ["name": "John"])
// Prints "Hello John!"
// Prints "I hope the weather is nice near you."
greet(person: ["name": "Jane", "location": "Cupertino"])
// Prints "Hello Jane!"
// Prints "I hope the weather is nice in Cupertino."

//
//if #available(platform name version, ..., *) {
//    statements to execute if the APIs are available
//} else {
//    fallback statements to execute if the APIs are unavailable
//}
