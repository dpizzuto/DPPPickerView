//
//  DPPPickerView.swift
//
//  Created by Dario Pizzuto on 10/01/16.
//  Copyright DPPPickerView© 2016 Dario Pizzuto. All rights reserved.
//

import UIKit

class DPPPickerView: UIPickerView, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var titles = StringArrayDictionary()
    var index : Int
    var showLabelForRow : Bool
    dynamic var titleSelected : String?
    var selected : ((title : String) -> Void)?
    
    required init?(coder aDecoder: NSCoder) {
        titles = StringArrayDictionary()
        index = -1
        showLabelForRow = false
        super.init(coder: aDecoder)
    }
    
    init(){
        self.titles = StringArrayDictionary()
        self.index = 0
        showLabelForRow = false
        super.init(frame: CGRectZero)
        self.delegate = self
        self.dataSource = self

    }
    
    init(titlesForRow : StringArrayDictionary, showLabel : Bool ){
        self.titles = titlesForRow
        self.index = 0
        showLabelForRow = showLabel
        super.init(frame: CGRectZero)
        self.delegate = self
        self.dataSource = self
        
    }
    
    
    // MARK: - Delegate / DataSource
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return titles.count()
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return titles.getValuesFromKey(component).count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return titles.getvalueWithKeyAndIndex(component, elementIndex: row)
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        var text = ""
        var index = 0
        
        if titles.count() > 1 {
            for key in titles.getKeys() {
                let rowInComponent = selectedRowInComponent(index)
                let values : [String] = titles.getValuesFromKey(index)
                index++
                
                if showLabelForRow{
                    text += (key + ": " + values[rowInComponent] )
                }
                else{
                    text += (values[rowInComponent] + " ")
                }
                
                if index < titles.count() {
                    text += " - "
                }
            }
            titleSelected = text
        }
        else{
            let key = titles.getKeyFromIndex(0)
            let value = titles.getvalueWithKeyAndIndex(0, elementIndex: row)
            
            if showLabelForRow{
                text += (key + ": " + value )
            }
            else{
                text = value
            }
            
            titleSelected = text
        }
        
//        print(text)
        
        if let block = selected{
            block(title: titleSelected!)
        }
    }

}
