//
//  PlayersVC.swift
//  TennisTournament_HTEC
//
//  Created by Filip Paunovic on 20.1.22..
//

import UIKit

class PlayersVC: UIViewController {
    
    @IBOutlet weak var tournamentNameLabel: UILabel!
    @IBOutlet weak var drawBtn: UIButton!
    @IBOutlet weak var playersTableView: UITableView!
    @IBOutlet weak var numOfPlayersForDrawTextField: UITextField!
    
    class func instance() -> PlayersVC {
        let storyboard = UIStoryboard(name: "Players", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "PlayersVC") as! PlayersVC
    }
    
    var vm: PlayersVM!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playersTableView.register(UINib(nibName: "PlayerCell", bundle: nil), forCellReuseIdentifier: "PlayerCell")
        setUpView()
        bindVM()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        vm.closeVC()
    }
    
    func setUpView() {
        drawBtn.layer.cornerRadius = 10
    }
    
    func bindVM() {
        vm.playerList.bind { [weak self] players in
            Utils.executeOnMainThread {
                self?.playersTableView.reloadData()
            }
        }
        
        vm.error.bind { [weak self] error in
            if error != "" {
                self?.showAlert(error)
            }
        }
    }

    @IBAction func onDravBtnTap(_ sender: Any) {
        guard let text = numOfPlayersForDrawTextField.text, let numFromText = Int(text), vm.isValidatedNumberOfPlayersForDraw(num: numFromText) else {return}
        vm.startDraw(numOfPlayers: numFromText)
    }
    
   
}

extension PlayersVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = playersTableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath) as! PlayerCell
        cell.selectionStyle = .none
        cell.setUpCellWith(player: vm.getDataForCell(row: indexPath.row),rank: "\(indexPath.row+1)")
        return cell
    }
    
}
