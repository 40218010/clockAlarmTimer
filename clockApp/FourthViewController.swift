//
//  FourthViewController.swift
//  clockApp
//
//  Created by 林大屍 on 2022/4/18.
//

import UIKit

class FourthViewController: UIViewController
//,UITableViewDelegate, UITableViewDataSource
{
    
//    let items = ["重複", "標籤", "提示聲", "稍後提醒"]
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return items.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        var cell: UITableViewCell
//
//        switch (indexPath.row) {
//
//        case 0 :
//            cell = UITableViewCell(style: .value1, reuseIdentifier: "r1")
//            cell.detailTextLabel?.text = "星期一"
//            cell.accessoryType = .disclosureIndicator
//
//        case 1 :
//            cell = UITableViewCell(style: .value1, reuseIdentifier: "r2")
//            cell.detailTextLabel?.text = "鬧鐘"
//            cell.accessoryType = .disclosureIndicator
//
//        case 2 :
//            cell = UITableViewCell(style: .value1, reuseIdentifier: "r3")
//            cell.detailTextLabel?.text = "彈跳聲"
//            cell.accessoryType = .disclosureIndicator
//        case 3 :
//            cell = UITableViewCell(style: .value1, reuseIdentifier: "r4")
//            cell.accessoryView = UISwitch()
//
//        default:
//            cell = UITableViewCell(style: .default, reuseIdentifier: "default")
//        }
//
//        cell.textLabel?.text = items[indexPath.row]
//
//        return cell
//    }
//
//
//    let tableView: UITableView = {
//        let myTableView = UITableView(frame: CGRect.zero, style: .insetGrouped)
//        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
//        return myTableView
//    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        

//        setTableView()
        
        view.backgroundColor = UIColor.systemTeal
        navigationItem.title = ""
    }
    
//    override func loadView() {
//        super.loadView()
//        view = tableView
//    }
//
//    func setTableView() {
//        tableView.delegate = self
//        tableView.dataSource = self
//
//
//    }
    
    
    


}
