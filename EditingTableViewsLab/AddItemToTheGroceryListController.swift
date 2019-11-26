//
//  ViewController.swift
//  EditingTableViewsLab
//
//  Created by Lilia Yudina on 11/21/19.
//  Copyright © 2019 Lilia Yudina. All rights reserved.
//

import UIKit

class AddItemToTheGroceryListController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var groceries = GroceryItem.groceryList
    
    var isEditingGroceryList = false {
        didSet {
            tableView.isEditing = isEditingGroceryList
            navigationItem.leftBarButtonItem?.title = isEditingGroceryList ? "Done": "Edit"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
    @IBAction func addNewGrocery(segue: UIStoryboardSegue) {
        guard let groceryListViewController = segue.source as? GroceryListViewController,
            let createGrocery = groceryListViewController.grocery else {
                fatalError("failed to access GroceryListViewController")
        }
        
        groceries.insert(createGrocery, at: 0)
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
    @IBAction func editButtonPressed(sender: Any) {
        isEditingGroceryList.toggle()
    }

}

extension AddItemToTheGroceryListController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groceries.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "groceryCell", for: indexPath)
        let grocery = groceries[indexPath.row]
        cell.textLabel?.text = grocery.name
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .insert:
            print("insert")
        case .delete:
            groceries.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        default:
            print("...")
        }
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let groceryToMove = groceries[sourceIndexPath.row]
        groceries.remove(at: sourceIndexPath.row)
        groceries.insert(groceryToMove, at: destinationIndexPath.row)
    }
}
