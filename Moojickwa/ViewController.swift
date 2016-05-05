//
//  ViewController.swift
//  Moojickwa
//
//  Created by Chatterjee, Snigdhaman on 09/01/16.
//  Copyright © 2016 Chatterjee, Snigdhaman. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player: AVAudioPlayer = AVAudioPlayer()
    
    @IBOutlet weak var sliderOutlet: UISlider!
    
    @IBOutlet weak var scrubOutlet: UISlider!
    
    
    @IBAction func play(sender: AnyObject) {
        
        player.play()
        
    }
    
    @IBAction func scrubAction(sender: AnyObject) {
        
        player.currentTime = NSTimeInterval(scrubOutlet.value)
        
    }
    
    @IBAction func pause(sender: AnyObject) {
        
        player.pause()
        
    }
    @IBAction func sliderAction(sender: AnyObject) {
        
        player.volume = sliderOutlet.value
        
    }
    
    @IBAction func stop(sender: AnyObject) {
        
        player.pause()
        initialise()
        
    }
    
    func initialise() {
    
        if let filePath = NSBundle.mainBundle().pathForResource("bach-bwv651-breemer", ofType: "mp3") {
            
            do {
                
                try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: filePath))
                
                player.volume = sliderOutlet.value
                scrubOutlet.maximumValue = Float(player.duration)
                scrubOutlet.value = 0
                
            } catch {
                
                print("Error")
                
            }
            
        }
    
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        initialise()
        _ = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("updateSlider"), userInfo: nil, repeats: true)
        
    }
    
    func updateSlider () {
        
        scrubOutlet.value = Float(player.currentTime)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

