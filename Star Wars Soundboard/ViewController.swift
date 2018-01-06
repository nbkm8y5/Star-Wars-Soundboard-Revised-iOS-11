//
//  ViewController.swift
//  Star Wars Soundboard
//
//  Created by Rolando Moreno on 12/19/17.
//  Copyright © 2017 Greasy Hacks, LLC. All rights reserved.
//

import UIKit
//IMPORT AV FOUNDATION FOR AUDIO
import AVFoundation

class ViewController: UIViewController {
    
//    CREATE A PLAYER OBJECT
    var player: AVAudioPlayer?
    
    var soundArray = ["nothing", "finish3", "started", "awakening", "feltit", "dark_side_v2", "and_the_light", "empire", "fear", "chrome", "record_scratch"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pressSoundButton(_ sender: UIButton) {
        
        print(sender.tag - 1)
        if(sender.tag - 1 >= 0 && sender.tag - 1 < 11){
            var selectedSoundFileName : String = soundArray[sender.tag - 1]
            var soundUrl = Bundle.main.url(forResource: selectedSoundFileName, withExtension: "wav")
            playsound(url: soundUrl!)
        }else{
            alertButtonDisabled()
        }
        
//        switch (sender.tag) {
//        case 1:
////            CREATE SOUND URL
//            let nothing = Bundle.main.url(forResource: "nothing", withExtension: "wav")
//            playsound(url: nothing!)
//            break;
//        case 2:
//            let finish = Bundle.main.url(forResource: "finish3", withExtension: "wav")
//            playsound(url: finish!)
//            break;
//        case 3:
//            let started = Bundle.main.url(forResource: "started", withExtension: "wav")
//            playsound(url: started!)
//            break;
//        case 4:
//            let awakening = Bundle.main.url(forResource: "awakening", withExtension: "wav")
//            playsound(url: awakening!)
//            break;
//        case 5:
//            let feltit = Bundle.main.url(forResource: "feltit", withExtension: "wav")
//            playsound(url: feltit!)
//            break;
//        case 6:
//            let darkside = Bundle.main.url(forResource: "dark_side_v2", withExtension: "wav")
//            playsound(url: darkside!)
//            break;
//        case 7:
//            let light = Bundle.main.url(forResource: "and_the_light", withExtension: "wav")
//            playsound(url: light!)
//            break;
//        case 8:
//            let vaderBespin = Bundle.main.url(forResource: "empire", withExtension: "wav")
//            playsound(url: vaderBespin!)
//            break;
//
//        case 9:
//            let fearDarthMaul = Bundle.main.url(forResource: "fear", withExtension: "wav")
//            playsound(url: fearDarthMaul!)
//            break;
//
//        case 10:
//            let madMax = Bundle.main.url(forResource: "chrome", withExtension: "wav")
//            playsound(url: madMax!)
//            break;
//
//        case 11:
//            let recordScratch = Bundle.main.url(forResource: "record_scratch", withExtension: "wav")
//            playsound(url: recordScratch!)
//            break;
//
//        case 12:
//            warnDisabled()
//            break;
//
//        case 13:
//            warnDisabled()
//            break;
//
//        case 14:
//            warnDisabled()
//            break;
//
//        default:
//            break;
//        }
    }
    
    func alertButtonDisabled(){
        let alert = UIAlertController(title: "Star Wars Soundboard", message: "This button is currently disabled.", preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "Okay", style: .default) { (UIAlertAction) in
        
        }
        
        alert.addAction(alertAction)
        
        present(alert, animated: true, completion: nil)
       
    }
    
    /**
     This function plays sound by passing in URL
 */
    func playsound(url: URL){
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            
            player = try AVAudioPlayer(contentsOf: url)
            guard let player = player else { return }
            
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }

}

