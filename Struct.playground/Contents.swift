import UIKit

// 문제 : 가장 가까운 편의점 찾기


// 거리 구하는 함수
func distance(current: Location, target: Location) -> Double {
    // 피타고라스
    let distanceX = Double(target.x - current.x)
    let distanceY = Double(target.y - current.y)
    let distance = sqrt(distanceX * distanceX + distanceY * distanceY)
    return distance
}


// 맨처음 시작시... 코드
struct Location {
    let x: Int
    let y: Int
}

struct Store {
    //데이터
    let loc: Location
    let name: String
    let deliveryRange = 2.0
    
    
    //메소드
    func isDeliverable(userloc: Location) -> Bool {
        let distanceToStore = distance(current: loc, target: userloc)
        return distanceToStore < deliveryRange
    }
}

// 현재 스토어 위치들
let store1 = Store(loc: Location(x: 3, y: 5), name: "gs")
let store2 = Store(loc: Location(x: 4, y: 6), name: "seven")
let store3 = Store(loc: Location(x: 1, y: 7), name: "cu")

// 가장 가까운 스토어 구해서 프린트하는 함수
func printClosestStore(currentLocation: Location, stores: [Store]) {
    var closestStoreName = ""
    var closestStoreDistance = Double.infinity
    var isDeliverable = false
    
    for store in stores {
        let distanceToStore = distance(current: currentLocation, target: store.loc)
        closestStoreDistance = min(distanceToStore, closestStoreDistance)
        if closestStoreDistance == distanceToStore {
            closestStoreName = store.name
            isDeliverable = store.isDeliverable(userloc: currentLocation)
        }
    }
    print("Closest store: \(closestStoreName), isDeliverable: \(isDeliverable)")
}


// Stores Array 셋팅, 현재 내 위치 셋팅
let myLocation = Location(x: 2, y:5)
let storeArray = [store1, store2, store3]

// printClosestStore 함수 이용해서 현재 가장 가까운 스토어 출력하기
printClosestStore(currentLocation: myLocation, stores: storeArray)



// 도전과제
// 1. 강의 이름, 강사 이름, 학생수를 가지는 Struct 만들기 (Lecture)
// 2. 강의 Array와 강사 이름 받아서, 해당 강사의 강의 이름 출력하는 함수 만들기
// 3. 강의 3개 만들고 강사 이름으로 강의 찾기

struct Lecture: CustomStringConvertible {
    var description: String{
        return "Title: \(name), Instructor: \(instructor)"
    }
    
    let name: String
    let instructor: String
    let numOfStudent: Int
}

func findLectureName (lectures: [Lecture], instructor: String) {
//    for lecture in lectures {
//        if lecture.instructor == instructor {
//            print("instructor: \(instructor), class name: \(lecture.name)")
//            return
//        }
//    }
    
    let lectureName = lectures.first {  (lec) -> Bool in
        return lec.instructor == instructor
        }?.name ?? ""
    
    print("instructor: \(lectureName)")
}

let lecture1 = Lecture(name: "ios", instructor: "Kim", numOfStudent: 10)
let lecture2 = Lecture(name: "web", instructor: "Lee", numOfStudent: 6)
let lecture3 = Lecture(name: "server", instructor: "Park", numOfStudent: 8)

let lectureArray = [lecture1, lecture2, lecture3]

findLectureName(lectures: lectureArray, instructor: "Lee")



//Protocol
//swift 같은 경우, integer가 struct로 구성되어 있음
//FixedWidthInteger, SignedInteger 들이 Protocol 이라고 하는 녀석들
//Protocol = 규약, 지켜야할 약속 > 코딩시, 꼭 구현되어야 하는 메소드, 프로퍼티 등의 목록
//ex) 어느 서비스를 이용할 때 해야할 일들 > 음악 서비스 : 아이디 생성, 결제 등
//실제로 해야할 일을 코드로 구현하는 작업을 comforming 이라고 함 (준수한다)

// CustomStringConvertible 위의 도전과제에 추가 작업
//설명형으로 쓸 때 사용, 좀 더 고급 프로그래밍을 하기 위해서는 많이 사용되어야함



//프로퍼티 개념
//struct 관계 있는 것들을 묶어서 표현하는 것, Object = Data + Method
//Data = Properties
//1. Stored property = 어떤 값을 저장해서 변수로 들고 있은 것  2. Computed property = 어떤 값을 직접 저장하지는 않고, 어떤 저장된 정보를 이용하여 가공 혹은 계산된 값을 제공할 때 사용. 매번 접근할 때마다 다시 계산되서 저장된 값이 변경되면 변경된 값을 다시 계산하여 제공함


