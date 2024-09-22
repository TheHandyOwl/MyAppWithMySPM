//
//  MyAppWithMySPMApp.swift
//  MyAppWithMySPM
//
//  Created by Carlos Company on 22/9/24.
//

import SwiftUI

@main
struct MyAppWithMySPMApp: App {
    
    let greetingsVM = GreetingsVM()
    
    var body: some Scene {
        WindowGroup {
            GreetingsView()
                .environment(greetingsVM)
        }
    }
}
