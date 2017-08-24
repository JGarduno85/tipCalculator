//
//  TipSplitDataProvider.swift
//  TipCalculator
//
//  Created by Humberto Garduno - Vendor on 8/21/17.
//  Copyright © 2017 Humberto Garduno - Vendor. All rights reserved.
//

import Foundation
import  UIKit


class TipSplitDataProvider: NSObject,UITableViewDataSource{
    
    weak var tipManager:TipManager!
    
    override init() {
        
    }
    
     convenience init(tipManager:TipManager) {
        self.init()
        self.tipManager = tipManager
    }
    
    

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else{
            return UITableViewCell()
        }
        
        let split = self.tipManager.splitPersons[indexPath.row]
        
        cell.textLabel?.text = "split the check between \(split.numberPeople) = \(split.amount)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tipManager.splitPersons.count
    }
    
    
}
