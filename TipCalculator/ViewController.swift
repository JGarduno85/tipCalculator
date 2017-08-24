//
//  ViewController.swift
//  TipCalculator
//
//  Created by Humberto Garduno - Vendor on 8/20/17.
//  Copyright © 2017 Humberto Garduno - Vendor. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var totalAmountTextView: UITextView!
    @IBOutlet weak var tipPercentajeSegment: UISegmentedControl!

    @IBOutlet var dataProvder: TipSplitDataProvider!
    @IBOutlet weak var tipSplitTableView: UITableView!
    @IBOutlet weak var totalAmount: UILabel!
    var tipManager:TipManager!
    var textViewDelegate:TipTextFieldDelegate!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        let segmented = defaults.integer(forKey: "segmentedSelected")
        self.tipPercentajeSegment.selectedSegmentIndex = segmented
        self.tipTotal(segmentSelected: segmented)
    }
    
    
    func setupView(){
        self.tipManager = TipManager()
        self.dataProvder = TipSplitDataProvider(tipManager: self.tipManager)
        self.textViewDelegate = TipTextFieldDelegate(tipManager: self.tipManager,display:self.totalAmount,displaySplit:self.tipSplitTableView)
        self.totalAmountTextView.delegate = self.textViewDelegate
        self.tipSplitTableView.dataSource = dataProvder
        self.tipPercentajeSegment.addTarget(self, action: #selector(segmentControlValueChange(segment:)), for: .valueChanged)
    }
    
    func segmentControlValueChange(segment: UISegmentedControl){
        tipTotal(segmentSelected: segment.selectedSegmentIndex)
    }
    
    func tipTotal(segmentSelected:Int){
        switch(segmentSelected){
        case 0:
            self.tipManager.tip = 1.1
            self.tipManager.calculateTip()
            totalAmount.text = String(describing:self.tipManager.totalTip)
            self.tipSplitTableView.reloadData()
        case 1:
            self.tipManager.tip = 1.15
            self.tipManager.calculateTip()
            totalAmount.text = String(describing:self.tipManager.totalTip)
            self.tipSplitTableView.reloadData()

        case 2:
            self.tipManager.tip = 1.22
            self.tipManager.calculateTip()
            totalAmount.text = String(describing:self.tipManager.totalTip)
            self.tipSplitTableView.reloadData()
        default: break
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  let settings = segue.destination as? SettingsViewController{
            settings.segmentedSelected = self.tipPercentajeSegment.selectedSegmentIndex
        }
    }


}

