//
//  BountyViewController.swift
//  BountyList
//
//  Created by Gyuna on 2020/07/30.
//  Copyright © 2020 gyuan. All rights reserved.
//

import UIKit

class BountyViewController: UIViewController , UITableViewDataSource, UITableViewDelegate {
    
    //MVVM
    
    //Model
    // - BountyInfo
    // > BountyInfo 만들자
    
    //View
    // - ListCell
    // > ListCell에 필요한 정보를 ViewModel한테서 받아야겠다
    // > ListCell은 ViewModel로 부터 받은 정보로 뷰 업데이트하기
    
    //ViewModel
    // - BountyViewModel
    // > BountyViewModel을 만들고, 뷰레이어에서 필요한 메서드 만들기
    // > 모델 가지고 있기. BountyInfo들
    

// View에서는 Model 직접 접근 안함. ViewModel을 통해서함
//    let bountyInfoList: [BountyInfo] = [
//        BountyInfo(name: "brook", bounty: 33000000),
//        BountyInfo(name: "chopper", bounty: 50),
//        BountyInfo(name: "franky", bounty: 44000000),
//        BountyInfo(name: "luffy", bounty: 300000000),
//        BountyInfo(name: "nami", bounty: 16000000),
//        BountyInfo(name: "robin", bounty: 80000000),
//        BountyInfo(name: "sanji", bounty: 77000000),
//        BountyInfo(name: "zoro", bounty: 120000000)
//    ]
    
    let viewModel = BountyViewModel()

//    let nameList = ["brook", "chopper", "franky", "luffy", "nami", "robin", "sanji", "zoro"]
//    let bountyList = [33000000, 50, 44000000, 300000000, 16000000, 80000000, 77000000, 120000000]
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //세그웨이 수행하기 직전 준비할 때, 데이터를 넘겨주자
        //DetailViewController에 데이터 전송
        if segue.identifier == "showDetail" {
            let vc = segue.destination as? DetailViewController
            if let index = sender as? Int {
//                let bountyInfo = bountyInfoList[index]
                let bountyInfo = viewModel.bountyInfo(at: index)                
//                vc?.name = nameList[index]
//                vc?.bounty = bountyList[index]

                vc?.viewModel.update(model: bountyInfo)
//               vc?.bountyInfo = bountyInfo
//                vc?.name = bountyInfo.name
//                vc?.bounty = bountyInfo.bounty
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
        
    //UITableViewDataSource
    //테이블뷰 셀 몇개니?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return bountyList.count
//        return bountyInfoList.count
        return viewModel.numOfBountyInfoList
    }
    //테이블뷰 셀 어떻게 보여줄꺼니?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else{
//            return UITableViewCell()
//        }
//        return cell

        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell {
//            let img = UIImage(named: "\(nameList[indexPath.row])")
//            cell.imgView.image = img
//            cell.nameLabel.text = nameList[indexPath.row]
//            cell.bountyLabel.text = "\(bountyList[indexPath.row])"
            
//            let bountyInfo = bountyInfoList[indexPath.row]
            let bountyInfo = viewModel.bountyInfo(at: indexPath.row)
            cell.update(info: bountyInfo)
//            cell.imgView.image = bountyInfo.image
//            cell.nameLabel.text = bountyInfo.name
//            cell.bountyLabel.text = "\(bountyInfo.bounty)"
            
            return cell
        } else {
            return UITableViewCell()
        }
        
        
    }
    
    
    //UITableViewDelegate
    //셀 클릭하면 이떻게 할꺼야?
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("--> \(indexPath.row)")
        
        performSegue(withIdentifier: "showDetail", sender: indexPath.row)
    }
}

//customcell
class ListCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
    func update(info: BountyInfo) {
        imgView.image = info.image
        nameLabel.text = info.name
        bountyLabel.text = "\(info.bounty)"
    }
}

class BountyViewModel {
    let bountyInfoList: [BountyInfo] = [
        BountyInfo(name: "brook", bounty: 33000000),
        BountyInfo(name: "chopper", bounty: 50),
        BountyInfo(name: "franky", bounty: 44000000),
        BountyInfo(name: "luffy", bounty: 300000000),
        BountyInfo(name: "nami", bounty: 16000000),
        BountyInfo(name: "robin", bounty: 80000000),
        BountyInfo(name: "sanji", bounty: 77000000),
        BountyInfo(name: "zoro", bounty: 120000000)
    ]
    
    var sortedList: [BountyInfo] {
        let sortedList = bountyInfoList.sorted { prev, next in
            return prev.bounty > next.bounty
        }
        return sortedList
    }
    
    var numOfBountyInfoList: Int {
        return bountyInfoList.count
    }
    
    
    func bountyInfo(at index: Int) -> BountyInfo {
        return sortedList[index]
    }
}
