//
//  IngrediantsCollectionViewCell.swift
//  DemoApp
//
//  Created by Apple on 29/03/24.
//

import UIKit

class IngrediantsCollectionViewCell: UICollectionViewCell {
    static let identifier = "IngrediantsCollectionViewCell"
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var titleLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
