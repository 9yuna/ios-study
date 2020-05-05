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
