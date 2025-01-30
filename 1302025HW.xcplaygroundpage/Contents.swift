//: [Previous](@previous)
import Foundation

// Array
var array: [Int] = [Int]()
array.append(0)
array.append(1)
array.append(2)
array.append(3)
array.append(array.count)


// appends duplicate values to end of array
print("The current array before adding new  duplicated value \(array)")
for arrayValue in array {
    array.append(arrayValue)
}
print("Array with duplicated values \(array)")

//Set
// Utilize set to eliminate duplicates and the sort functionality to sort elements
var eliminateDuplicates: Set<Int> = Set(array)
print("Set with eliminated duplicates \(eliminateDuplicates)")
print("Array with eliminated duplicates \(Array(eliminateDuplicates))")
print("Sorted Set with eliminated duplicates \(Array(eliminateDuplicates.sorted()))")
print("Sorted array with eliminated duplicated \(Array(eliminateDuplicates.sorted()))")


//Dictionary
// Utilize Dictionary to store data from the Set and Array
var dictionary = [Int: Int]()
var arrayIndex = 0;
for element in eliminateDuplicates.sorted(){
    dictionary[element] = array[arrayIndex]
    arrayIndex += 1
}

print("The dictionary with Sorted Set(eliminateDuplicates) elements as key and array values as values \(dictionary)")








