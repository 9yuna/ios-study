import UIKit

var carName: String?
carName = "땡크"

//아주 간단한 과제

var favoriteMovieStar: String? = nil
let num = Int("10")


// optional 고급 기능 4가지
// Forced unwrapping > 박스를 강제로 열어봄
// Optional binding (if let) > 부드럽게 박스를 열어봄 1
// Optional binding (guard) > 부드럽게 박스를 열어봄 2
// Nil coalescing > 박스 열어보고 값이 없으면 디폴트 값을 줌


// Forced unwrapping
//carName = nil
//print(carName!)


// Optional binding (if let)
carName = nil
if let unwrappedCarName = carName {
    print(unwrappedCarName)
} else {
    print("Car Name 없다.")
}

//func printParsedInt(from: String){
//    if let parsedInt = Int(from) {
//        print(parsedInt)
//    } else {
//        print("Int로 컨버팅 안 됨")
//    }
//}
//
//printParsedInt(from: "100w")


// Optional binding (guard)
func printParsedInt(from: String){
    guard let parsedInt = Int(from) else {
        print("Int로 컨버팅 안 됨")
        return
    }
    print(parsedInt)
}

printParsedInt(from: "100")
printParsedInt(from: "100w")


// Nil coalescing
let myCarName: String = carName ?? "모델 S"



// --- 도전 과제
// 1. 최애 음식이름을 담는 변수 작성 (String?)
// 2. 옵셔널 바인딩을 이용해서 값 확인
// 3. 닉네임을 받아서 출력하는 함수 만들기, 조건 입력 파라미터는 String?

var favoriteFoodName: String? = "떡볶이"

if let foodName = favoriteFoodName {
    print(foodName)
} else {
    print("좋아하는 음식 없음")
}

func printNickName(nick: String?){
    guard let nickName = nick else {
        print("nickname 만들어 보자")
        return
    }
    print(nickName)
}

printNickName(nick: "nana")
printNickName(nick: nil)
