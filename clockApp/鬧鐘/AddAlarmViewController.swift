//
//  ViewController.swift
//  clockApp
//
//  Created by 林大屍 on 2022/4/19.
//

import UIKit
import SnapKit

class AddAlarmViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let items = ["重複", "標籤", "提示聲", "稍後提醒"]
    
    
    let datepicker: UIDatePicker = {
        let myDatePicker = UIDatePicker()
        myDatePicker.datePickerMode = .time
        myDatePicker.preferredDatePickerStyle = .wheels
        return myDatePicker
    }()
    
    let tableView: UITableView = {
        let myTableView = UITableView(frame: CGRect.zero, style: .insetGrouped)
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        myTableView.backgroundColor = .clear
        return myTableView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .secondarySystemGroupedBackground
        
        
        setUpNavigationBar()
        setTableView()
        setUpView()
    }
    
    
    private func setUpNavigationBar() {
        navigationItem.title = "加入鬧鐘"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "取消",
                                                           style: .done,
                                                           target: self,
                                                           action: #selector(cancelButtonAction))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save,
                                                            target: self,
                                                            action: nil)
    }
    
    @objc func cancelButtonAction() {
        dismiss(animated: true)
    }
    
    func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        
    }
    
    
    private func setUpView() {
        
        //time picker position
        let view1 = datepicker
        view.addSubview(view1)
        view1.snp.makeConstraints { make in
            make.height.equalToSuperview().multipliedBy(0.25)
        }
        
        
        
        let mainVStackView = UIStackView(arrangedSubviews: [view1, tableView])
        mainVStackView.axis = .vertical
        view.addSubview(mainVStackView)
        mainVStackView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.centerX.equalToSuperview()
            make.leading.equalTo(16)
            make.bottom.equalToSuperview()
        }
        
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell
        
        switch (indexPath.row) {
            
        case 0 :
            cell = UITableViewCell(style: .value1, reuseIdentifier: "r1")
            cell.detailTextLabel?.text = "星期一"
            cell.accessoryType = .disclosureIndicator
            
        case 1 :
            cell = UITableViewCell(style: .value1, reuseIdentifier: "r2")
            cell.detailTextLabel?.text = "鬧鐘"
            cell.accessoryType = .disclosureIndicator
            
        case 2 :
            cell = UITableViewCell(style: .value1, reuseIdentifier: "r3")
            cell.detailTextLabel?.text = "彈跳聲"
            cell.accessoryType = .disclosureIndicator
        case 3 :
            cell = UITableViewCell(style: .value1, reuseIdentifier: "r4")
            cell.accessoryView = UISwitch()
            
        default:
            cell = UITableViewCell(style: .default, reuseIdentifier: "default")
        }
        
        cell.textLabel?.text = items[indexPath.row]
        cell.backgroundColor = .secondarySystemFill
        
        return cell
    }
    
    
    
}
