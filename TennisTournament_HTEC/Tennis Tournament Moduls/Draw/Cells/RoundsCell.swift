//
//  RoundsCell.swift
//  TennisTournament_HTEC
//
//  Created by Filip Paunovic on 21.1.22..
//

import UIKit

class RoundsCell: UITableViewCell {

    @IBOutlet weak var separatorHeight: NSLayoutConstraint!
    @IBOutlet weak var oddLine: UIView!
    @IBOutlet weak var evenLine: UIView!
    @IBOutlet weak var leadingLine: UIView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var viewSeparator: UIView!
    @IBOutlet weak var player1Label: UILabel!
    @IBOutlet weak var player2Label: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var matchInfoBtn: UIButton!
    @IBOutlet weak var lineBeetwinPlayers: UIView!
    @IBOutlet weak var scoreFirst: UILabel!
    @IBOutlet weak var scoreSecond: UILabel!
    @IBOutlet weak var firstWView: UIView!
    @IBOutlet weak var secondWView: UIView!
    
    override func awakeFromNib() {
        
    }
    
    func setUpCellView(tag:Int, row:Int, count:Int) {
        
        if tag < count {
            evenLine.isHidden = row % 2 != 0
            oddLine.isHidden = row % 2 == 0
        } else {
            evenLine.isHidden = true
            oddLine.isHidden = true
        }
        
        leadingLine.isHidden = tag == 0
       
        mainView.layer.borderColor = UIColor.lightGray.cgColor
        mainView.layer.borderWidth = 1.5
        matchInfoBtn.layer.cornerRadius = matchInfoBtn.bounds.width*0.5
        matchInfoBtn.layer.borderWidth = 2
        matchInfoBtn.layer.borderColor = UIColor.red.cgColor
    }
}
