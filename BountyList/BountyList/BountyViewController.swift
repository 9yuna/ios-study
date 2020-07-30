//
//  BountyViewController.swift
//  BountyList
//
//  Created by Gyuna on 2020/07/30.
//  Copyright © 2020 gyuan. All rights reserved.
//

import UIKit

class BountyViewController: UIViewController , UITableViewDataSource, UITableViewDelegate {

    let nameList = ["brook", "chopper", "franky", "luffy", "nami", "robin", "sanji", "zoro"]
    let bountyList = [33000000, 50, 44000000, 300000000, 16000000, 80000000, 77000000, 120000000]
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //세그웨이 수행하기 직전 준비할 때, 데이터를 넘겨주자
        //DetailViewController에 데이터 전송
        if segue.identifier == "showDetail" {
            let vc = segue.destination as? DetailViewController
            if let index = sender as? Int {
                vc?.name = nameList[index]
                vc?.bounty = bountyList[index]
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
        
    //UITableViewDataSource
    //테이블뷰 셀 몇개니?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bountyList.count
    }
    //테이블뷰 셀 어떻게 보여줄꺼니?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else{
//            return UITableViewCell()
//        }
//        return cell

        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell {
            let img = UIImage(named: "\(nameList[indexPath.row])")
            cell.imgView.image = img
            cell.nameLabel.text = nameList[indexPath.row]
            cell.bountyLabel.text = "\(bountyList[indexPath.row])"
            
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
}
