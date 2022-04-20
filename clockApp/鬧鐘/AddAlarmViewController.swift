//
//  ViewController.swift
//  clockApp
//
//  Created by 林大屍 on 2022/4/19.
//

import UIKit

class AddAlarmViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.systemTeal
        setUpNavigationBar()

    }
    
    private func setUpNavigationBar() {
        navigationItem.title = "加入鬧鐘"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "取消",
                                                           style: .done,
                                                           target: self,
                                                           action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save,
                                                            target: self,
                                                            action: nil)
    }
    


}
