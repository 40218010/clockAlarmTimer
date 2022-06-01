//
//  WeekViewController.swift
//  clockApp
//
//  Created by 林大屍 on 2022/4/25.
//

import UIKit

protocol DayPickerManagerDelegate: AnyObject {
    func didUpdateSelectedDays(_ days: Set<Day>)
}


class DayPickerViewController: UIViewController {
    
    
    let oneWeek = Day.allCases
    var selectedDays = Set<Day>() {
        didSet {
            delegate?.didUpdateSelectedDays(selectedDays)
        }
    }
    weak var delegate: DayPickerManagerDelegate?
    
    
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
        
        view.backgroundColor = .systemGroupedBackground
        
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
    
}


//MARK: - UITableViewDataSource
extension DayPickerViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return oneWeek.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "r1")
        let day = oneWeek[indexPath.row]
        cell.textLabel?.text = day.dayString
        let isSelected = selectedDays.contains(day)
        cell.accessoryType = isSelected ? .checkmark : .none
        //        cell.backgroundColor = .secondarySystemFill
        
        return cell
    }
    
}

//MARK: - UITableViewDelegate
extension DayPickerViewController: UITableViewDelegate {
    //display a checkmark or an accessory view to indicate the selected state.
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let day = oneWeek[indexPath.row]
        if selectedDays.contains(day) {
            selectedDays.remove(day)
        } else {
            selectedDays.insert(day)
        }
        
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}


