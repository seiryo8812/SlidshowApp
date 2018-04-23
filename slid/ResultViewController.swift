//
//  ResultViewController.swift
//  slid
//
//  Created by 加島亮成 on 2018/04/20.
//  Copyright © 2018年 加島亮成. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    var  xphoto = UIImage()
    @IBOutlet weak var exphoto: UIImageView!
   


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        exphoto.image = xphoto
    
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
