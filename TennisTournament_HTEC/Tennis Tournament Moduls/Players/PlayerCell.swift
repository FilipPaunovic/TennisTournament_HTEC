//
//  PlayerCell.swift
//  TennisTournament_HTEC
//
//  Created by Filip Paunovic on 21.1.22..
//

import UIKit

class PlayerCell: UITableViewCell {

    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numOfPointsLabel: UILabel!
    @IBOutlet weak var mainView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
       setUpCellUI()
    }

    func setUpCellUI() {
        rankLabel.layer.cornerRadius = 15
        rankLabel.layer.masksToBounds = true
        mainView.layer.cornerRadius = 15
    }
    
    func setUpCellWith(player: Player,rank: String) {
        nameLabel.text = "\(player.firstName ?? "") \(player.lastName ?? "")"
        rankLabel.text = "\(rank)."
        numOfPointsLabel.text = "\(player.points)"
    }
}
