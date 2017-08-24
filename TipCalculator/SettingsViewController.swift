//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Humberto Garduno - Vendor on 8/22/17.
//  Copyright © 2017 Humberto Garduno - Vendor. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipSegmentedControler: UISegmentedControl!
    weak var tipManager:TipManager?
    var segmentedSelected:Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        if let segment = self.segmentedSelected{
            self.tipSegmentedControler.selectedSegmentIndex = segment
            self.tipTotal(segmentSelected: segment)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func save(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(self.tipSegmentedControler.selectedSegmentIndex, forKey: "segmentedSelected")
        defaults.synchronize()
    }
    
    
    func setupView(){
        self.tipSegmentedControler.addTarget(self, action: #selector(segmentControlValueChange(segment:)), for: .valueChanged)
    }
    
    func segmentControlValueChange(segment: UISegmentedControl){
        tipTotal(segmentSelected: segment.selectedSegmentIndex)
    }
    
    func tipTotal(segmentSelected:Int){
        guard let tipManager = self.tipManager else{
            return
        }
        switch(segmentSelected){
        case 0:
            tipManager.tip = 1.1
            tipManager.calculateTip()
        case 1:
            tipManager.tip = 1.15
            tipManager.calculateTip()
        case 2:
            tipManager.tip = 1.22
            tipManager.calculateTip()
        default: break
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
