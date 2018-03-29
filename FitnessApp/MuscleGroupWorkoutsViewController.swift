//
//  WorkoutsViewController.swift
//  FitnessApp
//
//  Created by Anubhav Saxena on 3/21/18.
//  Copyright © 2018 Pallav Kamojjhala. All rights reserved.
//

import UIKit

class MuscleGroupWorkoutsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercises.count
    }
    
    
    var testArray = [String]()
    
    var exercises: [[String: Any]] = []
    
    @IBOutlet weak var workoutTableView: UITableView!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem?.tintColor = UIColor.white
        
        self.definesPresentationContext = true;
        
        workoutTableView.delegate = self
        workoutTableView.dataSource = self
        
        let url = URL(string: "https://wger.de/api/v2/muscle/")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                let exercises = dataDictionary["results"] as! [[String: Any]]
                self.exercises = exercises
                print(exercises)
                self.workoutTableView.reloadData()
            }
        }
        
        
        
        task.resume()
        
        // Do any additional setup after loading the view.
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell_1")
        if (exercises[indexPath.row]["name"] as? String == "") {
            exercises[indexPath.row]["name"] = "No name "
        }
        cell.textLabel?.text = exercises[indexPath.row]["name"] as? String
        return(cell)
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

