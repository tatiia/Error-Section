//
//  ViewController.swift
//  Error&Section
//
//  Created by Tatia on 19.03.21.
//

import UIKit

enum LoginErrors : Error {
    case notCompletedFilled
    case notEmailFormat
    case shortPassword
}

class ViewController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signIn(_ sender: UIButton) {
        
        do {
            try Login()
        } catch LoginErrors.notCompletedFilled {
            myAlert.showAlert(title: "არასრული მონაცემები", message: "გთხოვთ შეავსოთ ყველა ველი", vc: self)
        } catch LoginErrors.notEmailFormat {
            myAlert.showAlert(title: "არასწორი მეილი", message: "შეიყვანეთ მეილი სწორად", vc: self)
        } catch LoginErrors.shortPassword {
            myAlert.showAlert(title: "მოკლე პაროლი", message: "შეიყვანეთ უფრო გრძელი პაროლი", vc: self)
        } catch {
            myAlert.showAlert(title: "Error", message: "Other Error", vc: self)
        }
        
        let second = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "OddEvenViewController") as! OddEvenViewController
        self.navigationController?.pushViewController(second, animated: true)
        
    }
    
    func Login() throws {
        let email = emailField.text!
        let password = passwordField.text!
        
        if email.count == 0 || password.count == 0 {
            throw LoginErrors.notCompletedFilled
        }
        
        if !isValidEmail(email: email) {
            throw LoginErrors.notEmailFormat
        }
        
        if password.count < 8 {
            throw LoginErrors.shortPassword
        }
    }
    
    func isValidEmail(email: String) -> Bool {
        let emailRegEx = "([a-zA-Z0-9_\\-\\.]+)@([a-zA-Z0-9_\\-\\.]+)\\.([a-zA-Z]{2,5})"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
}

