//
//  WorkoutCell.swift
//  FitnessApp
//
//  Created by Pallav  on 3/22/18.
//  Copyright © 2018 Pallav Kamojjhala. All rights reserved.
//

import UIKit
import Parse

class WorkoutCell: UITableViewCell {
   var status = "false"
  //  var count = 0
    
    @IBOutlet weak var backgroundIMG: UIImageView!
    @IBOutlet weak var descView: UITextView!
 //   @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var mscGroup: UILabel!
   // @IBOutlet weak var likeCount: UILabel!
    @IBOutlet weak var setsLabel: UILabel!
    @IBOutlet weak var repsLabel: UILabel!
    @IBOutlet weak var workoutLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
  //  @IBOutlet weak var likesLabel: UILabel!
    
    @IBOutlet weak var likeButton: UIButton!
    
    var workout: Workout! {
        didSet {
            setsLabel.text = "Sets: " +  workout.reps!
            workoutLabel.text = "Name: "  +  "'" + workout.workout! + "'"
            usernameLabel.text = "@" + workout.user!
            repsLabel.text = "Reps: " + workout.repCount!
          //  likesLabel.text = "\(workout.likes!)"
            mscGroup.text = "Muscle Group: " +  "'" + workout.muscleGroup! + "'"
       //     imgView.image = workout.workoutImage
            descView.text = "Description: " + workout.descrip!
            if workout.muscleGroup == "Shoulders" {
                backgroundIMG.image = #imageLiteral(resourceName: "shoulders")
            }
            else if workout.muscleGroup == "Legs" {
                backgroundIMG.image = #imageLiteral(resourceName: "legs")
            }
            else if workout.muscleGroup == "Chest" {
                backgroundIMG.image = #imageLiteral(resourceName: "chest")
            }
            else if workout.muscleGroup == "Back" {
                backgroundIMG.image = #imageLiteral(resourceName: "back")
            }
            else if workout.muscleGroup == "Abs" {
                backgroundIMG.image = #imageLiteral(resourceName: "abs")
            }
            else if workout.muscleGroup == "Arms" {
                backgroundIMG.image = #imageLiteral(resourceName: "arms")
            }
            

            
            let likeQuery = PFQuery(className: "Likes")
            likeQuery.whereKey("workoutID", equalTo: self.workout.objectId!).findObjectsInBackground { (workoutLikes, error) in
                if let error = error {
                    print(error.localizedDescription)
                } else if let workoutLikes = workoutLikes {
                    for workoutLike in workoutLikes {
                        if let user = workoutLike["userID"] as? String {
                            if user == PFUser.current()!.objectId {
                                if (workoutLike["type"] as! Bool) == true {
                                    self.likeButton.setTitle("dislike \(self.workout.likes!)", for: .normal)
                                } else {
                                    self.likeButton.setTitle("like \(self.workout.likes!)", for: .normal)
                                    
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    @IBAction func didReccomend(_ sender: Any) {
        let likeQuery = PFQuery(className: "Likes")
        likeQuery.whereKey("workoutID", equalTo: self.workout.objectId!).findObjectsInBackground { (workoutLikes, error) in
            if let error = error {
                print(error.localizedDescription)
            } else if let workoutLikes = workoutLikes {
                for workoutLike in workoutLikes {
                    if let user = workoutLike["userID"] as? String {
                        if user == PFUser.current()!.objectId {
                            if (workoutLike["type"] as! Bool) == true {
                                workoutLike["type"] = false
                                workoutLike.saveInBackground(block: { (success, error) in
                                    if let error = error {
                                        print(error.localizedDescription)
                                    } else {
                                        self.workout.incrementKey("likes", byAmount: -2)
                                        self.workout.saveInBackground { (success, error) in
                                            if let error = error {
                                                print(error.localizedDescription)
                                                self.workout.incrementKey("likes", byAmount: 2)
                                            } else if success {
                                      //          self.likesLabel.text = "\(self.workout.likes!)"
                                                self.likeButton.setTitle("like \(self.workout.likes!)", for: .normal)
                                            }
                                        }
                                    }
                                })
                            } else {
                                workoutLike["type"] = true
                                workoutLike.saveInBackground(block: { (success, error) in
                                    if let error = error {
                                        print(error.localizedDescription)
                                    } else {
                                        self.workout.incrementKey("likes", byAmount: 2)
                                        self.workout.saveInBackground { (success, error) in
                                            if let error = error {
                                                print(error.localizedDescription)
                                                self.workout.incrementKey("likes", byAmount: -2)
                                            } else if success {
                                       //         self.likesLabel.text = "\(self.workout.likes!)"
                                                self.likeButton.setTitle("dislike \(self.workout.likes!)", for: .normal)
                                            }
                                        }
                                    }
                                })
                            }
                            
                            
                            return
                        }
                    }
                }
                
                let like = PFObject(className: "Likes")
                like["workoutID"] = self.workout.objectId!
                like["userID"] = PFUser.current()!.objectId
                like["type"] = true
                like.saveInBackground(block: { (success, error) in
                    if let error = error {
                        print(error.localizedDescription)
                    } else if success {
                        self.workout.incrementKey("likes", byAmount: 1)
                        self.workout.saveInBackground { (success, error) in
                            if let error = error {
                                print(error.localizedDescription)
                                self.workout.incrementKey("likes", byAmount: -1)
                            } else if success {
                            //    self.likesLabel.text = "\(self.workout.likes!)"
                                self.likeButton.setTitle("dislike \(self.workout.likes!)", for: .normal)
                            }
                        }
                    }
                })
                
            }
        }
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
      //  super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
