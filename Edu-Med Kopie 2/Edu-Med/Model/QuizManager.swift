//
//  QuizManager.swift
//  Edu-Med
//
//  Created by Julia on 07.12.23.
//

import Foundation
import UIKit

class QuizManager {
    lazy var feedback = UIImpactFeedbackGenerator(style: .heavy)
    var questionData1 = QuestionData1()
    var questionData2 = QuestionData2()
    var questionData3 = QuestionData3()
    var currentQuestionIndex = 0
    var totalQuestions: Int = 0
       

    // MARK: - Funktionen
    func updateProgressBar(currentQuestionIndex: Int, totalQuestions: Int) -> Float {
        return Float(currentQuestionIndex + 1) / Float(totalQuestions)
    }

   func isFinish() -> Bool {
        if currentQuestionIndex >= totalQuestions {
            // Quiz ist beendet
            let alert = UIAlertController(title: "Glückwunsch, du hast das Quiz beendet!", message: "Möchtest du das Quiz wiederholen?", preferredStyle: .alert)
            
            let repeatAction = UIAlertAction(title: "Ja", style: .default) { (alertAction) in
                // Hier wird die Methode restartQuiz() aufgerufen
                self.restartQuiz()
            }
            let noAction = UIAlertAction(title: "Nein", style: .default) { (alertAction) in
            }
            
            alert.addAction(repeatAction)
            alert.addAction(noAction)
            
            // Hier den aktuellen ViewController referenzieren und den Alert anzeigen
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let window = windowScene.windows.first,
               let rootViewController = window.rootViewController {
                   rootViewController.present(alert, animated: true, completion: nil)
            }
            
            return true
        } else {
            return false
        }
    }
    func restartQuiz() {
        currentQuestionIndex = 0
        questionData1.correctQuestions = 0
        questionData1.wrongQuestions = 0
    }
    func setButtonColor(button: UIButton, color: UIColor) {
            button.backgroundColor = color
        }
    }
