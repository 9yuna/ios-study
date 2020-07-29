import UIKit

//클래스 개념
//class : Reference Types, Share, heap(Slow)
//struct : Value Types, Copy, stack(Fast)
struct PersonStruct {
    var firstName: String
    var lastName: String
    
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
    
    mutating func uppercaseName() {
        firstName = firstName.uppercased()
        lastName = lastName.uppercased()
    }
}

//struct -> class
class PersonClass {
    var firstName: String
    var lastName: String
    
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    
    func uppercaseName() {
        firstName = firstName.uppercased()
        lastName = lastName.uppercased()
    }
}


var personStruct1 = PersonStruct(firstName: "Jason", lastName: "Lee")
var personStruct2 = personStruct1

var personClass1 = PersonClass(firstName: "Jason", lastName: "Lee")
var personClass2 = personClass1

//value Type
personStruct2.firstName = "Jay"
personStruct1.firstName
personStruct2.firstName

//Reference Type
personClass2.firstName = "Jay"
personClass1.firstName
personClass2.firstName

personClass2 = PersonClass(firstName: "Bob", lastName: "Lee")
personClass1.firstName
personClass2.firstName

personClass1 = personClass2
personClass1.firstName
personClass2.firstName


//언제 Class? 언제 Struct?
//Struct 사용할 때.
//1. 두 object를 "같다, 다르다"로 비교해야 하는 경우
    //let point1 = Point(x: 3, y: 5)
    //let point2 = Point(x: 3, y: 5)
//2. Copy된 각 객체들이 독립적인 상태를 가져야 하는 경우
    //var myMac = Mac(owner: "Jason")
    //var yourMac = myMac
    //yourMac.owner = "Jay"
    //
    //myMac.owner
    //yourMac.owner
//3. 코드에서 object의 데이터를 여러 스레드에 걸쳐 사용할 경우

//Class 사용할 때
//1. 두 object의 인스턴스 자체가 같음을 확인해야할 때 > object의 값 비교가 아닌 실제로 같은지 확인해야할 때
//2. 하나의 객체가 필요하고, 여러 대상에 의해 접근되고 변경이 필요한 경우 > ex)iOS 개발시 UIApplication Class


//1. 일단 Struct로 쓰자 - swift는 struct를 좋아함
//2. 필요하다면 Class로 변경
//개발 공식문서를 먼저 확인하자!


//상속개념
//중복되는 내용을 최소화 하는 방법은 여러가지가 있음 > 지금 상황에서는 '상속 개념'으로 해결할 수 있음
//Person과 Student에 중복된 내용 많음
struct Grade {
    var letter: Character
    var points: Double
    var credits: Double
}

class Person {
    var firstName: String
    var lastName: String

    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }

    func printMyName() {
        print("My name is \(firstName) \(lastName)")
    }
}

class Student: Person {
    var grades: [Grade] = []
}

let jay = Person(firstName: "Jay", lastName: "Lee")
let jason = Student(firstName: "Jason", lastName: "Lee")

jay.firstName
jason.firstName
jay.printMyName()
jason.printMyName()

let math = Grade(letter: "B", points: 8.5, credits: 3)
let history = Grade(letter: "A", points: 10.0, credits: 3)
jason.grades.append(math)
jason.grades.append(history)

jason.grades.count


//상속의 규칙과 실습
//A is B (A는 B에 포함)
//상속의 규칙
//1. 자식은 한개의 superclass만 상속받을 수 있음
//2. 부모는 여러 자식들을 가질 수 있음
//3. 상속의 깊이는 상관없음
//학생인데 운동선수
class StudentAthelete: Student {
    var minmumTrainingTime: Int = 2
    var trainedTime: Int = 0
    
    func train(){
        trainedTime += 1
    }
}

//운동선수인데 축구선수
class FootballPlayer: StudentAthelete {
    var footballTeam = "FC Swift"
    
    override func train() {
        trainedTime += 2
    }
}

//Person > Student > StudentAthelete > FootballPlayer

var athelete1 = StudentAthelete(firstName: "Yuna", lastName: "Kim")
var athelete2 = FootballPlayer(firstName: "Heung", lastName: "Son")

athelete1.firstName
athelete2.firstName

athelete1.grades.append(math)
athelete2.grades.append(math)

athelete1.minmumTrainingTime
athelete2.minmumTrainingTime

athelete2.footballTeam

athelete1.train()
athelete1.trainedTime

athelete2.train()
athelete2.trainedTime

//upcasting
athelete1 = athelete2 as StudentAthelete
athelete1.train()
athelete1.trainedTime

//downcasting
if let son = athelete1 as? FootballPlayer {
    print("--> team:\(son.footballTeam)")
}


//상속
// : 중복되는 코드를 제거할 수 있는 기회가 있음
// : 상속의 깊이가 깊어지만, 복잡해져서 유지보수가 어려워짐
//상속을 언제 사용할지 고려사항
//1. Single Responsibility 단일 책임 : 각 클래스는 한개의 고려사항만 있으면 된다.
//2. Type Safety 타입이 분명해야 할 때
//3. Shared Base Classes : 기본 동작이 다양하게 구현되어야 하는 경우
//4. Extensibility 확장성이 필요한 경우
//5. Identity 정체를 파악하기 위해 : 어떤 객체인가를 파악할 때, 상속된 클래스의 특정 속성을 통해서 파악할 수 있음



//생성자 이해하기
//Initializer(생성자)

class Person2 {
    var firstName: String
    var lastName: String

    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }

    func printMyName() {
        print("My name is \(firstName) \(lastName)")
    }
}

class Student2: Person2 {
    var grades: [Grade] = []
    
    //designated Initializer
    override init(firstName: String, lastName: String) {
        super.init(firstName: firstName, lastName: lastName)
    }
    
    //convenience Initializer
    convenience init(student: Student2) {
        self.init(firstName: student.firstName, lastName: student.lastName)
    }
}

class StudentAthelete2: Student2 {
    var minmumTrainingTime: Int = 2
    var trainedTime: Int = 0
    var sports: [String]
    
    //주 Initializer
    init(firstName: String, lastName: String, sports: [String]) {
        //자식클래스의 프로퍼티 먼저 세팅하고, 부모클래스의 프로퍼티 세팅 = 2-phase Initialization
        //phase1 : 프로퍼티 세팅(자식 먼저 부모 나중)
        self.sports = sports
        super.init(firstName: firstName, lastName: lastName)
        
        //phase2 : 프로퍼티 접근 가능, 자신이 갖고 있는 메서드도 호출 가능
        self.train()
    }
    
    
    //부 Initializer
    convenience init(name: String){
        self.init(firstName: name, lastName: "", sports: [])
    }
    
    
    
    func train(){
        trainedTime += 1
    }
}

class FootballPlayer2: StudentAthelete2 {
    var footballTeam = "FC Swift"
    
    override func train() {
        trainedTime += 2
    }
}

let student1 = Student2(firstName: "Jason", lastName: "Lee")
let student1_1 = Student2(student: student1)
let student2 = StudentAthelete2(firstName: "Jay", lastName: "Lee", sports: ["Football"])
let student3 = StudentAthelete2(name: "Mike")


//designated Initializer VS convenience Initializer
//DI는 자신의 부모의 DI를 호출해야함
//CI는 같은 클래스의 이니셜라이저를 꼭 하나 호출해야함
//CI는 궁극적으로 DI를 호출해야함
