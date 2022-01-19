//
//  DetailViewController.swift
//  pro5
//
// 
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var imgPhotoOne : UIImageView!
    @IBOutlet var imgPhotoTwo : UIImageView!
    @IBOutlet var lblName : UILabel!
    @IBOutlet var lblPrice : UILabel!
    @IBOutlet var lblDescription: UILabel!
    @IBOutlet var ratingBar: UIImageView!
    @IBOutlet var ratingBarTwo: UIImageView!
    @IBOutlet var ratingBarThree: UIImageView!
    @IBOutlet var ratingBarFour: UIImageView!
    @IBOutlet var ratingBarFive: UIImageView!
    @IBOutlet var lblContact: UILabel!
    
    @IBOutlet weak var favBtn: UIButton!
    @IBOutlet weak var tickBtn: UIButton!
    @IBOutlet var btnContactNum: UIButton!
    
    
    
    
    var selectedAttraction: Attraction? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.displayAttractionInfo()
        
    
    }
    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//
//        if self.isMovingFromParent {
//            print("WOW")
//        }
//    }
    
    private func displayAttractionInfo() {
        guard let retrievedAttraction = self.selectedAttraction else {
            print("Could not get the attraction")
            self.imgPhotoOne.image = UIImage(named: "unknown_photo")
            self.imgPhotoTwo.image = UIImage(named: "unknown_photo")
            self.lblName.text = "Not Available"
            self.lblPrice.text = "Not Available"
            self.lblDescription.text = "Not Available"
            self.ratingBar.image = UIImage(named: "unknown_photo")
            self.lblContact.text = "Not Available"
            self.btnContactNum.titleLabel?.text = "Not Available"
           
            
            return
        }
        
        self.imgPhotoOne.image = UIImage(named: retrievedAttraction.imageFileIDTwo)
        self.imgPhotoTwo.image = UIImage(named: retrievedAttraction.imageFileIDThree)
        self.lblName.text = retrievedAttraction.attractionName
        self.lblPrice.text = "Price: $\(retrievedAttraction.price) / person"
        self.lblDescription.text = retrievedAttraction.description
        self.btnContactNum.titleLabel?.text = retrievedAttraction.contactNum
        
        
        
        
        
        if(retrievedAttraction.rating == 5){
            self.ratingBar.image = UIImage(named: "gold_star")
            self.ratingBarTwo.image = UIImage(named: "gold_star")
            self.ratingBarThree.image = UIImage(named: "gold_star")
            self.ratingBarFour.image = UIImage(named: "gold_star")
            self.ratingBarFive.image = UIImage(named: "gold_star")
        } else if(retrievedAttraction.rating == 4) {
            self.ratingBar.image = UIImage(named: "gold_star")
            self.ratingBarTwo.image = UIImage(named: "gold_star")
            self.ratingBarThree.image = UIImage(named: "gold_star")
            self.ratingBarFour.image = UIImage(named: "gold_star")
        } else if(retrievedAttraction.rating == 3) {
            self.ratingBar.image = UIImage(named: "gold_star")
            self.ratingBarTwo.image = UIImage(named: "gold_star")
            self.ratingBarThree.image = UIImage(named: "gold_star")
        } else if(retrievedAttraction.rating == 2) {
            self.ratingBar.image = UIImage(named: "gold_star")
            self.ratingBarTwo.image = UIImage(named: "gold_star")
        } else if(retrievedAttraction.rating == 1) {
            self.ratingBar.image = UIImage(named: "gold_star")
        } else {
            
        }
       
        
    }
    


    @IBAction func addFavorite(_ sender: Any) {
        if(self.selectedAttraction != nil) {
            for var i in 0..<UserData.shared.userList[UserDefaults.standard.integer(forKey: "ID")].favList.count{
                if(selectedAttraction?.id == UserData.shared.userList[UserDefaults.standard.integer(forKey: "ID")].favList[i].id){
                    let box = UIAlertController(title: "Error", message: "Already in Favourites!", preferredStyle:.alert)
                    box.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))
                        self.present(box, animated: true, completion: nil)
                    return
                }}
            UserData.shared.userList[UserDefaults.standard.integer(forKey: "ID")].favList.append(selectedAttraction!)
                let box = UIAlertController(title: "Success", message: "Added to Favourites!!", preferredStyle:.alert)
                    box.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                    self.present(box, animated: true, completion: nil)
        }
                else {
            print("Can't get ticket")
        }
       
    }
    
    @IBAction func addTicket(_ sender: Any) {
        if(self.selectedAttraction != nil) {

                var curtick=Ticket(curattraction: selectedAttraction!, date: Date.now)
                UserData.shared.userList[UserDefaults.standard.integer(forKey: "ID")].ticketList.append(curtick)
                let box = UIAlertController(title: "Success", message: "Ticket Booked!!", preferredStyle:.alert)
                    box.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                    self.present(box, animated: true, completion: nil)
        }
                else {
            print("Can't get ticket")
        }
    }
    
    @IBAction func contact(_ sender: Any) {

        var phoneNumberr = selectedAttraction?.contactNum ?? "1"
callNumber(phoneNumber: phoneNumberr)
        
    }
    
    private func callNumber(phoneNumber:String) {
        if let phoneCallURL = URL(string: "tel://\(selectedAttraction?.contactNum)") {
        let application:UIApplication = UIApplication.shared
        if (application.canOpenURL(phoneCallURL)) {
            application.open(phoneCallURL, options: [:], completionHandler: nil)
        }
      }
    }
    



}
