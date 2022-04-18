//
//  ViewModel.swift
//  RemindMe
//
//  Created by Mohammed Alsaleh on 16/09/1443 AH.
//

import Combine
import UserNotifications


class VM: ObservableObject {
    
    func SendNotifcations(title:String,subtitle:String,sound:UNNotificationSound,date:Date?) {
        if date != nil {
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day,.hour, .minute], from: date!)
        let content = UNMutableNotificationContent()
        content.title = title
        content.subtitle = subtitle
        content.sound = sound
        let trigger =  UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
        } else {
            let content = UNMutableNotificationContent()
            content.title = title
            content.subtitle = subtitle
            content.sound = sound
            let trigger =  UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            UNUserNotificationCenter.current().add(request)
        }
    }
}
