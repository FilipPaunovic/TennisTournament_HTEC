//
//  DrawVM.swift
//  TennisTournament_HTEC
//
//  Created by Filip Paunovic on 21.1.22..
//

import Foundation


class DrawVM {
    var roundsArray = [[Match]]()
    var arrSeparatorSize = [Int]()
    var cellWidth = 0
    var cellHeight = 90
    var cellsGap = 0
    var levelHeight = 70
    
    weak var coordinator : DrawCoordinator?
    
    private var playersPreparationWorker = PlayersForDrawPreparationWorker()
    
    required init(playersForDraw: [Player]) {
        self.roundsArray = playersPreparationWorker.getMatches(playerList: playersForDraw)
    }
    
    func getCellSizes() {
        for i in 0..<roundsArray.count {
            if i > 0   {
                var val = 0
                for x in arrSeparatorSize {
                    val += x
                }
                arrSeparatorSize.append(val + (cellHeight * i))
            } else {
                arrSeparatorSize.append(0)
            }
        }
    }
    
    func setViewInScrollWidth() -> Int {
        return Int(cellWidth + cellsGap) * roundsArray.count
    }
    
    func setViewInScrollHeight() -> Int {
        return Int(((cellHeight + arrSeparatorSize[0]) * roundsArray[0].count) + levelHeight)
    }
    
    func numberOfTableRows(matchIndex: Int) -> Int {
        return roundsArray[matchIndex].count
    }
    
    func numberOfItems() -> Int {
        return roundsArray.count
    }
    
    func closeDrawVC() {
        coordinator?.didFinishDrawVC()
    }
}
