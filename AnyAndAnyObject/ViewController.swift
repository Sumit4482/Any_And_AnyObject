//
//  ViewController.swift
//  AnyAndAnyObject
//
//  Created by E5000855 on 27/06/24.
//

import UIKit

class Student {
    var rollNo: Int
    var name: String
    
    init(rollNo: Int, name: String) {
        self.rollNo = rollNo
        self.name = name
    }
}

class ViewController: UIViewController {
    
    var arr: [Any] = []
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        setupUI()
    }
    
    func setupData() {
        let myString: String = "\"Hello World\""
        let myInt: Int = 10
        let myBool: Bool = true
        let myDouble: Double = 3.1414
        let myCharacter: Character = "A"
        let s1 = Student(rollNo: 1, name: "Sumit")
        
        arr = [myString, myInt, myBool, myDouble, myCharacter, s1]
    }
    
    func setupUI() {
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.delegate = self // Add delegate
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        view.addSubview(tableView)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let element = arr[indexPath.row]
        cell.textLabel?.text = "\(element)"
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let element = arr[indexPath.row]
        let elementType = type(of: element)
        
        let alert = UIAlertController(title: "Element Type", message: "\(elementType)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
