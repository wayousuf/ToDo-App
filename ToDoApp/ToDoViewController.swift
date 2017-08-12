//
//  ToDoViewController.swift
//  ToDoApp
//
//  Created by Waqas Yousuf on 8/11/17.
//  Copyright © 2017 Waqas Yousuf. All rights reserved.
//

import UIKit

class ToDoViewController: UIViewController {

    var previousVC: ToDoTableViewController?
    @IBOutlet weak var txtTile: UITextField!
    @IBOutlet weak var swtImportant: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func btnAdd(_ sender: Any) {
        
        /*let todo = ToDo()
        if let title = txtTile.text {
            todo.name = title
            todo.important = swtImportant.isOn
            
            previousVC?.todoList.append(todo)
            previousVC?.tableView.reloadData()
            
            navigationController?.popViewController(animated: true);
        }*/
        
        if let context =  (UIApplication.shared.delegate as?
            AppDelegate)?.persistentContainer.viewContext {
            
            let toDo = ToDoEntity(entity: ToDoEntity.entity(), insertInto: context)
            
            if let titleText = txtTile.text {
                toDo.name = titleText
                toDo.important = swtImportant.isOn
            }
            
            try? context.save()
            
            navigationController?.popViewController(animated: true)
        }
    }
}
