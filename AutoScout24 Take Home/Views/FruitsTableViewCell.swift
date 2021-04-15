//
//  FruitsTableViewCell.swift
//  AutoScout24 Take Home
//
//  Created by FGT MAC on 4/14/21.
//

import UIKit

class FruitsTableViewCell: UITableViewCell {
    
    
    //MARK: - Properties
    var fruit: Fruit? {
        didSet{
            updateViews()
        }
    }
    static let reuseIdentifier = "FruitCell"
    
    //MARK: - Outlets
    @IBOutlet weak var imageViewCell: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    
    private func updateViews() {
        
        guard let fruit = fruit else { return }
        
        nameLabel.text = fruit.name
        priceLabel.text = String(fruit.price)
        imageViewCell.loadFromURL(URL(string: fruit.image)!)
    }

}


extension UIImageView {
    func loadFromURL(_ url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
