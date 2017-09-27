//
//  ViewController.swift
//  HBDSara
//
//  Created by Simon Guo on 2017-09-27.
//  Copyright © 2017 Simon Guo. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var audioPlayer = AVAudioPlayer()

    @IBOutlet weak var BoxClosedGif: UIImageView!
    
    @IBOutlet weak var BoxOpenGif: UIImageView!
    
    @IBOutlet weak var HBDText: UITextField!
    
    @IBOutlet weak var SaraText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        BoxClosedGif.isHidden = false
        BoxOpenGif.isHidden = true
        HBDText.isHidden = true
        HBDText.font = UIFont.systemFont(ofSize: 40.0)
        SaraText.isHidden = true
        SaraText.font = UIFont.systemFont(ofSize: 50.0)
        

        
        BoxClosedGif.loadGif(name: "giftclosed")
        BoxOpenGif.loadGif(name: "giftopen")
        

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath:Bundle.main.path(forResource: "song", ofType:"mp3")!))
            audioPlayer.prepareToPlay()
            
        }catch{
            print(error)
        }
        
        
    }

    @IBAction func PlaySong(_ sender: Any) {
        audioPlayer.play()
        BoxClosedGif.isHidden = true
        BoxOpenGif.isHidden = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
            self.BoxOpenGif.isHidden = true
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
            self.HBDText.isHidden = false
            self.HBDText.center.y = -70
            self.SaraText.isHidden = false
            self.SaraText.center.y = -70

            //UIView.animate(withDuration: <#T##TimeInterval#>, delay: <#T##TimeInterval#>, options: <#T##UIViewAnimationOptions#>, animations: <#T##() -> Void#>, completion: <#T##((Bool) -> Void)?##((Bool) -> Void)?##(Bool) -> Void#>)
            UIView.animate(withDuration:1, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 20.0, options: [], animations: {
                self.HBDText.center.y = self.view.frame.height/2 - 70
                self.SaraText.center.y = self.view.frame.height/2 - 10
                
            }, completion: nil)
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

