//
//  CustomWorkoutViewController.swift
//  FitnessApp
//
//  Created by Pallav  on 3/21/18.
//  Copyright © 2018 Pallav Kamojjhala. All rights reserved.
//

import UIKit
import Parse

class Message: PFObject, PFSubclassing {
    // properties/fields must be declared here
    // @NSManaged to tell compiler these are dynamic properties
    @NSManaged var workout: String?
    @NSManaged var user: String?
    @NSManaged var reps: String?
    @NSManaged var sets: String?
    
    // returns the Parse name that should be used
    class func parseClassName() -> String {
        return "Message"
    }
}

class CustomWorkoutViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
     var messages: [PFObject]?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
       // self.getMSGs()
        // Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.onTimer), userInfo: nil, repeats: true)

        // Do any additional setup after loading the view.
    }
    
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let messages = messages {
            return messages.count
        }
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let currentWorkout = messages?[indexPath.row] as! Message?
        cell.workoutName.text = currentWorkout?.workout
        cell.username.text = currentWorkout?.user
        cell.setsCount.text = currentWorkout?.sets
        cell.repsCount.text = currentWorkout?.reps
        
        
        return cell
    }
    @IBOutlet weak var workoutName: UITextField!
    
    @IBOutlet weak var Reps: UITextField!
    @IBOutlet weak var Sets: UITextField!
    
    
    func message() {
        
        let chatMessage = Message()
        chatMessage.workout = workoutName.text ?? ""
        chatMessage.reps = Reps.text ?? ""
        chatMessage.sets = Sets.text ?? ""
        chatMessage.user = PFUser.current()?.username
        if (workoutName.text != nil || Reps.text != "" || Sets.text != ""){
        chatMessage.saveInBackground { (success, error) in
            
            if success {
                print("The message was saved!")
                self.getMSGs()
                self.workoutName.text = ""
                self.Reps.text = ""
                self.Sets.text = ""
            } else if let error = error {
                print("Problem saving message: \(error.localizedDescription)")
            }
        }
        }
    }
    
    func getMSGs() {
        let query = Message.query()
        query?.addDescendingOrder("createdAt")
        
        query?.findObjectsInBackground { (posts: [PFObject]?, error: Error?) in
            if let posts = posts {
                // do something with the array of object returned by the call
                self.messages = posts
                self.tableView.reloadData()
            } else {
                print(error?.localizedDescription)
            }
        }
        
    }
    
   
     
    
    @IBAction func didAdd(_ sender: Any) {
        if workoutName.text == "" || Reps.text == "" || Sets.text == "" {
         print("there is an empty field")
        }
        else {
           message()
        }
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
