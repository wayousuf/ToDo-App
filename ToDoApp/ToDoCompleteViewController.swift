//
//  ToDoCompleteViewController.swift
//  ToDoApp
//
//  Created by Waqas Yousuf on 8/11/17.
//  Copyright © 2017 Waqas Yousuf. All rights reserved.
//

import UIKit

class ToDoCompleteViewController: UIViewController {
    
    var previousVC: ToDoTableViewController?
    var todo: ToDoEntity?
    
    @IBOutlet weak var lblTask: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let title = todo?.name {
            lblTask.text = title
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func btnComplete(_ sender: Any) {
        
        /*if let todoList = previousVC?.todoList {
            var index = 0
            for todoItem in todoList {
                if todoItem.name == todo?.name {
                    previousVC?.todoList.remove(at: index)
                    previousVC?.tableView.reloadData()
                    navigationController?.popViewController(animated: true)
                    break
                }
                index += 1
            }
            
        }*/
        
        if let context =  (UIApplication.shared.delegate as?
            AppDelegate)?.persistentContainer.viewContext {
            
            if let theToDo = todo {
                context.delete(theToDo)
                navigationController?.popViewController(animated: true)
            }
            
        }
    }
}
