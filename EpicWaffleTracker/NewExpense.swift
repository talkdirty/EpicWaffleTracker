//
//  NewExpense.swift
//  EpicWaffleTracker
//
//  Created by Georg Grab on 12.06.17.
//  Copyright © 2017 Epic Waffle Org. All rights reserved.
//

import Foundation
import UIKit
import Toast_Swift
import TSCurrencyTextField
import FSCalendar

class NewExpense : UIViewController {
    @IBOutlet var expenseName: UITextField!
    @IBOutlet var expenseAmount: TSCurrencyTextField!
    @IBOutlet var Calendar: FSCalendar!
    
    @IBAction func cancel(_ sender: Any) {
        print("Cancel Add Item")
        self.dismiss(animated: true) { }
    }
    
    override func viewDidLoad() {
    }
    
    @IBAction func addClick(_ sender: UIButton) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let expense = Expense(context: context)
        
        expense.title = expenseName.text!
        expense.amount = expenseAmount.amount.doubleValue
        expense.date = NSDate.init(timeIntervalSince1970: (Calendar.selectedDate?.timeIntervalSince1970)!)

        NSLog("Saving new expense: \(expense.title)")
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        self.presentingViewController?.view.makeToast("Got it!")
        self.dismiss(animated: true) { }

    }
}
