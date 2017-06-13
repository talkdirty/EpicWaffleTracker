//
//  ExpenseDetail.swift
//  EpicWaffleTracker
//
//  Created by Georg Grab on 12.06.17.
//  Copyright © 2017 Epic Waffle Org. All rights reserved.
//

import Foundation
import UIKit

class ExpenseDetail : UIViewController {
    public var passedExpense: Expense!
    public var sendDeleteRequestEvent: ((Expense) -> Void)!
    
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet var cost: UILabel!
    @IBOutlet weak var date: UILabel!
    
    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func doSelfDestroy(_ sender: Any) {
        self.sendDeleteRequestEvent(passedExpense)
        self.dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        // TODO populate all that jazz rite here
        navBar.topItem?.title = passedExpense.title
        cost.text = "\(passedExpense.amount)$"
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.YYYY"
        date.text = dateFormatter.string(from: passedExpense.date! as Date)
    }
}
