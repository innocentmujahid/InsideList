//
//  FirstViewController.swift
//  InsideList
//
//  Created by Muhammad Mujahid on 03/09/2019.
//  Copyright © 2019 Muhammad Mujahid. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, CanREeceive {
  
    
    func dataReceived(data: String) {
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func malebutton(_ sender: Any) {
        
        performSegue(withIdentifier: "SendData1", sender: self)
    }
    
    @IBAction func femaleButton(_ sender: Any) {
        
        performSegue(withIdentifier: "Female", sender: self)

        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SendData1"{
            let secondViewController = segue.destination as! ViewController
            secondViewController.dataa = "config"
            secondViewController.delegate = self
        }
        else if segue.identifier == "Female" {
            
            let secondViewController = segue.destination as! ViewController
            secondViewController.dataa = "female"
            secondViewController.delegate = self
        }
        
        
    }
//
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
