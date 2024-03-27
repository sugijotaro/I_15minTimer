//
//  RendaViewController.swift
//  I_15minTimer
//
//  Created by Jotaro Sugiyama on 2024/03/26.
//

import UIKit
import AVFoundation

class RendaViewController: UIViewController {
    
    var number: Int = 500
    @IBOutlet var label: UILabel!
    
    let SoundPlayer = try!AVAudioPlayer(data: NSDataAsset(name: "urusai")!.data)
    let SoundPlayer2 = try!AVAudioPlayer(data: NSDataAsset(name: "iphone_radar")!.data)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var ransu = Int.random(in: 0...1)
        
        if ransu == 0 {
            SoundPlayer.currentTime = 0
            SoundPlayer.play()
        }else{
            SoundPlayer2.currentTime = 0
            SoundPlayer2.play()
        }
    }
    
    @IBAction func plus(){
        number -= 1
        label.text = String(number)
        
        if number == 0 {
            SoundPlayer.stop()
            SoundPlayer2.stop()
            self.dismiss(animated: true, completion: nil)
        }
    }
}
