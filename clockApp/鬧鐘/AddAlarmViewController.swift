//
//  ViewController.swift
//  clockApp
//
//  Created by 林大屍 on 2022/4/19.
//

import UIKit
import SnapKit

class AddAlarmViewController: UIViewController {
    
    let datepicker: UIDatePicker = {
       let myDatePicker = UIDatePicker()
        myDatePicker.datePickerMode = .time
        myDatePicker.preferredDatePickerStyle = .wheels
        return myDatePicker
    }()
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.systemBrown
        setUpNavigationBar()
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
    
    private func setUpView() {
        
        //time picker position
        let view1 = datepicker
        view.addSubview(view1)
        view1.snp.makeConstraints { make in
            make.height.equalToSuperview().multipliedBy(0.25)
        }
        
        
        let mainVStackView = UIStackView(arrangedSubviews: [view1])
        mainVStackView.axis = .vertical
        mainVStackView.spacing = 10
        view.addSubview(mainVStackView)
        mainVStackView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.centerX.equalToSuperview()

        }
        
        
    }
    


}
