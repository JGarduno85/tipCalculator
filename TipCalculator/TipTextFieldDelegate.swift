//
//  TipTextFieldDelegate.swift
//  TipCalculator
//
//  Created by Humberto Garduno - Vendor on 8/21/17.
//  Copyright © 2017 Humberto Garduno - Vendor. All rights reserved.
//

import Foundation
import UIKit


class TipTextFieldDelegate:NSObject ,UITextViewDelegate {
    
    weak var tipManager:TipManager!
    weak var displayTip:UILabel!
    weak var displaySplit:UITableView!
    
    init(tipManager:TipManager,display:UILabel,displaySplit:UITableView) {
        self.tipManager = tipManager
        self.displayTip = display
        self.displaySplit = displaySplit
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let newNSString = textView.text as NSString?
        if let newString = newNSString?.replacingCharacters(in: range, with: text){
            if newString.hasPrefix(NSLocale.current.currencySymbol!) {
                return true
            }
        }
        return false
    }
    
    func textViewDidChange(_ textView: UITextView) {
        let textRemoveCurrencySymbol = textView.text.substring(from: textView.text.index(after: textView.text.startIndex))
        if let total = Decimal(string: textRemoveCurrencySymbol){
            self.tipManager.total = total
            self.tipManager.calculateTip()
            if let display = displayTip{
                display.text = String(describing: self.tipManager.totalTip)
            }
            
            if let displaySplit = displaySplit{
                if let indexPathOfvisibleCells = displaySplit.indexPathsForVisibleRows{
                    displaySplit.reloadRows(at: indexPathOfvisibleCells, with: .middle)
                }
            }
        }
    }
}
