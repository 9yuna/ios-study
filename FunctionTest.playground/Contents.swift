import UIKit

// 1. 성, 이름 받아서 fullName 출력하는 함수 만들기
func printFullName(firstName: String, lastName: String){
    print("fullName: \(firstName) \(lastName)")
}
printFullName(firstName: "Jane", lastName: "Lee")

// 2. 1번에서 만든 함수인데, 파라미터 이름을 제거하고 fullName 출력하는 함수 만들기
func printFullNameRemovePara(_ firstName: String, _ lastName: String){
    print("fullName: \(firstName) \(lastName)")
}
printFullNameRemovePara("Jane", "Lee")

// 3. 성, 이름 받아서 fullName return 하는 함수 만들기
func fullName(firstName: String, lastName: String) -> String {
    return "\(firstName) \(lastName)"
}
let name: String = fullName(firstName: "Jane", lastName: "Lee")
name
