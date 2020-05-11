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
    let loc: Location
    let name: String
    let deliveryRange = 2.0
    
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

struct Lecture {
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
