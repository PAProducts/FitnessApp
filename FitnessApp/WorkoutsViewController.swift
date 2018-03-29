//
//  WorkoutsViewController.swift
//  FitnessApp
//
//  Created by Anubhav Saxena on 3/29/18.
//  Copyright © 2018 Pallav Kamojjhala. All rights reserved.
//

import UIKit

class WorkoutsViewController: UIViewController {

    @IBOutlet weak var absImageButton: UIButton!
    @IBOutlet weak var armsImageButton: UIButton!
    @IBOutlet weak var backImageButton: UIButton!
    @IBOutlet weak var chestImageButton: UIButton!
    @IBOutlet weak var legsImageButton: UIButton!
    @IBOutlet weak var shouldersImageButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        absImageButton.layer.cornerRadius = 15
        absImageButton.layer.borderWidth = 2
        absImageButton.layer.borderColor =  UIColor.black.cgColor
        armsImageButton.layer.cornerRadius = 15
        armsImageButton.layer.borderWidth = 2
        armsImageButton.layer.borderColor =  UIColor.black.cgColor
        backImageButton.layer.cornerRadius = 15
        backImageButton.layer.borderWidth = 2
        backImageButton.layer.borderColor =  UIColor.black.cgColor
        chestImageButton.layer.cornerRadius = 15
        chestImageButton.layer.borderWidth = 2
        chestImageButton.layer.borderColor =  UIColor.black.cgColor
        legsImageButton.layer.cornerRadius = 15
        legsImageButton.layer.borderWidth = 2
        legsImageButton.layer.borderColor =  UIColor.black.cgColor
        shouldersImageButton.layer.cornerRadius = 15
        shouldersImageButton.layer.borderWidth = 2
        shouldersImageButton.layer.borderColor =  UIColor.black.cgColor
        // Do any additional setup after loading the view.
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
