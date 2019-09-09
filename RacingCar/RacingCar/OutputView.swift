//
//  OutputView.swift
//  RacingCar
//
//  Created by temphee.Reid on 06/09/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation



struct OutputView {
    static func printRacingResult(carRacing : CarRacing) -> Void {
        print(carRacing.getRacingResult())
    }
    
    static func printError(errorMessage : String) -> Void {
        print(errorMessage)
    }
}
