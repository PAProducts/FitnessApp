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
    @NSManaged var reps: String?
    @NSManaged var workout: String?
    @NSManaged var user: String?
    @NSManaged var repCount: String?
    @NSManaged var liked: String?
    @NSManaged var flag: String?
    @NSManaged var likes: NSNumber?
    @NSManaged var didLike: String?
    @NSManaged var muscleGroup: String?
    @NSManaged var descrip: String?
    
    
    
    
    
    // returns the Parse name that should be used
    class func parseClassName() -> String {
        return "Workout"
    }
    
}

class AddWorkoutViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBAction func didTap(_ sender: Any) {
        dismissKeyboard()
    }
    
    @IBAction func didAdd(_ sender: Any) {
        performSegue(withIdentifier: "showAdd", sender: nil)
        
    }
    
    @IBOutlet weak var descriptionView: UITextView!
    @IBOutlet weak var musclePicker: UIPickerView!
    
    var pickerData: [String] = [String]()
    @IBOutlet weak var setsText: UITextField!
    @IBOutlet weak var repsText: UITextField!
    @IBOutlet weak var workoutText: UITextField!
    var mGroup: String?
    var neededString: String?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.musclePicker.delegate = self
        self.musclePicker.dataSource = self
    //    descriptionView.text = neededString
     
        
         pickerData = ["Legs", "Chest", "Shoulders", "Back", "Abs", "Arms"]
     
        

        // Do any additional setup after loading the view.
    }
   
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //print(pickerData[row])
        return pickerData[row]
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // This method is triggered whenever the user makes a change to the picker selection.
        // The parameter named row and component represents what was selected.
        print(pickerData[row])
        mGroup = pickerData[row]
    }



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  //  var myImage: UIImage?
    
  
    
    @IBAction func didCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func didTapAdd(_ sender: Any) {
        
        if workoutText.text == "" || repsText.text == "" || setsText.text == "" {
            print("there is an empty field")
        }
        else {
            addWorkout()
            //self.performSegue(withIdentifier: "backSegue", sender: nil)
            self.dismiss(animated: true, completion: nil)
        }
        
       
    }
    
    func addWorkout() {
        let addedWorkout = Workout()
      //  let instance = WorkoutCell
        addedWorkout.workout = workoutText.text ?? ""
        addedWorkout.repCount = repsText.text ?? ""
        addedWorkout.reps = setsText.text ?? ""
        addedWorkout.user = PFUser.current()?.username
        addedWorkout.flag = "false"
        addedWorkout.likes = 0
        addedWorkout.liked = "likes" //+ (addedWorkout.likes as! String!)
        addedWorkout.didLike = "false"
        addedWorkout.muscleGroup = mGroup
     //   addedWorkout.descrip = descriptionView.text
     //   addedWorkout.workoutImage = workoutIMG.
        print()
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
