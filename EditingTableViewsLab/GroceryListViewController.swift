//
//  GroceryListViewController.swift
//  EditingTableViewsLab
//
//  Created by Lilia Yudina on 11/21/19.
//  Copyright © 2019 Lilia Yudina. All rights reserved.
//

import UIKit

class GroceryListViewController: UIViewController {
    
    @IBOutlet weak var createGroceryTextField: UITextField!
    
    var grocery: GroceryItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createGroceryTextField.delegate = self
        grocery = GroceryItem(name: "swift")
    }

}

extension GroceryListViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        grocery?.name = textField.text ?? "no grocery name"
        return true
    }
}
