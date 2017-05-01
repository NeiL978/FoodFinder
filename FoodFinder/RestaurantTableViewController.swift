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
        cell.thumbnailImageView.image = restaurantImgs[indexPath.row]

        return cell
    }
    

}

