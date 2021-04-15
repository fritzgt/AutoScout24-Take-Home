//
//  ViewController.swift
//  AutoScout24 Take Home
//
//  Created by FGT MAC on 4/14/21.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Properties
    private var fruitController = FruitController()
    
    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    
    //MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        getData()
    }
    
    //MARK: - Private methods
    private func getData() {
        self.fruitController.getFruits {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}


//MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruitController.fruits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FruitsTableViewCell.reuseIdentifier, for: indexPath) as! FruitsTableViewCell
        
        let fruit = fruitController.fruits[indexPath.row]
        cell.fruit = fruit
        
        return cell
    }
}




