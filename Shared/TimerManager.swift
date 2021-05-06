//
//  TimerManager.swift
//  TimerEx1
//
//  Created by Bárbara Araújo Paim  on 06/05/21.
//

import SwiftUI

class TimerManager: ObservableObject {
    @Published var timerMode: TimerMode = .initial
    
    @Published var secondsLeft = UserDefaults.standard.integer(forKey: "timerLength")
    
    var timer = Timer()
    
    func start() {
        timerMode = .running
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { timer in
            if self.secondsLeft==0 {
                self.reset()
            } else {
                self.secondsLeft -= 1
            }
        })
    }
    func reset() {
        self.timerMode = .initial
        self.secondsLeft = UserDefaults.standard.integer(forKey: "timerLength")
        timer.invalidate()
    }
    func pause () {
        self.timerMode = .paused
        timer.invalidate()
        
    }
    func setTimerLength (minutes: Int){
        let defaults =  UserDefaults.standard
        defaults.setValue(minutes, forKey: "timerLength")
        secondsLeft = minutes
    }
}
