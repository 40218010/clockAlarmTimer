//
//  ThirdViewController.swift
//  clockApp
//
//  Created by 林大屍 on 2022/4/18.
//

import UIKit


class L2ViewController: UIViewController {
    
    //    var alarmList = [AlarmModel]()
    
    var ac = AlarmController()
    
    
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CustomTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.isEditing = false
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpNavigationBar()
    }
    
    override func loadView() {
        super.loadView()
        view = tableView
    }
    
    private func setUpNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(didTapAddButton))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "編輯",
                                                           style: .done,
                                                           target: self,
                                                           action: #selector(startEditing(_:)))
        
    }
    
    @objc private func didTapAddButton() {
        let rootVC = AddAlarmViewController()
        let navVC = UINavigationController(rootViewController: rootVC)
        rootVC.title = "加入鬧鐘"
        rootVC.delegate = self
        present(navVC, animated: true)
    }
    
    @objc func startEditing(_ sender: UIBarButtonItem) {
        tableView.isEditing.toggle()
        sender.title = (tableView.isEditing) ? "完成" : "編輯"
        
    }
    
    
}


//MARK: - UITableViewDataSource
extension L2ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ac.alarms.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let thisAlarm = ac.alarms[indexPath.row]
        
        
        cell.textLabel?.text = thisAlarm.timeString
        cell.textLabel?.font = .systemFont(ofSize: 50)
        cell.detailTextLabel?.text = thisAlarm.alarmSubtitle
        cell.detailTextLabel?.font = .preferredFont(forTextStyle: .body)
        cell.accessoryView = UISwitch()
        
        return cell
    }
    
    //    //In order to reorder the items you only need to override two methods:
    //    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
    //        return true
    //    }
    //
    //    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
    //
    //
    //        let itemToMove = alarms[sourceIndexPath.row]
    //        alarms.remove(at: sourceIndexPath.row)
    //        alarms.insert(itemToMove, at: destinationIndexPath.row)
    //    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            print("deleted")
            
            ac.alarms.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    
}

//MARK: - UITableViewDelegate
extension L2ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let rootVC = AddAlarmViewController()
        let navVC = UINavigationController(rootViewController: rootVC)
        present(navVC, animated: true)
        rootVC.title = "編輯鬧鐘"
        
        let selectedAlarm = ac.alarms[indexPath.row]
        rootVC.alarmModel = selectedAlarm
        rootVC.didTapDelete = { [weak self] in
            self?.ac.alarms.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
        }
        
        rootVC.didSaveEdit = { [weak self] mmm in
            if let index = self?.ac.alarms.firstIndex(where: { $0.id == mmm.id }) {
                self?.ac.alarms[index] = mmm
                self?.tableView.reloadData()
            }
            
        }
        
    }
    
}


extension L2ViewController: AlarmListManagerDelegate {
    func didAddAlarm(_ alarmModel: AlarmModel) {
        self.ac.alarms.append(alarmModel)
        self.tableView.reloadData()
    }
    
}


