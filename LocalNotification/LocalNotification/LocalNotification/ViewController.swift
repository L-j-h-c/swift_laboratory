//
//  ViewController.swift
//  LocalNotification
//
//  Created by Junho Lee on 2022/06/01.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .green
        addCalendarNoti()
//        removeCalendarNoti()
    }


    private func addCalendarNoti() {
        
        let calendar = Calendar.current
        let newDate = calendar.date(byAdding: DateComponents(second: 5), to: .now)
        let components = calendar.dateComponents([.hour, .minute, .second], from: newDate!)
        UNUserNotificationCenter.current().addNotificationRequest(by: components, id: UUID().uuidString)
    }
    
    private func removeCalendarNoti() {
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
}

