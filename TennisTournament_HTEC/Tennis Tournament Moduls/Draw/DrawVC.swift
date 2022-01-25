//
//  DrawVC.swift
//  TennisTournament_HTEC
//
//  Created by Filip Paunovic on 21.1.22..
//

import UIKit

class DrawVC: UIViewController {

    @IBOutlet weak var viewInScrollHeight: NSLayoutConstraint!
    @IBOutlet weak var viewInScrollWidth: NSLayoutConstraint!
    @IBOutlet weak var collView: UICollectionView!
    @IBOutlet weak var scrollView1: UIScrollView!
    @IBOutlet weak var topView: UIView!

    
    class func instance() -> DrawVC {
        let storyboard = UIStoryboard(name: "Draw", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "DrawVC") as! DrawVC
    }

    var vm: DrawVM!
    let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
    var blurEffectView = UIVisualEffectView()
    var didScrollToPsition = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vm.getCellSizes()
        collView.reloadData()
        vm.cellWidth = Int(view.frame.width / 1.2)
        collView.delegate = self
        collView.dataSource = self
        scrollView1.delegate = self
        
        setZoomScale(min: 0.3, max: 1.0)
    }
    
    func setZoomScale(min:Double, max:Double) {
        scrollView1.maximumZoomScale = max
        scrollView1.minimumZoomScale = min
    }

    @IBAction func onBackBtnAction(_ sender: Any) {
        self.dismiss(animated: true, completion: {
            self.vm.closeDrawVC()
        })
    }
}

extension DrawVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if vm.roundsArray.count > 0 {
            viewInScrollHeight.constant = CGFloat(vm.setViewInScrollHeight())
            viewInScrollWidth.constant = CGFloat(vm.setViewInScrollWidth())
        }
        return vm.numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! BracketCollCell
        cell.tblView.delegate = self
        cell.tblView.dataSource = self
        cell.tblView.tableFooterView = UIView()
        cell.tblView.tag = indexPath.row
        cell.lblLevel.text = "Round \(indexPath.row+1)"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: CGFloat(vm.cellWidth), height: viewInScrollHeight.constant + CGFloat(vm.levelHeight))
    }
}

extension DrawVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var frame = tableView.frame // ovo jedino radi ovde i ako mu definitivno nije mesto tu, layout je lose uradjen i constrainti pucaju u debageru(konzoli), resenje je da se ceo(ili veci deo) napise u kodu i tad ne bi pucalo(jer ne bi dolazilo do konflikta izmedju vrednosti u storyboard-u i kodu) i ovo bi moglo da se smesti kod inicijalizacije tablele u collectionview celiji gde mu je i mesto.
        if((tableView.tag - 1) >= 0) {
            frame.origin.y = CGFloat(((vm.cellHeight / 2) + vm.arrSeparatorSize[tableView.tag - 1]) + vm.levelHeight)
        }
        tableView.frame = frame
        return vm.numberOfTableRows(matchIndex: tableView.tag)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! RoundsCell
        cell.selectionStyle = .none
        cell.separatorHeight.constant = CGFloat(vm.arrSeparatorSize[tableView.tag]+10)
        cell.setUpCellView(tag: tableView.tag, row: indexPath.row, count: vm.roundsArray.count-1)

        cell.player1Label.text = vm.roundsArray[tableView.tag][indexPath.row].firstPlayer.firstName
        cell.player2Label.text = vm.roundsArray[tableView.tag][indexPath.row].secondPlayer.firstName

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(vm.cellHeight + vm.arrSeparatorSize[tableView.tag])
    }
}

extension DrawVC: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return scrollView.subviews[0]
    }
}

