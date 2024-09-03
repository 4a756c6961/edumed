//
//  QuestionData2ViewController.swift
//  Edu-Med
//
//  Created by Julia on 08.03.24.
//

import UIKit

class QuestionData2ViewController: UIViewController {

    var questiondata2 = QuestionData2()
    var quizManager2 = QuizManager()
    var datamanager2 = DataManager()
    var feedback = UIImpactFeedbackGenerator(style: .heavy)
    var currentQuestionIndex = 0
    var highscore2 = 0

    // MARK: - Outlets
    @IBOutlet weak var questionLabel2: UILabel!
    @IBOutlet weak var option1_2: UIButton!
    @IBOutlet weak var option2_2: UIButton!
    @IBOutlet weak var option3_2: UIButton!
    @IBOutlet weak var option4_2: UIButton!
    @IBOutlet weak var progressBar2: UIProgressView!

    // MARK: - Actions

    @IBAction func answerButtontapped(_ sender: UIButton) {
        if questiondata2.checkAnswer(sender.currentTitle!) {
            feedback.impactOccurred()
            sender.tintColor = UIColor.green
        } else {
            feedback.impactOccurred()
            sender.tintColor = UIColor.red
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            if self.questiondata2.isFinish() {
                self.presentQuizEndAlert()
            } else{
                self.questiondata2.nextQuestion()
                print("Current question number: \(self.questiondata2.questionNumber2)")
                self.updateUserInterface()
            }
        }
    }

    func updateUserInterface() {
        questionLabel2.text = questiondata2.ernährungsquiz[questiondata2.questionNumber2].text
        option1_2.setTitle(questiondata2.ernährungsquiz[questiondata2.questionNumber2].answer[0], for: .normal)
        option2_2.setTitle(questiondata2.ernährungsquiz[questiondata2.questionNumber2].answer[1], for: .normal)
        option3_2.setTitle(questiondata2.ernährungsquiz[questiondata2.questionNumber2].answer[2], for: .normal)
        option4_2.setTitle(questiondata2.ernährungsquiz[questiondata2.questionNumber2].answer[3], for: .normal)

        // Setzt die Farbe des Buttons zurück
        option1_2.tintColor = UIColor.orange
        option2_2.tintColor = UIColor.orange
        option3_2.tintColor = UIColor.orange
        option4_2.tintColor = UIColor.orange

        progressBar2.progress = questiondata2.getProgress()
    }

    func presentQuizEndAlert() {
        let alert = UIAlertController(title: "Glückwunsch, du hast das Quiz beendet!", message: "Möchtest du das Quiz wiederholen?", preferredStyle: .alert)

        let repeatAction = UIAlertAction(title: " JA!!!", style: .default) { (alertAction) in
            self.quizManager2.restartQuiz()
            self.currentQuestionIndex = 0
            self.updateUserInterface()
        }
        let cancelAction = UIAlertAction(title: "NEIN", style: .cancel) { (alertAction) in
            self.performSegue(withIdentifier: "HomeViewController", sender: nil)
            //DataManager.shared.updateHighScore(highscore: self.highscore2)
        }

        alert.addAction(repeatAction)
        alert.addAction(cancelAction)

        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUserInterface()
    }
}
