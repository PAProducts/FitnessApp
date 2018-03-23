//
//  WorkoutsViewController.swift
//  FitnessApp
//
//  Created by Anubhav Saxena on 3/21/18.
//  Copyright © 2018 Pallav Kamojjhala. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class WorkoutsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text, !searchText.isEmpty {
            
            ref = Database.database().reference()
            databaseHandle = ref?.child("Exercises").observe(.childAdded, with: { (snapshot) in
                let post = snapshot.value as? String
                if let actualPost = post {
                    if (actualPost.contains(searchText)) {
                        self.list.append(actualPost)
                        self.workoutTableView.reloadData()
                    }
                }
            })
            list.removeAll()
        }
        
        else {
            ref = Database.database().reference()
            databaseHandle = ref?.child("Exercises").observe(.childAdded, with: { (snapshot) in
                let post = snapshot.value as? String
                if let actualPost = post {
                    self.list.append(actualPost)
                    self.workoutTableView.reloadData()
                }
            })
            list.removeAll()
        }
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    var ref:DatabaseReference?
    var databaseHandle: DatabaseHandle?
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var testArray = [String]()
    
    var list = [String]()
    
    @IBOutlet weak var workoutTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController.searchResultsUpdater = self
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = false
        workoutTableView.tableHeaderView = searchController.searchBar
        searchController.hidesNavigationBarDuringPresentation = false;
        
        // Include the search bar within the navigation bar.
        self.navigationItem.titleView = self.searchController.searchBar;
        
        self.definesPresentationContext = true;
        
        ref = Database.database().reference()
        databaseHandle = ref?.child("Exercises").observe(.childAdded, with: { (snapshot) in
            let post = snapshot.value as? String
            if let actualPost = post {
                self.list.append(actualPost)
                self.workoutTableView.reloadData()
            }
            //dump(self.list)
            //print(self.list)
        })
        
        list.removeAll()
        
        workoutTableView.delegate = self
        workoutTableView.dataSource = self
        
        
        /* works
        let titleRef = self.ref?.child("Exercises")
        titleRef?.queryOrdered(byChild: "Exercises").observe(.childAdded, with: { snapshot in
            
            if let title = snapshot.value as? String {
                self.testArray.append(title)
                
                // Double-check that the correct data is being pulled by printing to the console.
                print("\(self.testArray)")
                
                // async download so need to reload the table that this data feeds into.
                //self.woableView.reloadData()
            }
        })
         */
        
        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell_1")
        cell.textLabel?.text = list[indexPath.row]
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
