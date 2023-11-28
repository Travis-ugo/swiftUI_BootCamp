//
//  SoundEffectBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 02/08/2023.
//

import SwiftUI
import AVKit

class SoundManager {
    static let instance = SoundManager()
    
    var player: AVAudioPlayer?
    
    enum SoundOption: String {
        case alien = "alien girl"
        case massacre
    }
    
    func playSound(sound: SoundOption) {
        
//        guard let url = URL(string: "") else { return }
        
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp4") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("Error playing sound \(error.localizedDescription)")
        }
    }
}

struct SoundEffectBootCamp: View {
    
    var body: some View {
        VStack(spacing: 10) {
            Button("Play sound one"){
                SoundManager.instance.playSound(sound: .alien)
            }
            Button("Play sound one"){
                SoundManager.instance.playSound(sound: .massacre)
            }
        }
    }
}

struct SoundEffectBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        SoundEffectBootCamp()
    }
}
