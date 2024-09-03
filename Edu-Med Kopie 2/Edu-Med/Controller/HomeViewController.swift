//
//  HomeViewController.swift
//  Edu-Med
//
//  Created by Julia on 17.10.23.
//

import UIKit
import CoreData

class HomeViewController: UIViewController {
    
    //MARK: - Variablen
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let dataManager = DataManager.shared
    
    //MARK: - Outlets
    @IBOutlet weak var UserNameTextField: UILabel!
    @IBOutlet weak var klasseTextield: UILabel!
    @IBOutlet weak var hightscoreQD1TextField: UILabel!
    @IBOutlet weak var highscoreQD2TextField: UILabel!
    @IBOutlet weak var highscoreQD3Textfield: UILabel!
    
    //MARK: - Actions
    @IBAction func LogutButton(_ sender: UIButton) {
    }
    
    //MARK: - Funktionen
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUserName()
        updateKohorte()
        updateHighscore1()
        }
     
    func updateUserName() {
          
           if let user = dataManager.fetchUser() {
               UserNameTextField.text = user.name
           } else {
               // Handle the case when the user is not found in CoreData
               print("Benutzer nicht gefunden.")
           }
       }
    func updateKohorte(){
        
        if let user = dataManager.fetchUser() {
            klasseTextield.text = user.klasse
        } else {
            print("Kohorte nicht gefunden.")
        }
    }
    func updateHighscore1(){
        
        if let highscore1 = dataManager.fetchHighscore() {
            let highscore1String = String(highscore1.highscore1)
            hightscoreQD1TextField.text = highscore1String
        } else {
            print("Kein Highscore gefunden")
        }
}
    }


