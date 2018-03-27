//
//  CustomViewController.swift
//  FitnessApp
//
//  Created by Pallav  on 3/22/18.
//  Copyright © 2018 Pallav Kamojjhala. All rights reserved.
//

import UIKit
import Parse
class CustomViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var workouts = [Workout]()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        getMSGs()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workouts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("wow2")
        let cell = tableView.dequeueReusableCell(withIdentifier: "WorkoutCell", for: indexPath) as! WorkoutCell
        print("Wow")
        let currentWorkout = workouts[indexPath.row]
        cell.setsLabel.text = "Sets:" + currentWorkout.reps!
        cell.workoutLabel.text = "Name:" + currentWorkout.workout!
        cell.usernameLabel.text = "@" + currentWorkout.user!
        cell.repsLabel.text = "Reps:" + currentWorkout.repCount!
        if count == 1 {
            currentWorkout.flag = "true"
            currentWorkout.saveInBackground()
            count -= 1 
        }
        if (currentWorkout.flag == "true") {
        cell.likeCount.text = currentWorkout.liked
        
        }
        else {
            cell.likeCount.text = ""
        }
        
        
        return cell
    }
    
   var count = 0
    @IBAction func didRecom(_ sender: Any) {
    count = 1
     /*   addedWorkout.saveInBackground { (success, error) in
            if success {
                print("saved flag")
            }
            else {
                print("flag didnt work")
            }
        } */
        getMSGs()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didAdd(_ sender: Any) {
        self.performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    @objc func getMSGs() {
        let query = Workout.query()
        query?.addDescendingOrder("createdAt")
        
        query?.findObjectsInBackground { (posts, error) in
            if let posts = posts {
                // do something with the array of object returned by the call
                print("loading info")
                for post in posts {
                    print(post)
                }
                self.workouts = posts as! [Workout]
                self.tableView.reloadData()
            } else {
                print(error?.localizedDescription)
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
