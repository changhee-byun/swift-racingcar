//
//  CarRacing.swift
//  RacingCar
//
//  Created by temphee.Reid on 06/09/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct CarRacing {
    private(set) var racingCars : Array<Car>!
    private(set) var racingResultsString : String
    
    init(numberOfCars : Int) {
        self.init(carNames: [String](repeating: "None", count: numberOfCars))
    }
    
    init(carNames : [String]) {
        self.racingCars = []
        for carName in carNames {
            self.racingCars.append(Car(name: carName))
        }
        racingResultsString = ""
    }
    
    mutating func runRacing(times : Int) {
        self.resetResult()
        
        for _ in 1...times {
            self.moveRacingCars()
            //self.racingResultsString.append("race \(count).\r\n")
            self.racingResultsString.append("\(self.getMoveResult())\r\n")
        }
        
        self.racingResultsString.append("\(self.getWinnerResult(racedCars: racingCars))\r\n")
    }
    
    private mutating func moveRacingCars() {
        for carIndex in 0..<racingCars.count {
            racingCars[carIndex].tryToMoveForward()
        }
    }
    
    private func getMoveResult() -> String {
        var resultString : String = ""
        for car in self.racingCars {
            resultString.append("\(car.getDistanceString())\r\n")
        }
        
        return resultString
    }
    
    private func getWinnerResult(racedCars: [Car]) -> String {
        guard let winners = selectFinalWinner(racedCars) else {
            return "there are no winners"
        }
        
        let winnerString = winners.joined(separator:", ")
        let resultString = winnerString + "가 최종 우승했습니다."
        
        return resultString
    }
    
    private func selectFinalWinner(_ racedCars : [Car]) -> [String]? {
        guard let maxDistance = getMaxDistance(racedCars: racedCars) else {
            return nil
        }
        let winnerCars = getWinnerCars(racedCars: racedCars, maxDistance: maxDistance)
        
        var finalWinner : [String] = []
        
        for winner in winnerCars {
            finalWinner.append(winner.name)
        }
        
        return finalWinner
    }
    
    private mutating func resetResult() {
        racingResultsString = ""
        
        for index in self.racingCars.indices {
            self.racingCars[index].resetDistance()
        }
    }
    
    func getRacingResult() -> String {
        return racingResultsString
    }
    
    func getMaxDistance(racedCars: [Car]) -> Int? {
        return racedCars.map { $0.distance }.max()
    }
    
    func getWinnerCars(racedCars:[Car], maxDistance:Int) -> [Car] {
        return racedCars.filter {$0.distance == maxDistance}
    }
    
}
