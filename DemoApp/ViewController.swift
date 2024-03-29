//
//  ViewController.swift
//  DemoApp
//
//  Created by Apple on 29/03/24.
//

import UIKit
import Kingfisher

enum enumVegNonVeg{
    case veg
    case nonVeg
    
}
class ViewController: UIViewController {

    var mealModel:Meal?
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        registerCells()
        geeApiCall()
        // Do any additional setup after loading the view.
    }
    func setupUI(){
        self.tableView.separatorStyle = .none
    }
    func registerCells(){
        
        self.tableView.register(UINib(nibName: DashboardTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DashboardTableViewCell.identifier)
    
        
        
    }

    func geeApiCall(){
        APIManageer.shared.getApiCall(url: Constant.apiUrl,model: mealModel) { isSuccess, response in
            if isSuccess{
                if let response = response{
                    self.mealModel = response
//                    debugPrint(response)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
                
                
            }
        }
        
    }
    
    
    

}


extension ViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mealModel?.meals?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DashboardTableViewCell.identifier) as? DashboardTableViewCell else{
            return UITableViewCell()
        }
        guard let data = self.mealModel?.meals?[indexPath.row] else {
            return cell
        }
        
        if let url = URL(string: data.strMealThumb ?? ""){
            cell.imageV.kf.setImage(with: url)
        }
        cell.selectionStyle = .none
        cell.setIngridiants(item:data)
//        cell.collectionView.backgroundColor = .blue
        cell.titleLbl.text = data.strMeal
        cell.descLbl.text = data.strInstructions
        cell.mainView.layer.borderWidth = 1
        cell.mainView.layer.borderColor = UIColor.gray.cgColor
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return -1
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Prashant"
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
}
