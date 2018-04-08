//
//  FilterViewController.swift
//  FitnessApp
//
//  Created by Pallav  on 4/7/18.
//  Copyright © 2018 Pallav Kamojjhala. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource {
    
    var mGroup: String?
    
    @IBOutlet weak var musclePicker: UIPickerView!
    
     var pickerData: [String] = [String]()
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.musclePicker.delegate = self
        self.musclePicker.dataSource = self
        
        pickerData = ["All", "Legs", "Chest", "Shoulders", "Back", "Abs", "Arms"]
        // Dispose of any resources that can be recreated.
        
        // Do any additional setup after loading the view.
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
    

    @IBAction func didTap(_ sender: Any) {
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
