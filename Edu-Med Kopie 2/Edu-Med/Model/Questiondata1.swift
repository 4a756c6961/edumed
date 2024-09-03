//
//  Questiondata1.swift
//  Edu-Med
//
//  Created by Julia on 08.10.23.
//

import Foundation
import UIKit

struct QuestionData1 {
    
    var questionNumber = 0
    var correctQuestions = 0
    var wrongQuestions = 0
           
    let anatomiequiz = [ Question(text: "Welches ist das kleinste Knochen im menschlichen Körper?", answer:
                            ["Becken","Steigbügel","Schlüsselbein","Handwurzelknochen"], cAnswer: "Steigbügel"),
                         Question(text: "Was ist das schwerste menschliche Organ?", answer:["Haut","Lunge","Leber","Gehirn"], cAnswer: "Haut"),
                         Question(text: "Was zeichnet einen Menschen mit Polydaktylie aus?", answer: ["hat eine Niere", "allergisch auf Sonnenlicht", "hat mehr als 10 Finger", "ist stumm"], cAnswer: "hat mehr als 10 Finger"),
                         Question(text:"Wie viele Rippenpaare hat ein Mensch im Normalfall?" , answer: ["8", "14", "12", "10"], cAnswer: "12"),
                         Question(text: "Wo befindet sich der Ziliarmuskel beim Menschen?", answer: ["Knie", "Kiefer", "Brustkorb", "Auge"], cAnswer: "Auge"),
                         Question(text: "Wo sitzt im menschlichen Körper die Schnecke?", answer: ["Fuß", "Hand", "Schulter", "Ohr"], cAnswer: "Ohr"),
                         Question(text: "Wie viele Wirbel befinden sich beim Menschen oberhalb des Kreuzbeins?", answer: ["20", "32", "28", "24"], cAnswer: "24"),
                         Question(text: "Ein gesundes Gebiss eines Erwachsenen besteht aus wie vielen Zähnen?", answer: ["32", "38", "34", "36"], cAnswer: "32"),
                         Question(text: "Wie lang sind alle Blutgefäße im menschlichen Körper zusammengerechnet?", answer: ["10.000km", "1.000km", "100km", "100.000km"], cAnswer: "100.000km"),
                         Question(text: "Wie viele Nervenzellen besitzt das menschliche Gehirn?", answer: ["500.000","100 Milliarden","40 Billionen","70 Millionen"], cAnswer: "100 Milliarden"),
            ]
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        if userAnswer == anatomiequiz[questionNumber].cAnswer {
            correctQuestions += 1
            return true
        } else {
            wrongQuestions+=1
            return false
        }
    }
    
    mutating func nextQuestion() {
        if questionNumber + 1 < anatomiequiz.count {
        questionNumber+=1
        } else {
            questionNumber = 0
            print("Correct Questions: \(correctQuestions)")
            print("Wrong Questions: \(wrongQuestions)")
            correctQuestions=0
            wrongQuestions=0
        }
        
    }
    func getProgress() -> Float {
        return Float (questionNumber)/Float(anatomiequiz.count)
    }
    
    func isFinish() -> Bool {
        return questionNumber >= anatomiequiz.count
    }
}
