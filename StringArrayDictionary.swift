//
//  StringArrayDictionary.swift
//
//  Created by Dario Pizzuto on 17/01/16.
//  Copyright © 2016 Dario Pizzuto. All rights reserved.
//

import UIKit

class StringArrayDictionary: NSObject {

    typealias StringArrayDictionary = [String : [String]]
    
    var stringArrayDictionary = StringArrayDictionary()
    
    override init() {
        stringArrayDictionary = [:]
    }
    
    init(dictionary : StringArrayDictionary) {
        stringArrayDictionary = dictionary
    }
    
    // MARK: - Util
    
    func count() -> Int {
        return stringArrayDictionary.count
    }
    
    func getKeys() -> [String] {
        return Array(stringArrayDictionary.keys)
    }
    
    func getvalueWithKeyAndIndex(keyIndex : Int, elementIndex : Int) -> String {
        let values : [String] = getValuesFromKey(keyIndex)
        return values[elementIndex]
    }
    
    func getValuesFromKey(keyIndex : Int) -> [String] {
        let key = getKeyFromIndex(keyIndex)
        let values = stringArrayDictionary[key]!
        return values
    }
    
    func getKeyFromIndex(keyIndex : Int) -> String {
        let key = Array(stringArrayDictionary.keys)[keyIndex]
        return key
    }
}
