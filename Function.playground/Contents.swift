import UIKit

func printName(){
    print("---> My name is Jane")
}

printName()


func printMultipleOfTen(value: Int) {
    print("\(value) * 10 = \(value * 10)")
}

printMultipleOfTen(value: 5)

//func printTotalPrice(_ price: Int, _ count: Int) {
//    print("Total Price: \(price * count)")
//}
//
//printTotalPrice(1500, 5)

func printTotalPrice(_ price: Int, _ count: Int) {
    print("Total Price: \(price * count)")
}
printTotalPrice(1500, 5)


func printTotalPriceWithDefaultValue(price: Int = 1500, count: Int) {
    print("Total Price: \(price * count)")
}
printTotalPriceWithDefaultValue(count: 5)


func totalPrice(price: Int, count: Int) -> Int {
    let totalPrice = price * count
    return totalPrice
}

let calculatedPrice = totalPrice(price: 10000, count: 77)
calculatedPrice



// ---> Overloading

func printTotalPrice(price: Int, count: Int) {
    print("Total Price : \(price * count)")
}

func printTotalPrice(price: Double, count: Double) {
    print("Total Price : \(price * count)")
}

func printTotalPrice(가격: Double, 개수: Double) {
    print("총 가격 : \(가격 * 개수)")
}

// ---> In-out paramter
var value = 3
func incrementAndPrint(_ value: inout Int) {
    value += 1
    print(value)
}
incrementAndPrint(&value)


// ---> Function as a param

func add(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func subtract(_ a: Int, _ b: Int) -> Int {
    return a - b
}

var function = add
function(4, 2)
function = subtract
function(4, 2)

func printResult(_ function: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    let result = function(a, b)
    print(result)
}
printResult(add, 10, 5)
