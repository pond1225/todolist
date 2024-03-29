//
//  ViewController.swift
//  TodoList
//
//  Created by t2023-m0049 on 3/20/24.
//

import UIKit

struct Todo {
    
    var id: Int
    var title: String
    var isCompleted: Bool
}

class ViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    var data: [Todo] = [
            Todo(id: 0, title: "아침식사", isCompleted: false),
            Todo(id: 1, title: "점심식사", isCompleted: false),
            Todo(id: 2, title: "저녁식사", isCompleted: false)
    ]
    func addTodo(_ title: String) {
        let newTodo = Todo(id: data.count, title: title, isCompleted: false)
        data.append(newTodo)
    }
    
    @IBOutlet weak var tableViewMain: UITableView!
    
    @IBAction func alertAlarm(_ sender: UIButton) {
        let alert = UIAlertController(title: "할 일 추가", message: "", preferredStyle: .alert)
        let save = UIAlertAction(title: "SAVE", style: .default) { [weak self] (_) in
            if let textfield = alert.textFields?.first, let title = textfield.text, !title.isEmpty {
                self?.addTodo(title)
                self?.tableViewMain.reloadData()
            }
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(cancel)
        alert.addAction(save)
        alert.addTextField() { (textField) in
            textField.placeholder = "할 일을 입력하세요"
        }
        
        self.present(alert, animated: true)
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCellType1", for: indexPath) as! TableViewCell
        cell.tableCellText.text = data[indexPath.row].title
        cell.todoSwitch.isOn = data[indexPath.row].isCompleted
        cell.updateLabelStrikeThrough()
    
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewMain.delegate = self
        tableViewMain.dataSource = self
    }
    
}
