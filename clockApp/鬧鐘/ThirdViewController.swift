//
//  ThirdViewController.swift
//  clockApp
//
//  Created by 林大屍 on 2022/4/18.
//

import UIKit

class ThirdViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.systemGray
        setUpNavigationBar()
    }
    
    private func setUpNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAddButton))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: nil)
        
    }
    
    @objc private func didTapAddButton() {
        let rootVC = AddAlarmViewController()
        let navVC = UINavigationController(rootViewController: rootVC)
        
        present(navVC, animated: true)
    }
    
    
    
    
}


