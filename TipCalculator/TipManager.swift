//
//  TipManager.swift
//  TipCalculator
//
//  Created by Humberto Garduno - Vendor on 8/22/17.
//  Copyright © 2017 Humberto Garduno - Vendor. All rights reserved.
//

import Foundation



class TipManager: NSObject {
    var total:Decimal
    var totalTip:Decimal
    var tip:Decimal
    var splitPersons:[tipPerson] = []
    
    init(total:Decimal = 0,totalTip:Decimal = 0 ,tip:Decimal = 0) {
        self.total = total
        self.totalTip = totalTip
        self.tip = tip
        for index in 2...10{
            splitPersons.append(tipPerson(numberPeople: index, amount: 0))
        }
    }
    
    func calculateTip(){
        totalTip = total * tip
        for people in splitPersons{
            people.amount = total * tip / Decimal(people.numberPeople)
        }
    }
}
