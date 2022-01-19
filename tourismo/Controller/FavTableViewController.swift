//
//  FavTableViewController.swift
//  pro5
//
//  
//

import UIKit

class FavTableViewController: UITableViewController {
    var currentFavorite:Attraction?=nil
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = 200
        self.navigationItem.title = "My Favorites"

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return UserData.shared.userList[UserDefaults.standard.integer(forKey: "ID")].favList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Favcell", for: indexPath) as! FavTableViewCell

        if(UserData.shared.userList[UserDefaults.standard.integer(forKey: "ID")].favList.isEmpty) {
            cell.lblName.text = ""
            cell.lblPrice.text = ""
            return cell
        } else {
                // Configure the cell...
                //print(UsersDB.shared.usersList[UserDefaults.standard.integer(forKey: "User_Counter")].favoritesList.count)
            currentFavorite = UserData.shared.userList[UserDefaults.standard.integer(forKey: "ID")].favList[indexPath.row]
            cell.lblName.text = currentFavorite?.attractionName
            cell.lblPrice.text = "Price: $\(currentFavorite!.price) / person"
            cell.imgPhoto.image = UIImage(named: currentFavorite!.imageFileID)
            
                return cell
            
            }
            
        }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            for var i in 0..<AttractionsDB.shared.attractionsList.count{
                if(UserData.shared.userList[UserDefaults.standard.integer(forKey: "ID")].favList[indexPath.row].id==AttractionsDB.shared.attractionsList[i].id)
                {
                    AttractionsDB.shared.attractionsList[i].favd=false
                }
            }
            UserData.shared.userList[UserDefaults.standard.integer(forKey: "ID")].favList.remove(at: (indexPath.row))
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    @IBAction func deleteFavorites(_ sender: Any) {
        
        
        UserData.shared.userList[UserDefaults.standard.integer(forKey: "ID")].favList.removeAll()
        for var i in 0..<AttractionsDB.shared.attractionsList.count{
                AttractionsDB.shared.attractionsList[i].favd=false
            
        }
        tableView.reloadData()
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
