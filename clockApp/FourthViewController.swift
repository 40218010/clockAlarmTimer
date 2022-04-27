//
//  FourthViewController.swift
//  clockApp
//
//  Created by 林大屍 on 2022/4/18.
//

import UIKit

class FourthViewController: UIViewController {
    
    let textField: UITextField = {
       let mytextField = UITextField()
        mytextField.text = "鬧鐘"
        mytextField.backgroundColor = .secondarySystemFill
        mytextField.borderStyle = .roundedRect
        return mytextField
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
        view.backgroundColor = .black
        navigationItem.title = ""
    }
    
    func setUpView() {
        view.addSubview(textField)
        textField.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalToSuperview().offset(-32)
        }
    }
    
    
    
    
    
}
