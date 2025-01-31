//: [Previous](@previous)

import Foundation



//: [Next](@next)
// Main function
@MainActor func GetAllClothes(top:String?, bottom:String?, hasShoes:Bool?) -> (String?, String?, Bool?) {
    guard let top = top else {
        return ("No Shirt!", bottom ?? "No Pants!", hasShoes ?? false)
    }
    return (top, bottom ?? "No Pants!", hasShoes ?? false)
}
// Calling function and storing in clothes tuple
var clothes = GetAllClothes(top: nil ,bottom:nil, hasShoes:nil)
print("\(clothes)\n")

// Sets random temperature value to determine if you need a shirt
let temperature = Int.random(in:0...100)

// Detrermines shirt value based on temperature
if temperature < 32 {
    print("Shirt is required \n")
    clothes.0 = "T-Shirt"
}
else if temperature > 32 && temperature < 75  {
    print("Shirt is optional \n")
}
else {
    print("Too hot for a Shirt! \n")
    clothes.0 = nil
}

// If let for safe unwrapping of the shirt value
if let top = clothes.0 {
    print("If let safe unwrapping: \(top) \n")
}
// Assigns clothes if none
switch clothes {
case ("No Shirt!",_,_):
    clothes.0 = "T-shirt"
case (_,"No Pants!",_):
    clothes.1 = "Pants"
case (_,_,false):
    clothes.2 = true
default:
    print("Wow! You are nicely dressed \n")
}
print("Your current clothes are: Top: \(clothes.0 ?? "No Shirt"), Bottom: \(clothes.1 ?? "No Pants"), Has Shoes?: \(clothes.2 ?? false)")

