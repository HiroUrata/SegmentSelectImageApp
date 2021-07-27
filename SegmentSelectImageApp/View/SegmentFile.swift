//
//  SegmentFile.swift
//  SegmentSelectImageApp
//
//  Created by UrataHiroki on 2021/07/27.
//

import Foundation
import UIKit




class SegmentFile{
    
    let alamofireModel = AlamofireModel()
    let uiSegmentetControl = UISegmentedControl()
    let segmentContentsArray = ["Cat","Dog","Bear","Sea","Mountain"]
    
}

extension SegmentFile{
    
    func createSegmentControl(targetView:UIView){
        
        for count in 0...segmentContentsArray.count - 1{
                
                    uiSegmentetControl.insertSegment(withTitle: segmentContentsArray[count], at: count, animated: true)
                    
                }
        
        //uiSegmentetControl.addTarget(self, action: #selector(displayImage), for: .valueChanged)
        
        uiSegmentetControl.frame = CGRect(x: targetView.bounds.minX, y: targetView.bounds.minY, width: targetView.frame.size.width, height: targetView.frame.size.height)
        
        uiSegmentetControl.backgroundColor = UIColor.white
        uiSegmentetControl.selectedSegmentTintColor = UIColor.systemGreen
        
        targetView.addSubview(uiSegmentetControl)
        
    }

}


