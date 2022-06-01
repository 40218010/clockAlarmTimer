//
//  TagViewController.swift
//  clockApp
//
//  Created by 林大屍 on 2022/4/27.
//

import UIKit

protocol AlarmTagManagerDelegate: AnyObject {
    func didUpdateAlarmTag(_ tagText: String)
}

class TagViewController: UIViewController {
    
    weak var delegate: AlarmTagManagerDelegate?
    var alarmTag: String = "" {
        didSet {
            delegate?.didUpdateAlarmTag(alarmTag)
        }
    }
    
    
    let textField: UITextField = {
        let mytextField = TextFieldWithPadding()
        mytextField.text = "鬧鐘"
        mytextField.borderStyle = .roundedRect
        mytextField.backgroundColor = .secondarySystemFill
        mytextField.clearButtonMode = .always
        return mytextField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemGroupedBackground
        textField.text = alarmTag
        setUpView()
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        if let text = textField.text {
            if text != "" {
                alarmTag = text
            } else {
                alarmTag = "鬧鐘"
            }
        }
    }
    
    func setUpView() {
        view.addSubview(textField)
        textField.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalToSuperview().offset(-32)
        }
    }
}


class TextFieldWithPadding: UITextField {
    var textPadding = UIEdgeInsets(
        top: 8,
        left: 5,
        bottom: 8,
        right: 5
    )
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
}
