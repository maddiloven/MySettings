//
//  ViewController.swift
//  MySettings
//
//  Created by Maddi Loven on 10/24/21.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var txtFullName: UITextField!
    
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var datepicker: UIDatePicker!
    
    @IBOutlet weak var txtPhoneNumber: UITextField!
    
    @IBOutlet weak var txtUsername: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    
    @IBAction func btnSave(_ sender: UIButton) {
        let defaults: UserDefaults = UserDefaults.standard
            defaults.set(self.txtFullName.text, forKey: "fullname")
            defaults.set(self.txtEmail.text, forKey: "email")
            defaults.set(self.txtPhoneNumber.text, forKey: "phonenumber")
            defaults.set(self.txtUsername.text, forKey: "username")
            defaults.set(self.txtPassword.text, forKey: "password")
              let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM d, yyyy" //Your New Date format as per requirement change it own
            let newDate = dateFormatter.string(from:datepicker.date) //pass Date here
            defaults.set(newDate, forKey: "bdate")
            print(datepicker.date.description)
            defaults.synchronize()
            clear()
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Do any additional setup after loading the view.
        let defaults: UserDefaults = UserDefaults.standard
              if defaults.string(forKey: "fullname") != nil{
                    txtFullName.text = defaults.string(forKey: "fullname")
              }
        
              if defaults.string(forKey: "email") != nil{
                  txtEmail.text = defaults.string(forKey: "email")
              }
        
              if defaults.string(forKey: "phonenumber") != nil{
                  txtPhoneNumber.text = defaults.string(forKey: "phonenumber")
              }
        
              if defaults.string(forKey: "username") != nil{ txtUsername.text = defaults.string(forKey: "username")
              }
        
              if defaults.string(forKey: "password") != nil{ txtPassword.text = defaults.string(forKey: "password")
              }
        
              if defaults.string(forKey: "bdate") != nil{
                  let bdate  = defaults.string(forKey: "bdate")
                  let dateFormatter = DateFormatter()
                  dateFormatter.dateFormat = "MMM d, yyyy" //Your date format
                  let date = dateFormatter.date(from: bdate!) //according to date format your date string
                  datepicker.setDate(date!, animated: true)
              }
    }

    func clear()
    {
     txtEmail.resignFirstResponder()
     txtFullName.resignFirstResponder()
     txtPhoneNumber.resignFirstResponder()
     txtUsername.resignFirstResponder()
     txtPassword.resignFirstResponder()
     }

}

