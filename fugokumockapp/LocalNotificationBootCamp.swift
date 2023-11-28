//
//  LocalNotificationBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 03/08/2023.
//

import SwiftUI
import CoreLocation

class NotificationManager {
    static let instance = NotificationManager()
    
    func requestAuthorization() {
        let option: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: option) {
            (succeaa, error) in
            if let error =  error {
                print("ERROR: \(error)")
            } else {
                print("SUCCESS")
            }
        }
    }
    
    func scheduleNotification() {
        let content = UNMutableNotificationContent()
       
        content.title = "New Message"
        content.body = "You've received a new message from the Alien Girl!"
        content.sound = .criticalSoundNamed(UNNotificationSoundName("alien_girl"))
        content.badge = 8
        
//        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
        
//        var dateComponent = DateComponents()
//        dateComponent.hour = 16
//        dateComponent.minute = 27
//        dateComponent.weekday = 5
//        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)
        
        let coordinate = CLLocationCoordinate2D(
            latitude: 40,
            longitude: 50
        )
        let region = CLCircularRegion(
            center: coordinate,
            radius: 100,
            identifier: UUID().uuidString
        )
        
        region.notifyOnExit = true
        region.notifyOnEntry = true
        
        let trigger = UNLocationNotificationTrigger(region: region, repeats: false)
        
        let request = UNNotificationRequest (
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
    
    func cancelNotification() {
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
    }
    
}

struct LocalNotificationBootCamp: View {
    var body: some View {
        VStack(spacing: 20) {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            Button("Request permision") {
                NotificationManager.instance.requestAuthorization()
            }
            Button("Sound Trigger") {
                NotificationManager.instance.scheduleNotification()
            }
            Button("Cancel Notification") {
                NotificationManager.instance.cancelNotification()
            }
           
        }
        .font(.headline)
        .onAppear {
            UIApplication.shared.applicationIconBadgeNumber = 0
        }
    }
}

struct LocalNotificationBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        LocalNotificationBootCamp()
    }
}
