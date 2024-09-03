//
//  QuestionData3ViewController.swift
//  Edu-Med
//
//  Created by Julia on 05.12.23.
//

import UIKit

class QuestionData3ViewController: UIViewController {
    
    var questiondata3 = QuestionData3()
    var quizmanager3 = QuizManager()
    var feedback = UIImpactFeedbackGenerator(style: .heavy)
    var currentQuestionIndex = 0
    var highscore3 = 0
    
    //MARK:- Outlets
    @IBOutlet weak var questionLabel3: UILabel!
    @IBOutlet weak var option1_3: UIButton!
    @IBOutlet weak var option2_3: UIButton!
    @IBOutlet weak var option3_3: UIButton!
    @IBOutlet weak var option43: UIButton!
    
    @IBOutlet weak var progressBar3: UIProgressView!
        
    @IBAction func answerTappedButton3(_ sender: UIButton) {
        
        print("Button Title: \(sender.currentTitle ?? "nil")")
        if questiondata3.checkAnswer(sender.currentTitle!) {
            feedback.impactOccurred()
            sender.tintColor = UIColor.green
        } else {
            feedback.impactOccurred()
            sender.tintColor = UIColor.red
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.questiondata3.nextQuestion()
            self.updateUserInterface()
        }
        
    }
    
    // MARK: - Actions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUserInterface()
        
        // Do any additional setup after loading the view.
    }
    
    func updateUserInterface() {
        questionLabel3.text = questiondata3.neuroquiz[questiondata3.questionNumber3].text
        option1_3.setTitle(questiondata3.neuroquiz[questiondata3.questionNumber3].answer[0], for: .normal)
        option2_3.setTitle(questiondata3.neuroquiz[questiondata3.questionNumber3].answer[1], for: .normal)
        option3_3.setTitle(questiondata3.neuroquiz[questiondata3.questionNumber3].answer[2], for: .normal)
        option43.setTitle(questiondata3.neuroquiz[questiondata3.questionNumber3].answer[3], for: .normal)
        
        // Setzt die Farbe des Buttons zurück
        option1_3.tintColor = UIColor.orange
        option2_3.tintColor = UIColor.orange
        option3_3.tintColor = UIColor.orange
        option43.tintColor = UIColor.orange
        
        progressBar3.progress = questiondata3.getProgress()
        
        if questiondata3.isFinish() {
            let alert = UIAlertController(title: "Glückwunsch, du hast das Quiz beendet!\u{1F389}", message: "Möchtest du das Quiz wiederholen?", preferredStyle: .alert)
            
            let repeatAction = UIAlertAction(title: " \u{1F60D} JA!!!", style: .default) { (alertAction) in
                self.quizmanager3.restartQuiz()
                self.currentQuestionIndex = 0
                self.updateUserInterface()
            }
            
            alert.addAction(repeatAction)
            
            present(alert, animated: true, completion: nil)
            
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
}

