import UIKit
import Firebase
import FirebaseDatabase

class ArmExercisesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    var ref:DatabaseReference?
    var databaseHandle: DatabaseHandle?
    
    var testArray = [String]()
    
    var list = [String]()
    var listName = [String]()
    var listDifficulty = [String]()
    
    @IBOutlet weak var workoutTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Include the search bar within the navigation bar.
        
        self.definesPresentationContext = true;
        
        ref = Database.database().reference()
        databaseHandle = ref?.child("arms").observe(.childAdded, with: { (snapshot) in
            let post = snapshot.value as? [String: Any]
            if let actualPost = post {
                let description = actualPost["Description"] as! String
                self.list.append(description)
                let difficulty = actualPost["Difficulty"] as! String
                self.listDifficulty.append(difficulty)
                let name = actualPost["Name"] as! String
                self.listName.append(name)
                self.workoutTableView.reloadData()
            }
            //dump(self.list)
            //print(self.list)
        })
        
        list.removeAll()
        listName.removeAll()
        
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "MuscleCell", for: indexPath) as! MuscleCell
        cell.nameLabel.text = listName[indexPath.row]
        cell.descriptionLabel.text = list[indexPath.row]
        cell.difficultyLabel.text = listDifficulty[indexPath.row]
        if (listDifficulty[indexPath.row] == "Easy") {
            cell.difficultyLabel.textColor = UIColor.green
        }
        if (listDifficulty[indexPath.row] == "Medium") {
            cell.difficultyLabel.textColor = UIColor.orange
        }
        if (listDifficulty[indexPath.row] == "Difficult") {
            cell.difficultyLabel.textColor = UIColor.red
        }
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
