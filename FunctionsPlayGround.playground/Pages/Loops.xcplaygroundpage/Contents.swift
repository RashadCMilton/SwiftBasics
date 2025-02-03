//: [Previous](@previous)

import Foundation

let numbers = [1, 2, 3, 4, 5,6,7,8,9,10]

// Simpliest For Loop
for value in numbers {
    print(value)
}

for number in 10...20 {
    print(number)
    
}
// need .enumerated for the indexes
for (index, value) in numbers.enumerated() {
    print("Index: \(index), Value: \(value)")
}

for x in 0..<numbers.count {
    print(x)
}

let dictionary = ["apple": 2, "banana": 5, "orange": 4]

for (key, value) in dictionary {
    print("Key: \(key), Value: \(value)")
}

// while
var j = 50;
while j <= 100 {
    print(j)
    j+=1;
}

var i = 22;
// repeat while will execute at least once 
repeat{
    print(i)
    i+=1
} while i <= 20





