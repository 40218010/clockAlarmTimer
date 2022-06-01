//
//  EditAlarmViewController.swift
//  clockApp
//
//  Created by 林大屍 on 2022/5/6.
//

import UIKit
import SnapKit

class EditAlarmViewController: UIViewController {
    
    let thisCell = EditCell.allCases
        
    let timePicker: UIDatePicker = {
        let myTimePicker = UIDatePicker()
        myTimePicker.datePickerMode = .time
        myTimePicker.preferredDatePickerStyle = .wheels
        return myTimePicker
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .insetGrouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "EditCell")
        tableView.isScrollEnabled = false
        return tableView
    }()
    
    let deleteButton: UIButton = {
        let mydeleteButton = UIButton()
        mydeleteButton.setTitle("刪除鬧鐘", for: .normal)
        mydeleteButton.setTitleColor(UIColor.systemRed, for: .normal)
        mydeleteButton.backgroundColor = .secondarySystemGroupedBackground
        mydeleteButton.layer.cornerRadius = 10
        return mydeleteButton
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .orange
        
        setUpView()
        setUpNavigationBar()
        setUpTableView()
        
        deleteButton.addTarget(self, action: #selector(deleteButtonClicked), for: .touchUpInside)
        
    }
    
    private func setUpView() {
        view.addSubview(timePicker)
        view.addSubview(deleteButton)
        deleteButton.snp.makeConstraints { make in
            make.height.equalTo(40)
        }
        
        
        let mainVStack = UIStackView(arrangedSubviews: [timePicker, tableView, deleteButton])
        mainVStack.axis = .vertical
        view.addSubview(mainVStack)
        tableView.snp.makeConstraints { make in
            make.height.equalTo(240)
        }
        mainVStack.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.centerX.equalToSuperview()
            make.bottom.lessThanOrEqualToSuperview()
            make.width.equalToSuperview().offset(-16)
        }
    }
    
    private func setUpTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setUpNavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "取消",
                                                           style: .done,
                                                           target: self,
                                                           action: #selector(cancelButtonTapped))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "儲存",
                                                            style: .plain,
                                                            target: self,
                                                            action: nil)
    }
    
    @objc func cancelButtonTapped() {
        dismiss(animated: true)
    }
    
    @objc func deleteButtonClicked() {
        print("Button Clicked")
    }
    
    
    
}

extension EditAlarmViewController {
    
    enum EditCell: CaseIterable {
        case rePeat
        case tag
        case sound
        case reminder
        var title: String {
            switch self {
            case .rePeat:   return "重複"
            case .tag:      return "標籤"
            case .sound:    return "提示聲"
            case .reminder: return "稍後提醒"
            }
        }
        
        
    }
}

extension EditAlarmViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return thisCell.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EditCell", for: indexPath)
        let row = thisCell[indexPath.row]
        switch row {
            
        case .rePeat:
            break
        case .tag:
            break
        case .sound:
            break
        case .reminder:
            break
        }
        
        cell.textLabel?.text = row.title
        
        return cell
        
    }
    
    
}

extension EditAlarmViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

