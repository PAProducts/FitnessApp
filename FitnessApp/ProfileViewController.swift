//
//  ProfileViewController.swift
//  FitnessApp
//
//  Created by Pallav  on 3/20/18.
//  Copyright © 2018 Pallav Kamojjhala. All rights reserved.
//

import UIKit
import Parse

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let userName = PFUser.current()
        print(userName)
        usernameLabel.text = "@" + (userName?.username!)!

        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var usernameLabel: UILabel!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didDeleteUser(_ sender: Any) {
        if PFUser.current() != nil {
            PFUser.current()?.deleteInBackground(block: { (deleteSuccessful, error) -> Void in
                print("success = \(deleteSuccessful)")
                PFUser.logOut()
                 self.performSegue(withIdentifier: "deleteuser", sender: nil)
            })
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
