//
//  AddDescriptionViewController.swift
//  FitnessApp
//
//  Created by Pallav  on 4/8/18.
//  Copyright © 2018 Pallav Kamojjhala. All rights reserved.
//

import UIKit

class AddDescriptionViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    var desc: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text = "Add Description"
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      /*  let instance = segue.destination as! AddWorkoutViewController
        instance.neededString  = desc */
    }
   
    @IBAction func didTap(_ sender: Any) {
        let instance = AddWorkoutViewController()
        instance.neededString = desc
    }
    @IBAction func didFinish(_ sender: Any) {
        desc = textView.text
        self.dismiss(animated: true, completion: nil)
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
