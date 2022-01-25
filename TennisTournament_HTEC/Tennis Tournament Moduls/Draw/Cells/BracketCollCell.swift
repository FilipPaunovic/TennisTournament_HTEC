//
//  BracketCollCell.swift
//  TennisTournament_HTEC
//
//  Created by Filip Paunovic on 21.1.22..
//

import UIKit

class BracketCollCell: UICollectionViewCell {
    
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var lblLevel: UILabel!
    
    func setTableFrame(yCordinate: CGFloat) {
        var frame = tblView.frame
        if((tblView.tag - 1) >= 0) {
            frame.origin.y = yCordinate
        }
        tblView.frame = frame
    }
}
