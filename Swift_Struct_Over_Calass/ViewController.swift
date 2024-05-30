//
//  ViewController.swift
//  Swift_Struct_Over_Calass
//
//  Created by rajasekhar pidikiti on 28/05/24.
//

import UIKit

// Using reference counting with a large class
class LargeClass {
    var data: [Int]

    init(data: [Int]) {
        self.data = data
    }
}

struct LargeStruct {
    var data: [Int]

    init(data: [Int]) {
        self.data = data
    }
}

class ViewController: UIViewController {

    var startTimeRefCounting: Date?
    var endTimeRefCounting: Date?
    var startTimeValueType: Date?
    var endTimeValueType: Date?
    
    fileprivate func class_Modification_Time_Caluclation() {
        // Do any additional setup after loading the view.
        
        var largeClass1 = LargeClass(data: Array(repeating: 0, count: 1_000_000))
        var largeClass2 = largeClass1
        
        startTimeRefCounting = Date()
        
        // Modify largeClass2, affecting the original largeClass1
        largeClass2.data[0] = 42
        
       endTimeRefCounting = Date()
        
        if let endTimeRefCounting = endTimeRefCounting, let startTimeRefCounting = startTimeRefCounting {
            print("Time taken for reference counting: \(endTimeRefCounting.timeIntervalSince(startTimeRefCounting)) seconds")
        }
       
    }
    
    fileprivate func time_Differenc_Bitween_Class_Strict_Modification() {
        
        if let endTimeValueType = endTimeValueType, let startTimeValueType = startTimeValueType ,  let endTimeRefCounting = endTimeRefCounting, let startTimeRefCounting = startTimeRefCounting {
            let timeDifference = endTimeValueType.timeIntervalSince(startTimeValueType) - endTimeRefCounting.timeIntervalSince(startTimeRefCounting)
            print("Time difference between CoW and reference counting: \(timeDifference) seconds")
        }
    }
//    
    fileprivate func struct_Modification_Time_Caluclation() {
        var largeStruct1 = LargeStruct(data: Array(repeating: 0, count: 1_000_000))
        var largeStruct2 = largeStruct1
        
        startTimeValueType = Date()
        
        // Modify largeClass2, affecting the original largeClass1
        largeStruct2.data[0] = 42
        
        endTimeValueType = Date()
        
        if let endTimeValueType = endTimeValueType, let startTimeValueType = startTimeValueType {
            print("Time taken for Value type counting: \(endTimeValueType.timeIntervalSince(startTimeValueType)) seconds")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        class_Modification_Time_Caluclation()
        
        struct_Modification_Time_Caluclation()

        time_Differenc_Bitween_Class_Strict_Modification()
    }


}

