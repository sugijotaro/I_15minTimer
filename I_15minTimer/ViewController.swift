//
//  ViewController.swift
//  I_15minTimer
//
//  Created by Jotaro Sugiyama on 2024/03/26.
//

import UIKit

class ViewController: UIViewController {
    
    var timer: Timer!
    var countdown: Int = 0
    
    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        timerStart()
    }
    
    @objc func onTimerCalled() {
        let remainingMinutes: Int = countdown / 60
        let remainingSeconds: Int = countdown % 60
        
        label.text = String(format: "%02d:%02d", remainingMinutes, remainingSeconds)
        
        countdown -= 1
        
        if countdown < 0 {
            timer.invalidate()
            self.performSegue(withIdentifier: "showRenda", sender: nil)
        }
    }
    
    @IBAction func timerStart() {
        timer?.invalidate()

        countdown = 900
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onTimerCalled), userInfo: nil, repeats: true)
        timer.fire()
        
        let content = UNMutableNotificationContent()
        content.title = "Reminder"
        content.body = "水飲んでないよね！？"
        content.sound = UNNotificationSound.default

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(countdown), repeats: false)

        let request = UNNotificationRequest(identifier: "waterReminder", content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request) { (error) in
            if let error = error {
                print("Error \(error.localizedDescription)")
            }
        }
    }
}
