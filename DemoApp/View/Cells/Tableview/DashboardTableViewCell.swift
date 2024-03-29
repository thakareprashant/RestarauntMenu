//
//  DashboardTableViewCell.swift
//  DemoApp
//
//  Created by Apple on 29/03/24.
//

import UIKit

class DashboardTableViewCell: UITableViewCell {

    var enumVegNonVeg:enumVegNonVeg = .veg
    var mealData:[Json4Swift_Base] = []
    @IBOutlet weak var vegNonVegView: UIView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var collectionView:UICollectionView!
    @IBOutlet weak var imageV:UIImageView!
    
    var arrayIngriant:[String] = []
    @IBOutlet weak var titleLbl:UILabel!
    @IBOutlet weak var descLbl:UILabel!
    static let identifier = "DashboardTableViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        self.vegNonVegView.layer.cornerRadius = 18
        mainView.layer.cornerRadius = 15
        mainView.clipsToBounds = true
        registerCells()
        collectionView.delegate = self
        collectionView.dataSource = self
        // Initialization code
    }
    func setIngridiants(mealData:[Json4Swift_Base]){
        for item in mealData{
            arrayIngriant.append(item.strIngredient1 ?? "")
            arrayIngriant.append(item.strIngredient2 ?? "")
            arrayIngriant.append(item.strIngredient3 ?? "")
            arrayIngriant.append(item.strIngredient4 ?? "")
            arrayIngriant.append(item.strIngredient5 ?? "")
            arrayIngriant.append(item.strIngredient6 ?? "")
            arrayIngriant.append(item.strIngredient7 ?? "")
            arrayIngriant.append(item.strIngredient9 ?? "")
            arrayIngriant.append(item.strIngredient10 ?? "")
            arrayIngriant.append(item.strIngredient11 ?? "")
            arrayIngriant.append(item.strIngredient12 ?? "")
            arrayIngriant.append(item.strIngredient13 ?? "")
            arrayIngriant.append(item.strIngredient14 ?? "")
            arrayIngriant.append(item.strIngredient15 ?? "")
            arrayIngriant.append(item.strIngredient16 ?? "")
            arrayIngriant.append(item.strIngredient17 ?? "")
            arrayIngriant.append(item.strIngredient18 ?? "")
            arrayIngriant.append(item.strIngredient19 ?? "")
            arrayIngriant.append(item.strIngredient20 ?? "")
            
        }
       
        let filterArray = self.arrayIngriant.filter { str in
            return str != ""
        }
        debugPrint(filterArray)
        self.arrayIngriant = filterArray
        self.collectionView.reloadData()
        
        
    }
    func registerCells(){
        
        collectionView.register(UINib(nibName: IngrediantsCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: IngrediantsCollectionViewCell.identifier)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension DashboardTableViewCell:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrayIngriant.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IngrediantsCollectionViewCell.identifier, for: indexPath) as? IngrediantsCollectionViewCell else{
            return UICollectionViewCell()
        }
        cell.titleLbl.text = self.arrayIngriant[indexPath.row]
        cell.backgroundColor = .darkGray
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        
        return CGSize(width:100, height: 50)
    }
    
    
}
