//
//  ViewController.swift
//  Todo
//
//  Created by chris  on 9/20/18.
//  Copyright © 2018 kuronuma studios. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = [Item]()
    
    let defaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var newItem = Item()
        newItem.title = "Find Mike"
        itemArray.append(newItem)
        
        var newItem2 = Item()
        newItem2.title = "Buy Eggs"
        itemArray.append(newItem2)
        
        var newItem3 = Item()
        newItem3.title = "Destroy Demogorgon"
        itemArray.append(newItem3)
        
//        itemArray.append(newItem3)
//        itemArray.append(newItem3)
//        itemArray.append(newItem3)
//        itemArray.append(newItem3)
//        itemArray.append(newItem3)
//        itemArray.append(newItem3)
//        itemArray.append(newItem3)
//        itemArray.append(newItem3)
//        itemArray.append(newItem3)
//        itemArray.append(newItem3)
//        itemArray.append(newItem3)
//        itemArray.append(newItem3)
//        itemArray.append(newItem3)
//        itemArray.append(newItem3)
//        itemArray.append(newItem3)
//        itemArray.append(newItem3)
//        itemArray.append(newItem3)
//        itemArray.append(newItem3)
//        itemArray.append(newItem3)
//        itemArray.append(newItem3)
        
        //This works to check optional
//        guard let items = defaults.array(forKey: "TodoListArray") as? [Item] else { return }
//        itemArray = items
        
        if let items = defaults.array(forKey: "TodoListArray") as? [Item] {
            itemArray = items
        }
//        if let items = defaults.array(forKey: "TodoListArray") as? [String] {
//            itemArray = items
//        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        //short version
        cell.textLabel?.text = item.title
        
        //long version
//        cell.textLabel?.text = itemArray[indexPath.row].title
        
        // Ternary operator
        // value = condition ? valueIfTrue : valueIfFalse
        //shorter version
        cell.accessoryType = item.done ? .checkmark : .none
        
        //longer version
//        if item.done == true {
//            cell.accessoryType = .checkmark
//        } else {
//            cell.accessoryType = .none
//        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //This replaces below long version code
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        //long version for bool
//        if itemArray[indexPath.row].done == false {
//            itemArray[indexPath.row].done = true
//        } else {
//            itemArray[indexPath.row].done = false
//        }
        
        tableView.reloadData()

        //I can remove these now that i have the above code
//        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
//            tableView.cellForRow(at: indexPath)?.accessoryType = .none
//        } else {
//            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
//        }
        
        
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        //make local variable outside the closures to hold the textfield value
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new todo item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            //what will happen once the user clicks the add button on our UIAlert
//            print(textField.text)
            
            var newItem = Item()
            newItem.title = textField.text!
            
            self.itemArray.append(newItem)
            
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            
            alertTextField.placeholder = "Create new item"
            print("added Textfield")
            textField = alertTextField
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    

}

