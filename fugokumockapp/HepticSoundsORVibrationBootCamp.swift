//
//  HepticSoundsORVibrationBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 03/08/2023.
//

import SwiftUI

class HepticManager {
    static let instance = HepticManager() // singleton
    
    func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}

struct HepticSoundsORVibrationBootCamp: View {
    var body: some View {
        VStack(spacing: 15) {
            Button("success") { HepticManager.instance.notification(type: .success) }
            Button("warning") { HepticManager.instance.notification(type: .warning) }
            Button("success") { HepticManager.instance.notification(type: .error) }
            Divider()
            Button("heavy") { HepticManager.instance.impact(style: .heavy) }
            Button("rigid") { HepticManager.instance.impact(style: .rigid) }
            Button("medium") { HepticManager.instance.impact(style: .medium) }
            Button("light") { HepticManager.instance.impact(style: .light) }
            Button("soft") { HepticManager.instance.impact(style: .soft) }
            
        }
        
    }
}

struct HepticSoundsORVibrationBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        HepticSoundsORVibrationBootCamp()
    }
}
