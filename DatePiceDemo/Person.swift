//
//  Person.swift
//  DatePiceDemo
//
//  Created by zxl on 15/7/25.
//  Copyright (c) 2015年 Mrj. All rights reserved.
//

import UIKit

class Person: NSObject {
    
    var name: String?
    
    var age: Int?
    
    var sex: String?
    
    var content: String?
    
    /// init方法获得相关值
    init(name: String, age: Int, sex: String, content: String) {
        self.name = name
        self.age = age
        self.sex = sex
        self.content = content
    }
}
