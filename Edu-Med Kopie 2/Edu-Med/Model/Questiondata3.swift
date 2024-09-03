//
//  Questiondata3.swift
//  Edu-Med
//
//  Created by Julia on 08.10.23.
//

import Foundation
struct QuestionData3 {
    
    var questionNumber3 = 0
    var correctQuestions3 = 0
    var wrongQuestions3 = 0
    let neuroquiz = [
        Question(text: "Worüber werden elektrische Reize weitergeleitet?", answer: ["Oxon", "Axon", "Uxon","Ixon"], cAnswer: "Axon"),
        Question(text: "Welchen Anteil des gesamten Energieverbrauchs benötigt unser Gehirn?", answer: ["5 % der gesamten Energie","10 % der gesamten Energie", "20 % der gesamten Energie","Das Gehirn braucht keine Energie"], cAnswer: "20 % der gesamten Energie"),
        Question(text: "Welches Areal ist für Atmung verantwortlich", answer: ["Großhirn", "Zwischenhirn", "Mittelhirn","Hirnstamm"], cAnswer: "Hirnstamm"),
        Question(text: "Welche Hirnhälfte ist für die Mathematik zuständig?", answer: ["rechte Seite", "linke Seite", "Beide Seiten","keine"], cAnswer: "linke Seite"),
        Question(text: "Welche Hirnhälfte ist für die Phantasie zuständig?", answer: ["rechte Seite","linke Seite","beide Seiten","keine"], cAnswer: "rechte Seite"),
        Question(text: "Wo sitzt unser Bewusstsein", answer: ["Zwischenhirn","Großhirn","Mittelhirn","Hinterhirn"], cAnswer: "Großhirn"),
        Question(text: "Durch was wird eine Meningitis ausgelöst?", answer: ["Sturz auf den Kopf","Baktieren","Viren","durch thermische Einflüsse"], cAnswer: "Baktieren"),
        Question(text: "Was ist keine Funktion des Liquor?", answer: ["Schutz","Ernährung","Volumenausgleich","Wärmeregulation"], cAnswer: "Volumenausgleich"),
        Question(text: "Wie wird eine Gedächnislücke bezeichnet?", answer: ["Apraxie","Agraphie","Amnesie","Alexie"], cAnswer: "Amnesie"),
        Question(text: "Wie werden Informationen im Zentralnervensystem weitergeleitet?", answer: ["elektrisch","chemisch","chemisch und elektrisch","mechanisch" ], cAnswer: "chemisch")
    ]
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        if userAnswer == neuroquiz[questionNumber3].cAnswer {
            correctQuestions3 += 1
            return true
        } else {
            wrongQuestions3+=1
            return false
        }
    }
    mutating func nextQuestion() {
        if questionNumber3 + 1 < neuroquiz.count {
        questionNumber3+=1
        } else {
            questionNumber3 = 0
            print("Correct Questions: \(correctQuestions3)")
            print("Wrong Questions: \(wrongQuestions3)")
            correctQuestions3=0
            wrongQuestions3=0
        }
        
    }
    func getProgress() -> Float {
        return Float (questionNumber3)/Float(neuroquiz.count)
    }
    
    func isFinish() -> Bool {
        return questionNumber3 >= neuroquiz.count
    }
}
