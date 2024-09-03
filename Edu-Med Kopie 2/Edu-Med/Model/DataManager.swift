//
//  DataManager.swift
//  Edu-Med
//
//  Created by Julia on 03.11.23.
//

import Foundation
import CoreData
import UIKit


class DataManager: ObservableObject {
    
    static let shared = DataManager()
        let context:NSManagedObjectContext!
    
    //Array mit Users aus dem Speicher
    var user = [NSManagedObject]()
    
    //dieser ist nur innerhalb der Klasse DataManager aurufbar dieser soll bei der Speicherung der Nutzerdaten helfen
     init() {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
        //speichert die Nutzerdaten beim Start der Quizapp
        saveUser()
        // lädt die Nutzerdaten
        loadUser()
    }
    // MARK: - Funktionen zum Laden und Speichern von Nutzern
    
    func loadUser(){
        let request: NSFetchRequest<User> = NSFetchRequest<User>(entityName: "User")
        
        do {
            let user = try context.fetch(request)
            self.user = user
            print("Load")
        } catch  {
            print(error.localizedDescription)
        }
        
    }
    
    // MARK: - Save Methoden
    
    func saveUser( email: String, password: String,name: String, klasse: String, pid: UUID) {
        let userEntity = NSEntityDescription.entity(forEntityName: "User", in: context)
        
        let user = User(entity: userEntity!, insertInto: context)
        
        user.pid = pid
        user.email = email
        user.password = password
        user.name = name
        user.klasse = klasse
        
        do {
                try context.save()
                print("Save")
            } catch {
                print("Error saving user: \(error.localizedDescription)")
            }
    }
    
    func saveUser() {
        
        guard user.isEmpty else {
            
            return
        }
    
        if let uuid = UUID(uuidString: "550e8400-e29b-41d4-a716-446655440000") {
            saveUser(
                email: "user@test.com",
                password: "123456789",
                name: "User Test",
                klasse: "Testklasse",
                pid: uuid
            )
        } else {
            print("Ungültiges UUID-Format")
        }
    }
      
    func saveHighScore(highscore1: Float, highscore2: Float, highscore3: Float) {
        if let highScoreEntity = NSEntityDescription.entity(forEntityName: "HighScore", in: context) {
            let highscore = HighScore(entity: highScoreEntity, insertInto: context)
            
            highscore.highscore1 = highscore1
            highscore.highscore2 = highscore2
            highscore.highscore3 = highscore3
            
            do {
                try context.save()
                print("Highscore saved")
            } catch {
                print("Error saving highscore: \(error.localizedDescription)")
            }
        } else {
            print("Entity 'HighScore' konnte nicht erstellt werden.")
        }
    }

    func saveHighScore() {
        saveHighScore(highscore1: 0, highscore2: 0, highscore3: 0)
    }

    // MARK: - Requests
    func fetchUser() -> User? {
           let request: NSFetchRequest<User> = NSFetchRequest<User>(entityName: "User")

           do {
               // lädt hier den ersten Nutzer, da es nur einen Nutzer gibt
               // bei einer größeren Anzahl an Nutzern muss diese angepasst werden
               let users = try context.fetch(request)
               return users.first
           } catch {
               print("Error fetching user: \(error.localizedDescription)")
               return nil
           }
       }
    
    func fetchHighscore() -> HighScore? {
        let request: NSFetchRequest<HighScore> = NSFetchRequest<HighScore>(entityName: "HighScore")
        
        do {
            
            let highscore = try context.fetch(request)
             return highscore.first
        } catch {
            print("Error fechting highscore:\(error.localizedDescription)")
            return nil
        }
        
    }
}
