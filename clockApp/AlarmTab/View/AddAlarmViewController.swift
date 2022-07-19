//
//  ViewController.swift
//  clockApp
//
//  Created by 林大屍 on 2022/4/19.
//

import UIKit
import SnapKit

protocol AlarmListManagerDelegate: AnyObject {
    func didAddAlarm(_ alarmModel: AlarmModel)
}

class AddAlarmViewController: UIViewController {
    
    //    var didTapDelete: ((AlarmModel) -> Void)?
    var didTapDelete: (() -> Void)?
    
    var didSaveEdit: ((AlarmModel) -> Void)?
    
    weak var delegate: AlarmListManagerDelegate?
    
    let titles = AddAlarmCell.allCases
    
    var isEditMode: Bool = false
    
    var alarmModel: AlarmModel! {
        didSet{
            timePicker.date = alarmModel.time
            tableView.reloadData()
        }
    }
    
    private let timePicker: UIDatePicker = {
        let myDatePicker = UIDatePicker()
        myDatePicker.datePickerMode = .time
        myDatePicker.preferredDatePickerStyle = .wheels
        return myDatePicker
    }()
    
    private let tableView: UITableView = {
        let myTableView = UITableView(frame: CGRect.zero, style: .insetGrouped)
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell2")
        myTableView.isScrollEnabled = false
        return myTableView
    }()
    
    private let deleteButton: UIButton = {
        let mydeleteButton = UIButton()
        mydeleteButton.setTitle("刪除鬧鐘", for: .normal)
        mydeleteButton.setTitleColor(UIColor.systemRed, for: .normal)
        mydeleteButton.backgroundColor = .secondarySystemGroupedBackground
        mydeleteButton.layer.cornerRadius = 10
        return mydeleteButton
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGroupedBackground
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "返回",
                                                                style: .done,
                                                                target: self,
                                                                action: nil)
        
        
        checkAlarm()
        setUpNavigationBar()
        setUpTableView()
        setUpView()
        
        deleteButton.addTarget(self, action: #selector(deleteButtonClicked), for: .touchUpInside)
        timePicker.addTarget(self, action: #selector(changeAlarmTime), for: .valueChanged)
    }
    
    private func checkAlarm() {
        if alarmModel == nil {
            isEditMode = false
            alarmModel = AlarmModel()
        } else {
            isEditMode = true
        }
    }
    
    private func setUpNavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "取消",
                                                           style: .done,
                                                           target: self,
                                                           action: #selector(cancelButtonAction))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "儲存",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(saveButtonPressed))
    }
    
    private func setUpTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    
    
    @objc func cancelButtonAction() {
        dismiss(animated: true)
    }
    
    @objc func saveButtonPressed() {
        // 判斷是編輯或新增
        if isEditMode {
            didSaveEdit?(alarmModel)
        } else {
            delegate?.didAddAlarm(alarmModel)
        }
        
        dismiss(animated: true)
    }
    
    @objc func changeAlarmTime(_ datePicker: UIDatePicker) {
        alarmModel.time = datePicker.date
    }
    
    @objc func deleteButtonClicked() {
        print("Button Clicked")
        
        dismiss(animated: true)
        
        //        guard let unwrappedSelectedAlarm = selectedAlarm else { return }
        //        didTapDelete?(unwrappedSelectedAlarm)
        
        didTapDelete?()
        
        
    }
    
    
    
    private func setUpView() {
        let mainVStackView = UIStackView(arrangedSubviews: [timePicker, tableView])
        mainVStackView.axis = .vertical
        view.addSubview(mainVStackView)
        if isEditMode {
            mainVStackView.addArrangedSubview(deleteButton)
            deleteButton.snp.makeConstraints { make in
                make.height.equalTo(40)
            }
        }
        tableView.snp.makeConstraints { make in
            make.height.equalTo(240)
            
        }
        mainVStackView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.centerX.equalToSuperview()
            make.bottom.lessThanOrEqualToSuperview()
            make.width.equalToSuperview().offset(-32)
        }
    }
    
    
}

extension AddAlarmViewController {
    
    enum AddAlarmCell : CaseIterable {
        case rePeat
        case tag
        case sound
        case reminder
        
        var title: String {
            switch self {
            case .rePeat:
                return "重複"
            case .tag:
                return "標籤"
            case .sound:
                return "提示聲"
            case .reminder:
                return "稍後提醒"
            }
        }
    }
}

// MARK: - UITableViewDataSource
extension AddAlarmViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: nil)
        let row = titles[indexPath.row]
        
        switch row {
        case .rePeat :
            cell.detailTextLabel?.text = alarmModel.repeatText
            cell.accessoryType = .disclosureIndicator
        case .tag :
            cell.detailTextLabel?.text = alarmModel.alarmTag
            cell.accessoryType = .disclosureIndicator
        case .sound :
            cell.detailTextLabel?.text = "彈跳聲"
            cell.accessoryType = .disclosureIndicator
        case .reminder :
            cell.accessoryView = UISwitch()
            
        }
        
        cell.textLabel?.text = row.title
        
        return cell
    }
    
}

//MARK: - UITableViewDelegate
extension AddAlarmViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let row = titles[indexPath.row]
        switch row {
        case .rePeat :
            let dayPickerVC = DayPickerViewController()
            dayPickerVC.title = row.title
            dayPickerVC.selectedDays = alarmModel.selectedDays
            dayPickerVC.delegate = self
            navigationController?.pushViewController(dayPickerVC, animated: true)
        case .tag:
            let tagVC = TagViewController()
            tagVC.title = row.title
            tagVC.alarmTag = alarmModel.alarmTag
            tagVC.delegate = self
            navigationController?.pushViewController(tagVC, animated: true)
        case .sound:
            break
        case .reminder:
            break
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

//MARK: - DayPickerManagerDelegate
extension AddAlarmViewController: DayPickerManagerDelegate {
    func didUpdateSelectedDays(_ days: Set<Day>) {
        alarmModel.selectedDays = days
    }
}

//MARK: - AlarmTagManagerDelegate
extension AddAlarmViewController: AlarmTagManagerDelegate {
    func didUpdateAlarmTag(_ tagText: String) {
        alarmModel.alarmTag = tagText
    }
}
