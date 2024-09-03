//
//  QuestionData1ViewController.swift
//  Edu-Med
//
//  Created by Julia on 11.02.24.
//

import UIKit

class QuestionData1ViewController: UIViewController {
    
    var questiondata1 = QuestionData1()
    var quizmanager1 = QuizManager()
    var feedback = UIImpactFeedbackGenerator(style: .heavy)
    var currentQuestionIndex = 0
    var highscore1 = 0
    
    @IBOutlet weak var questionLabel1: UILabel!
    @IBOutlet weak var optionOne: UIButton!
    @IBOutlet weak var optionTwo: UIButton!
    @IBOutlet weak var optionThree: UIButton!
    @IBOutlet weak var optionFour: UIButton!
    @IBOutlet weak var progressBar1: UIProgressView!
    
    
    @IBAction func answerButtontapped(_ sender: UIButton) {
        if questiondata1.checkAnswer(sender.currentTitle!) {
            feedback.impactOccurred()
            sender.tintColor = UIColor.green
        } else {
            feedback.impactOccurred()
            sender.tintColor = UIColor.red
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.questiondata1.nextQuestion()
            print("Current question number: \(self.questiondata1.questionNumber)")

            self.updateUserInterface()
        }
        
    }
    
    func updateUserInterface() {
        questionLabel1.text = questiondata1.anatomiequiz[questiondata1.questionNumber].text
        optionOne.setTitle(questiondata1.anatomiequiz[questiondata1.questionNumber].answer[0], for: .normal)
        optionTwo.setTitle(questiondata1.anatomiequiz[questiondata1.questionNumber].answer[1], for: .normal)
        optionThree.setTitle(questiondata1.anatomiequiz[questiondata1.questionNumber].answer[2], for: .normal)
        optionFour.setTitle(questiondata1.anatomiequiz[questiondata1.questionNumber].answer[3], for: .normal)
        
        // Setzt die Farbe des Buttons zurück
        optionOne.tintColor = UIColor.orange
        optionTwo.tintColor = UIColor.orange
        optionThree.tintColor = UIColor.orange
        optionFour.tintColor = UIColor.orange
        
        progressBar1.progress = questiondata1.getProgress()
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       updateUserInterface()
    
        // Do any additional setup after loading the view.
    }
    
    func isFinish() -> Bool {
        if quizmanager1.currentQuestionIndex >= quizmanager1.totalQuestions {
            // Quiz ist beendet
            let alert = UIAlertController(title: "Glückwunsch, du hast das Quiz beendet!", message: "Möchtest du das Quiz wiederholen?", preferredStyle: .alert)
            
            let repeatAction = UIAlertAction(title: "Ja", style: .default) { (alertAction) in
                // Hier wird die Methode restartQuiz() aufgerufen, falls sie in deiner QuizManager-Klasse implementiert ist
                self.quizmanager1.restartQuiz()
            }
            
            let noAction = UIAlertAction(title: "Nein", style: .default) { (alertAction) in
                // Hier könntest du den Root-Controller aufrufen, wenn gewünscht
                // Beispiel: self.navigationController?.popToRootViewController(animated: true)
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
            // Quiz ist nicht beendet, daher update die Benutzeroberfläche
            updateUserInterface()
            return false
        }
    }

    
}
        
        

    
   
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


