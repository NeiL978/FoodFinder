//
//  RestaurantTableViewController.swift
//  FoodFinder
//
//  Created by NeiL Liu on 2017/5/1.
//  Copyright © 2017年 NeiL Liu. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {
    
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats And Deli", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    
    var restaurantImgs = [#imageLiteral(resourceName: "cafedeadend"), #imageLiteral(resourceName: "homei"), #imageLiteral(resourceName: "teakha"), #imageLiteral(resourceName: "cafeloisl"), #imageLiteral(resourceName: "petiteoyster"), #imageLiteral(resourceName: "forkeerestaurant"), #imageLiteral(resourceName: "posatelier"), #imageLiteral(resourceName: "bourkestreetbakery"), #imageLiteral(resourceName: "haighschocolate"), #imageLiteral(resourceName: "palominoespresso"), #imageLiteral(resourceName: "upstate"), #imageLiteral(resourceName: "traif"), #imageLiteral(resourceName: "grahamavenuemeats"), #imageLiteral(resourceName: "wafflewolf"), #imageLiteral(resourceName: "fiveleaves"), #imageLiteral(resourceName: "cafelore"), #imageLiteral(resourceName: "confessional"), #imageLiteral(resourceName: "barrafina"), #imageLiteral(resourceName: "donostia"), #imageLiteral(resourceName: "royaloak"), #imageLiteral(resourceName: "caskpubkitchen")]
    
    var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney", "New York", "New York", "New York", "New York", "New York", "New York", "New York", "London", "London", "London", "London"]
    
    var restaurantType = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian / Causual Drink", "French", "Bakery", "bakery", "Chocolate", "Cafe", "American / Seafood", "American", "American", "Breakfase & Brunch", "Coffee & Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]
    
    var restaurantIsVisited = Array(repeating: false, count: 21)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurantNames.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! RestaurantTableViewCell

        // Configure the cell...
        cell.nameLabel.text = restaurantNames[indexPath.row]
        cell.locationLabel.text = restaurantLocations[indexPath.row]
        cell.typeLabel.text = restaurantType[indexPath.row]
        cell.thumbnailImageView.image = restaurantImgs[indexPath.row]
        cell.thumbnailImageView.layer.cornerRadius = cell.thumbnailImageView.bounds.height / 2
        cell.thumbnailImageView.clipsToBounds = true
        
        //判斷是否點選了check-in
        cell.accessoryType = restaurantIsVisited[indexPath.row] ? .checkmark : .none //三元運算
//        if restaurantIsVisited[indexPath.row] {
//            cell.accessoryType = .checkmark
//        } else {
//            cell.accessoryType = .none
//        }
        
        return cell
    }
    
    // cell被選取時
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .actionSheet)
        
        // 實作CancelAction動作
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        optionMenu.addAction(cancelAction)
        
        // 實作CallAction動作
        let callAction = UIAlertAction(title: "Call" + "123-000-\(indexPath.row)", style: .default) { (action) in
            //實作點選Call時的Alert
            let alertMessage = UIAlertController(title: "Service Unavailable", message: "Sorry, the call feature is not available yet. Please retry later.", preferredStyle: .alert)
            alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alertMessage, animated: true, completion: nil)
        }
        optionMenu.addAction(callAction)
        
        // 實作Check-in動作
        let cell = tableView.cellForRow(at: indexPath)
        
        if restaurantIsVisited[indexPath.row] {
            let undoCheckInAction = UIAlertAction(title: "Undo Check in", style: .default) { (action) in
                
                cell?.accessoryType = .none
                self.restaurantIsVisited[indexPath.row] = false
            }
            optionMenu.addAction(undoCheckInAction)
        } else {
            let checkInAction = UIAlertAction(title: "Check in", style: .default) { (action) in
                
                cell?.accessoryType = .checkmark
                
                self.restaurantIsVisited[indexPath.row] = true
                
            }
            optionMenu.addAction(checkInAction)
        }
        
        present(optionMenu, animated: true, completion: nil)
        
        //取消cell被選取後殘留的灰色選取狀態
        tableView.deselectRow(at: indexPath, animated: false)
        
    }
    

}

