//
//  TimerEx1App.swift
//  Shared
//
//  Created by Bárbara Araújo Paim  on 06/05/21.
//

import SwiftUI

@main
struct TimerEx1App: App {
    
    
    @ObservedObject var timerManager = TimerManager()
    var body: some Scene {
        WindowGroup {
            ContentView(timerManager: timerManager)
        }
    }
}
