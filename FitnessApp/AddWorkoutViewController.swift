//
//  AddWorkoutViewController.swift
//  FitnessApp
//
//  Created by Pallav  on 3/23/18.
//  Copyright © 2018 Pallav Kamojjhala. All rights reserved.
//

import UIKit
import Parse

class Workout: PFObject, PFSubclassing {
    // properties/fields must be declared here
    // @NSManaged to tell compiler these are dynamic properties
    @NSManaged var setCount: String?
    @NSManaged var workout: String?
    @NSManaged var user: String?
    @NSManaged var repCount: String?
    
    
    // returns the Parse name that should be used
    class func parseClassName() -> String {
        return "Workout"
    }
    
}

class AddWorkoutViewController: UIViewController {

    @IBOutlet weak var setsText: UITextField!
    @IBOutlet weak var repsText: UITextField!
    @IBOutlet weak var workoutText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapAdd(_ sender: Any) {
        
        if workoutText.text == "" || repsText.text == "" || setsText.text == "" {
            print("there is an empty field")
        }
        else {
            addWorkout()
            self.performSegue(withIdentifier: "backSegue", sender: nil)
        }
        
       
    }
    
    func addWorkout() {
        let addedWorkout = Workout()
        addedWorkout.workout = workoutText.text ?? ""
        addedWorkout.repCount = repsText.text ?? ""
        addedWorkout.setCount = setsText.text ?? ""
        addedWorkout.user = PFUser.current()?.username
        if (workoutText.text != nil || repsText.text != "" || setsText.text != ""){
            addedWorkout.saveInBackground { (success, error) in
                
                if success {
                    print("The message was saved!")
                  //  self.getMSGs()
                    self.workoutText.text = ""
                    self.repsText.text = ""
                    self.setsText.text = ""
                } else if let error = error {
                    print("Problem saving message: \(error.localizedDescription)")
                }
            }
        }
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
