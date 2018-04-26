//
//  ViewController.swift
//  slid
//
//  Created by 加島亮成 on 2018/04/19.
//  Copyright © 2018年 加島亮成. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var playingButton: UIButton!
    @IBOutlet weak var nextp: UIButton!
    
    @IBOutlet weak var prev: UIButton!
    
    @IBAction func onNext(_ sender: Any) {
        dispImageNo += 1
        
        displayImage()
    }
    @IBAction func onPre(_ sender: Any) {
        
        dispImageNo -= 1
        
        displayImage()
        
    }

    @IBOutlet weak var photo: UIImageView!
    var timer: Timer?
    
    var timer_sec:Float = 0
    
    var dispImageNo = 0
    var isPlaying = false
    let imageNameArray = [
        "_20A07352",
        "_MG_1244",
        "_MG_4406-2",
        ]
    func displayImage(){
        
        if dispImageNo < 0{
            dispImageNo = 2
        }
        if dispImageNo > 2{
            dispImageNo = 0
        }
        
        let name = imageNameArray[dispImageNo]
        
        let image = UIImage(named: name)
        
        photo.image = image
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc func onTimer(timer: Timer){
        
        dispImageNo += 1
        
        displayImage()
        
    }
    
    
    @IBAction func onTapImage(_ sender: Any) {
    
        self.timer?.invalidate()
        self.timer = nil
        
        playingButton.setTitle("再生", for: .normal)
        nextp.isEnabled = true
        prev.isEnabled = true
        
        let name = imageNameArray[dispImageNo]
        
        let image = UIImage(named: name)
        
        performSegue(withIdentifier: "result", sender: image!)
        
    }
            override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                if segue.identifier == "result" {
                    let resultViewController = segue.destination as! ResultViewController
                    resultViewController.xphoto = photo.image!
                }
            }
    

    
    @IBAction func startTimer(_sender:Any){
        
        if self.timer == nil{
            
            self.timer = Timer.scheduledTimer(timeInterval: 2.0,target:self,selector:#selector(onTimer),userInfo: nil,repeats: true)
            playingButton.setTitle("停止", for: .normal)
            nextp.isEnabled = false
            prev.isEnabled = false
            
        } else {
            self.timer?.invalidate()
            self.timer = nil
            
            playingButton.setTitle("再生", for: .normal)
            nextp.isEnabled = true
            prev.isEnabled = true
        }
        
    }
    
    // @IBAction func onTappImage(_ sender: Any) {
    //
    //        func prepare(for segue: UIStoryboardSegue,sender: Any?){
    //
    //            let resuletViewController:ResultViewController = segue.destination as! ResultViewController
    //
    //            resuletViewController.xphoto = photo
    //        }
    //    }
    
    
    @IBAction func unwind(_segue: UIStoryboardSegue){
        
    }
    
}

