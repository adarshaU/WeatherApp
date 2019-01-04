//
//  BindingUITextField.swift
//  Goodwrather
//
//  Created by Adarsha Upadhya on 04/01/19.
//  Copyright © 2019 Adarsha Upadhya. All rights reserved.
//

import UIKit

class BindingUITextField: UITextField {

    var textChangeClosure:(String)->() = {_ in }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    private func commonInit(){
        self.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    func bind(callback:@escaping (String)->()){
        self.textChangeClosure = callback
    }
    
    @objc func textFieldDidChange(_ textField:UITextField){
        if let text = textField.text{
            self.textChangeClosure(text)
        }
    }
    
}
