//
//  Utils.swift
//  TennisTournament_HTEC
//
//  Created by Filip Paunovic on 20.1.22..
//

import Foundation
import UIKit


class Utils {

    class func delay(_ delay:Double, closure:@escaping ()->()) {
         DispatchQueue.main.asyncAfter(
             deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
    }
    
    class func executeOnMainThread(_ closure:@escaping ()->()) {
         OperationQueue.main.addOperation(closure)
     }

}
