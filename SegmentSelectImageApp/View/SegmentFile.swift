//
//  SegmentFile.swift
//  SegmentSelectImageApp
//
//  Created by UrataHiroki on 2021/07/27.
//

import Foundation
import UIKit

class SegmentFile{
    
    let uiSegmentetControl = UISegmentedControl()
    let segmentContentsArray = ["Cat","Dog","Bear","Sea","Mountain"]
    
}

extension SegmentFile{
    
    func createSegmentControl(targetView:UIView){
        
        for count in 0...segmentContentsArray.count - 1{
                
                    uiSegmentetControl.insertSegment(withTitle: segmentContentsArray[count], at: count, animated: true)
                    
                }
        
        uiSegmentetControl.selectedSegmentTintColor = UIColor.gray
        
        targetView.addSubview(uiSegmentetControl)
        
    }
    
}

