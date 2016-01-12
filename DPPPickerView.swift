//
//  DPPPickerView.swift
//
//  Created by Dario Pizzuto on 10/01/16.
//  Copyright DPPPickerView© 2016 Dario Pizzuto. All rights reserved.
//

import UIKit

class DPPPickerView: UIPickerView, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var titles : [String]
    dynamic var titleSelected : String?
    var selected : ((title : String) -> Void)?
    
    required init?(coder aDecoder: NSCoder) {
        titles = [""]
        super.init(coder: aDecoder)
    }
    
    init(){
        self.titles = [""]
        super.init(frame: CGRectZero)
        self.delegate = self
        self.dataSource = self

    }
    
    init(titlesForRow : [String]){
        self.titles = titlesForRow
        super.init(frame: CGRectZero)
        self.delegate = self
        self.dataSource = self
        
    }
    
    
    // MARK: - Delegate / DataSource
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return titles.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return titles[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        titleSelected = titles[selectedRowInComponent(component)]
        print(titleSelected)
        
        if let block = selected{
            block(title: titleSelected!)
        }
    }
    
}
