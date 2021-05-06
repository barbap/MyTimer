//
//  ContentView.swift
//  Shared
//
//  Created by Bárbara Araújo Paim  on 06/05/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var timerManager = TimerManager()
    @State var timerMode: TimerMode = .initial
    @State var selectedPickerIndex = 0
    let avaiableMinutes = Array(1...59)
    var body: some View {
        NavigationView {
            VStack {
                Text(secondsToMinutesAndSeconds(seconds: timerManager.secondsLeft))
                    .font(.system(size: 80))
                    .padding(.top, 80)
                Image(systemName: timerManager.timerMode == .running ?
                    "pause.circle.fill" : "play.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180, height: 180)
                    .foregroundColor(.orange)
                    .onTapGesture (perform: {
                        if timerManager.timerMode == .initial {
                            timerManager.setTimerLength(minutes: avaiableMinutes[selectedPickerIndex]*60)
                        }
                        timerManager.timerMode == .running ? timerManager.pause() : timerManager.start()
                    })
                if timerManager.timerMode == .paused {
                    Image(systemName: "gobackward")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                        .padding(.top, 40)
                        .onTapGesture (perform: {
                            timerManager.reset()
                        })
                }
                if timerManager.timerMode == .initial {
                    Picker(selection: $selectedPickerIndex, label: Text(""), content: {
                        ForEach(0 ..< avaiableMinutes.count) {
                            Text("\(avaiableMinutes[$0]) min")
                        }
                    })
                }
                Spacer()
            }
            .navigationTitle(Text("My Timer"))
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(timerManager: TimerManager())
    }
}
