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
    
//    var restaurantImgs = [#imageLiteral(resourceName: "cafedeadend"), #imageLiteral(resourceName: "homei"), #imageLiteral(resourceName: "teakha"), #imageLiteral(resourceName: "cafeloisl"), #imageLiteral(resourceName: "petiteoyster"), #imageLiteral(resourceName: "forkeerestaurant"), #imageLiteral(resourceName: "posatelier"), #imageLiteral(resourceName: "bourkestreetbakery"), #imageLiteral(resourceName: "haighschocolate"), #imageLiteral(resourceName: "palominoespresso"), #imageLiteral(resourceName: "upstate"), #imageLiteral(resourceName: "traif"), #imageLiteral(resourceName: "grahamavenuemeats"), #imageLiteral(resourceName: "wafflewolf"), #imageLiteral(resourceName: "fiveleaves"), #imageLiteral(resourceName: "cafelore"), #imageLiteral(resourceName: "confessional"), #imageLiteral(resourceName: "barrafina"), #imageLiteral(resourceName: "donostia"), #imageLiteral(resourceName: "royaloak"), #imageLiteral(resourceName: "caskpubkitchen")]
    
    var restaurantImgs = ["cafedeadend.jpg", "homei.jpg", "teakha.jpg", "cafeloisl.jpg", "petiteoyster.jpg", "forkeerestaurant.jpg", "posatelier.jpg", "bourkestreetbakery.jpg", "haighschocolate.jpg", "palominoespresso.jpg", "upstate.jpg", "traif.jpg", "grahamavenuemeats.jpg", "wafflewolf.jpg", "fiveleaves.jpg", "cafelore.jpg", "confessional.jpg", "barrafina.jpg", "donostia.jpg", "royaloak.jpg", "caskpubkitchen.jpg"]
    
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
        cell.thumbnailImageView.image = UIImage(named: restaurantImgs[indexPath.row])
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
    
    // 此方法只能單純的新增或刪除row，用editActionsForRowAt才能設置更多的動作
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            restaurantNames.remove(at: indexPath.row)
//            restaurantLocations.remove(at: indexPath.row)
//            restaurantType.remove(at: indexPath.row)
//            restaurantIsVisited.remove(at: indexPath.row)
//            restaurantImgs.remove(at: indexPath.row)
//        }
//        print("總數：\(restaurantNames.count)")
//        for name in restaurantNames {
//            print(name)
//        }
//        tableView.deleteRows(at: [indexPath], with: .fade)
//    }
    
    // 針對row進行swipe的後續動作設定（實現刪除、社群分享）
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        //社群分享按鈕
        let shareAction = UITableViewRowAction(style: .default, title: "Share") { (action, indexPath) in
            //設定預設分享文字
            let defaultText = "Just checking in at \(self.restaurantNames[indexPath.row])"
            //設定分享圖片 之後可修改為相機或相簿分享
            if let imageToShare = UIImage(named: self.restaurantImgs[indexPath.row]) {
                let activityController = UIActivityViewController(activityItems: [defaultText, imageToShare], applicationActivities: nil)
                self.present(activityController, animated: true, completion: nil)
            }
        }
        shareAction.backgroundColor = UIColor(red:0.114, green:0.631, blue:0.949, alpha:1.000)
        
        
        //Delete Rows
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete") { (action, indexPath) in
            
            self.restaurantNames.remove(at: indexPath.row)
            self.restaurantLocations.remove(at: indexPath.row)
            self.restaurantType.remove(at: indexPath.row)
            self.restaurantIsVisited.remove(at: indexPath.row)
            self.restaurantImgs.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        deleteAction.backgroundColor = UIColor(red:0.933, green:0.502, blue:0.463, alpha:1.000)
        
        return [deleteAction, shareAction]
    }

}

