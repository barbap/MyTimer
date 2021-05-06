//
//  Helper.swift
//  TimerEx1
//
//  Created by Bárbara Araújo Paim  on 06/05/21.
//

import Foundation

enum TimerMode {
    case running
    case paused
    case initial
}

func secondsToMinutesAndSeconds (seconds: Int) -> String {
    let minutes = "\((seconds % 3600)/60)"
    let seconds = "\((seconds % 3600)%60)"
    let minuteStamp = minutes.count > 1 ? minutes : "0" + minutes
    let secondStamp = minutes.count > 1 ? minutes :  seconds
    
    return "\(minuteStamp):\(secondStamp)"
}
