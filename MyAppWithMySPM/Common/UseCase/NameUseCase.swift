//
//  NameUseCase.swift
//  MyAppWithMySPM
//
//  Created by Carlos Company on 22/9/24.
//

import Foundation
import MySPM

final class NameUseCase {
    
    let mySPM: MySPM
    
    init(mySPM: MySPM = MySPM()) {
        self.mySPM = mySPM
    }
    
    func getHelloName(_ name: String) -> String {
        self.mySPM.getHelloName(name: name)
    }
}
