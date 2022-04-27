//
//  WeekViewController.swift
//  clockApp
//
//  Created by 林大屍 on 2022/4/25.
//

import UIKit

class WeekViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource {
    
    var alarmItems: [String] = []
    let items = ["星期一", "星期二", "星期三", "星期四", "星期五", "星期六", "星期日"]
    
    let tableView: UITableView = {
        let myTableView = UITableView(frame: CGRect.zero, style: .insetGrouped)
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        myTableView.backgroundColor = .clear
        myTableView.isScrollEnabled = false
        myTableView.allowsMultipleSelection = true
        return myTableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .secondarySystemGroupedBackground
        
        setTableView()
    }
    
    
    override func loadView() {
        super.loadView()
        view = tableView
    }

    private func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = UITableViewCell(style: .value1, reuseIdentifier: "r1")
        let day = items[indexPath.row]
        cell.textLabel?.text = day
        let isSelected = alarmItems.contains(day)
        cell.accessoryType = isSelected ? .checkmark : .none
        cell.backgroundColor = .secondarySystemFill

        return cell
    }

    //display a checkmark or an accessory view to indicate the selected state.
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let day = items[indexPath.row]
        if !alarmItems.contains(day) {
            alarmItems.append(day)
        } else {
            if let index = alarmItems.firstIndex(of: day) {
                alarmItems.remove(at: index)
            }
        }
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
 
}

