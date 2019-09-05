//
//  ViewController.swift
//  InsideList
//
//  Created by Muhammad Mujahid on 01/09/2019.
//  Copyright © 2019 Muhammad Mujahid. All rights reserved.
//

import UIKit
import QuartzCore

protocol CanREeceive {
    func dataReceived(data: String) 
}

class ViewController: UIViewController, UITableViewDataSource {
    var dataa = ""
    var delegate : CanREeceive?
    
    @IBOutlet weak var tableView: UITableView!
    
     var pos = ""
    // UITableViewDataSource
    //  private var data: [String] = []
    private var englishName: [String] = []
    private var arabicName: [String] = []
    private var meaningArabic: [String] = []
    private var meaningEnglish: [String] = []

    
    //private var arabic: [String] = []
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  englishName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let text = arabicName[indexPath.row] //2.
        let Eng = englishName[indexPath.row]
        let meaningEng = meaningEnglish[indexPath.row]
        let meaningArb = meaningArabic[indexPath.row]


        let cell = tableView.dequeueReusableCell(withIdentifier: "reusableCell") as! customTableViewCell
        
        
        
        cell.label?.text = text
        cell.englishName?.text = Eng
        cell.englishMeaning?.text = meaningEng
        cell.arabicMeaning?.text = meaningArb
       // cell.englishName?.text = Eng
        cell.view_baseView.layer.cornerRadius = 10
      
        
        
        
        //        cell.layer.borderWidth = 2.0
        //        cell.layer.borderColor = UIColor.brown.cgColor
        
        // cell.contentView.layer.cornerRadius = 25
        // cell.view_baseView.layer.masksToBounds = true
        // cell.contentView.layoutMargins = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    
        let row = indexPath.row
pos = "\(row)"
        performSegue(withIdentifier: "detailedview", sender: self)

        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailedview"{
            let secondViewController = segue.destination as! DetailedView
            secondViewController.pos = "\(pos)"
           // secondViewController.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Swift.print(" Received file name = \(dataa)")

        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.rowHeight = 100
        
        
        let path = Bundle.main.path(forResource: "\(dataa)", ofType: "txt") // file path for file "data.txt"
        do {
            var text = try String(contentsOfFile: path!)
            let lines : [String] = text.components(separatedBy: "\n")
            for line in lines {
                
                let values : [String] = line.components(separatedBy: "#")
                if values.contains("333") {
                    break
                }

                  arabicName.append("\(values[0])")
                  englishName.append("\(values[2])")
                meaningEnglish.append("\(values[3])")
                meaningArabic.append("\(values[1])")

                
                
                
//                Swift.print(" Arabic name =    \(values[0])")
//                Swift.print("\n Arabic meaning   \(values[1])")
//                Swift.print("\n English Name  \(values[3])")
//                Swift.print("\n English meaning  \(values[2])")
            }
        }
        catch(_){
            print("error")
            
        }
        
        //   tableView.layer.cornerRadius = 10.0
      
        
        // tableView.separatorInset = UIEdgeInsets.init(top: 10, left: 0, bottom: 10, right: 0)
        
        
    }
    
    
    @IBAction func backButton(_ sender: Any) {
   delegate?.dataReceived(data: "")
        dismiss(animated: true, completion: nil)
    }
}

