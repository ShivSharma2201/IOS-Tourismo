//
//  LoginController.swift
//  pro5
//
//  
//

import UIKit

class LoginController: UIViewController {

    @IBOutlet weak var emailEnter: UITextField!
    @IBOutlet weak var passEnter: UITextField!
    @IBOutlet weak var remSwitch: UISwitch!
    @IBOutlet weak var openImg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        UserData.shared.userList.append(User(email: "Shivam", password: "A",id:0))
        UserData.shared.userList.append(User(email: "Jospeh", password: "B",id:1))
        self.openImg.image=UIImage(named: "newyork")
        var a=UserDefaults.standard.bool(forKey: "RemME")
        if(a==true){
            goToAttractionScreen()
        }
        print("\(UserDefaults.standard.bool(forKey: "RemME"))")

        // Do any additional setup after loading the view.
    }
    
   func goToAttractionScreen() {
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let attractionVC = storyboard.instantiateViewController(withIdentifier: "Attractscreen") as! AttractTableViewController
        self.navigationController?.pushViewController(attractionVC, animated: true)

    }
    
    @IBAction func loginBtn(_ sender: Any) {
        var a:Bool=false
        for var i in 0..<UserData.shared.userList.count{
            if emailEnter.text==UserData.shared.userList[i].email && passEnter.text==UserData.shared.userList[i].password{
                UserDefaults.standard.set(UserData.shared.userList[i].id,forKey: "ID")
              a=true
            }
        }
        if a{
            UserDefaults.standard.set(emailEnter.text, forKey: "User_Email")
            UserDefaults.standard.set(passEnter.text, forKey: "User_Password")
            if(remSwitch.isOn==true){
            UserDefaults.standard.set(true,forKey: "RemME")
            }
            self.goToAttractionScreen()
        }else{
            wronglogin()
        }

    }
    func wronglogin(){
        let box = UIAlertController(title: "Error", message: "Wrong Credentials!", preferredStyle:.alert)
            box.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(box, animated: true, completion: nil)
    }
    


    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
