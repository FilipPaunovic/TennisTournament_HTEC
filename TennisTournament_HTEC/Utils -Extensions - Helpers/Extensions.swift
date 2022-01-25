//
//  Extensions.swift
//  TennisTournament_HTEC
//
//  Created by Filip Paunovic on 20.1.22..
//

import Foundation
import UIKit
import SwiftUI

extension UIViewController {
    func showAlert( _ message: String ) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alert.addAction( UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        //alert.setValue(NSAttributedString(string: alert.message!, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14,weight: UIFont.Weight.medium),NSAttributedString.Key.foregroundColor :UIColor.white]), forKey: "attributedMessage")
        alert.view.tintColor = .systemPink
        //alert.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = UIColor.darkText
        Utils.executeOnMainThread {
            self.present(alert, animated: true, completion: nil)
        }
       
    }
}

extension Array {
    func devided() -> ([Element], [Element]) {
        let half = count / 2 + count % 2
        let head = self[0..<half]
        let tail = self[half..<count]

        return (Array(head), Array(tail))
    }
    
    func shuffledRandom() -> [Element] {
        var results = [Element]()
        var indexes = (0 ..< count).map { $0 }
        while indexes.count > 0 {
            let indexOfIndexes = Int(arc4random_uniform(UInt32(indexes.count)))
            let index = indexes[indexOfIndexes]
            results.append(self[index])
            indexes.remove(at: indexOfIndexes)
        }
        return results
    }
}


extension Color {
    public static var backgroundColor: Color {
            return Color(UIColor(red: 33/255, green: 33/255, blue: 33/255, alpha: 1.0))
        }
}
    