//프로퍼티 실습
struct Person {
    var firstName: String {
        willSet {
            print("willSet: \(firstName) -> \(newValue)")
        }
        
        didSet {
            print("didSet: \(oldValue) -> \(firstName)")
        }
    }
    var lastName: String
    
    lazy var isPopular: Bool = {
        if fullName == "Jay Park" {
            return true
        } else {
            return false
        }
    }()
    
//    var fullName: String {
//        get {
//            return "\(firstName) \(lastName)"
//        }
//
//        set {
//            if let firstName = newValue.components(separatedBy: " ").first {
//                self.firstName = firstName
//            }
//
//            if let lastName = newValue.components(separatedBy: " ").last {
//                self.lastName = lastName
//            }
//        }
//    }
    
    //간략한 버전
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
    
//    func fullName() -> String {
//        return "\(firstName) \(lastName)"
//    }
    
    static let isAlien: Bool = false
    //Person 타입의 직접적인 프로퍼티는 static을 써서 나타냄
}

var person = Person(firstName: "Jason", lastName: "Lee")

//person.firstName
//person.lastName
//
//person.firstName = "Jim"
//person.lastName = "Kim"
//
//person.firstName
//person.lastName
//
////Computed property : read only  직접 할당, 업데이트, 삭제 불가 (단, get,set을 이용하면 설정할 수 있긴함)
//person.fullName
//person.fullName = "Jay Park"
//person.firstName
//person.lastName
//person.fullName

//Stored property = 저장된 값이 바뀌는 경우, 바뀐 시점을 알아 낼 수 있음 > didSet을 이용! Stored property만 가능
//setting 직전에 알 수 있는 것 = willSet으로 알 수 있음

//lazy property : 인스턴스가 생성될 때 실행되는 것이 아닌 해당 프로퍼티가 접근될 때 그제서야 코드가 실행되는 프로퍼티
//엔지니어링 측면에서 최적화하기 위해 사용! 이니셜 밸류, 인스트럭트를 생성할 때, 나름의 비용이 드는 것들이 있음. 그런 것들을 미뤄서 실제로 사용자가 접근할 때, 실행되도록 함.
person.isPopular





//프로퍼티 vs 메소드
person.fullName
//person.fullName()
//프로퍼티 : 호출시 (저장된)값을 하나만 반환한다.
//> setter가 필요한 경우
//> setter가 필요하지 않지만, 계산이 많이 없고 디비 접근 혹은 파일 입출력이 필요하지 않을 때
//메소드 : 호출시 어떤 작업을 한다.
//> setter가 필요하지 않지만, 계산이 많이 필요하거나 디비 접근 혹은 파일 입출력이 필요한 경우



//메소드 개념 및 실습
//Method : 인스턴스에 귀속되서 사용할 수 있는 녀석들. 기능을 수행하는 코드블럭. struct나 class 안에서 동작하는 것

struct Lectures {
    var title: String
    var maxStudents: Int = 10
    var numOfRegistered:Int = 0
    
    func remainSeats() -> Int {
        let remainSeats = maxStudents - numOfRegistered
        return remainSeats
    }
    
    mutating func register() { //메서드 실행시, struct의 stored 프로퍼티를 변형시킬 때 함수 좌측에 'mutating' 표시
        //등록된 학생수 증가시키기
        numOfRegistered += 1
    }
    
    //타입 프로퍼티
    static let target: String = "Anybody want to learn something"
    //타입 메서드
    static func 소속학원이름() -> String {
        return "패캠"
    }
}

var lec = Lectures(title: "iOS Basic")

//func remainSeats(of lec: Lectures) -> Int {
//    let remainSeats = lec.maxStudents - lec.numOfRegistered
//    return remainSeats
//}
//remainSeats(of: lec)

lec.remainSeats()

lec.register()
lec.remainSeats()
Lectures.target
Lectures.소속학원이름()


//메서드 확장
struct Math {
    static func abs(value: Int) -> Int {
        if value > 0 {
            return value
        } else {
            return -value
        }
    }
}

Math.abs(value: -20)

//제곱, 반값
extension Math {
    static func square(value: Int) -> Int {
        return value * value
    }
    static func half(value: Int) -> Int {
        return value/2
    }
}

Math.square(value: 6)
Math.half(value: 100)

var value: Int = 10
//제곱, 반값
extension Int {
    func square() -> Int {
        return self * self
    }
    
    func half() -> Int {
        return self/2
    }
}

value.square()
value.half()
