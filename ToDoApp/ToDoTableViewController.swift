//
//  ToDoTableViewController.swift
//  ToDoApp
//
//  Created by Waqas Yousuf on 8/10/17.
//  Copyright © 2017 Waqas Yousuf. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController {
    
    var todoList: [ToDoEntity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getToDos()
    }
  
    
    func getToDos() {
        
        if let context =  (UIApplication.shared.delegate as?
            AppDelegate)?.persistentContainer.viewContext {
            
            if let coreDataTodos = try? context.fetch(ToDoEntity.fetchRequest())
                as? [ToDoEntity] {
                if let theToDos = coreDataTodos {
                    todoList = theToDos
                    tableView.reloadData()
                }
            }
        }
    }
    
    func createTodo() -> [ToDo] {
        let eatTodo = ToDo()
        eatTodo.name = "Eat Apple"
        eatTodo.important = true
        
        let milkTodo = ToDo()
        milkTodo.name = "Milk"
        
        let sleepTodo = ToDo()
        sleepTodo.name = "Sleep"
        
        return [eatTodo , milkTodo , sleepTodo]
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        let toDo = todoList[indexPath.row]
        
        if let name = toDo.name {
            
            if toDo.important {
                cell.textLabel?.text = "❗️" + name
            } else {
                cell.textLabel?.text = name
            }
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "completeTaskSegue", sender: todoList[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let addVC = segue.destination as? ToDoViewController {
            addVC.previousVC = self
        }
        
        if let compelteCV = segue.destination as? ToDoCompleteViewController {
            compelteCV.previousVC = self
            if let completeTodo = sender as? ToDoEntity {
                compelteCV.todo = completeTodo
            }
        }
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
