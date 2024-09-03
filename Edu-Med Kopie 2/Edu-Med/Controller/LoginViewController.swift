//
//  LoginViewController.swift
//  Edu-Med
//
//  Created by Julia on 17.10.23.
//

import UIKit
import CoreData

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let dataManager = DataManager.shared
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // wandelt das Texfield zum Securetextfield um
                passwordTextField.isSecureTextEntry = true
    }
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        guard let email = emailTextField.text, let password = passwordTextField.text else {
      
            return
        }
        // Versuchen, einen Benutzer mit der eingegebenen E-Mail-Adresse aus der CoreData zu finden
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "email == %@", email)

        do {
            let users = try context.fetch(fetchRequest)
            if let user = users.first {
                // Benutzer mit dieser E-Mail-Adresse gefunden
                if user.password == password {
                    // Passwort ist korrekt
                 print("Login möglich")
                }
            else {
                    // Falsches Passwort
                    showAlert(message: "Falsches Passwort")
                }
            } else {
                // Benutzer mit dieser E-Mail-Adresse nicht gefunden
                showAlert(message: "E-Mail des Benutzers nicht gefunden")
            }
        } catch {
            // Fehler bei der Abfrage
            print("Fehler beim Abfragen der Benutzer: \(error)")
        }
    }
    func showAlert(message: String) {
        let alertController = UIAlertController(title: "Fehler", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
     override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
