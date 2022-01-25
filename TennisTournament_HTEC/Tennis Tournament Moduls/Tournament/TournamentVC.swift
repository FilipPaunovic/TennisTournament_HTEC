//
//  TournamentVC.swift
//  TennisTournament_HTEC
//
//  Created by Filip Paunovic on 20.1.22..
//

import UIKit

class TournamentVC: UIViewController {

    @IBOutlet weak var tournamentBtn: UIButton!
    
    var vm: TournamentVM!
    
    class func instance() -> TournamentVC {
        let storyboard = UIStoryboard(name: "Tournament", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "TournamentVC") as! TournamentVC
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    func setUpView() {
        tournamentBtn.layer.cornerRadius = 15
        tournamentBtn.layer.borderColor = UIColor.cyan.cgColor
        tournamentBtn.layer.borderWidth = 0.5
        tournamentBtn.backgroundColor = .black
    }
   
    @IBAction func onTournamentBtnTap(_ sender: Any) {
        vm.goToPlayersPage()
    }
}
