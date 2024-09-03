//
//  Questiondata2.swift
//  Edu-Med
//
//  Created by Julia on 08.10.23.
//

import Foundation
struct QuestionData2 {
    
    var questionNumber2 = 0
    var correctQuestions2 = 0
    var wrongQuestions2 = 0
   
    
    let ernährungsquiz = [
        Question(text: "Welche tägliche Menge an Obst und Gemüse empfiehlt die WHO?", answer: ["150g", "300g", "400g","800g"], cAnswer: "400g"),
        Question(text: "Mit welcher Spinatzubereitung deckt man seinen Vitamin-A-Bedarf am besten ab?", answer: ["Rahmspinat","Spinat mit Frischkäse", "Spinat ohne Zusatz","stark gesalzener Spinat"], cAnswer: "Rahmspinat"),
        Question(text: "Worum handelt es sich bei Cellulose, Lignin und Pektin?", answer: ["Eiweiße", "Fette", "Ballaststoffe","Vitamine"], cAnswer: "Ballaststoffe"),
        Question(text: "Der Mangel an welchem Spurenelement kann zu einer krankhaften Vergrößerung der Schilddrüse führen?", answer: ["Eisen", "Jod", "Fluor","Magnesium"], cAnswer: "Jod"),
        Question(text: "Wie können Keime in Nahrungsmitteln am effektivsten abgetötet werden?", answer: ["durch Abkochen","durch Einfrieren","durch Abwaschen","durch Lagerung"], cAnswer: "durch Abkochen"),
        Question(text: "Worüber gibt die Typenbezeichnung bei Mehl Auskunft?", answer: ["Verträglichkeit für Allergiker","Getreidesorte","Mineralstoffgehalt","Glutengehalt"], cAnswer: "Mineralstoffgehalt"),
        Question(text: "Können Vitamine in zu großen Mengen schädlich sein?", answer: ["Nein.","Ja, aber nur fettlösliche Vitamine.","Ja, aber nur wasserlösliche Vitamine","Nur eine bestimmte Art Vitamine."], cAnswer: "Ja, aber nur fettlösliche Vitamine."),
        Question(text: "Welches Nahrungsmittel enthält die meisten für den menschlichen Körper positiv verwertbaren Omega-3-Fettsäuren?", answer: ["Rindfleisch","Oliven","Fisch","Eiscreme"], cAnswer: "Fisch"),
        Question(text: "Was kann mithilfe der 'Harris-Benedict-Formel' ermittelt werden?", answer: ["Kalorienbedarf","Idealgewicht","Gesundheitszustand","Lebenserwartung"], cAnswer: "Kalorienbedarf"),
        Question(text: "Wie viel Flüssigkeit in Form von Getränken sollte ein Erwachsener täglich mindestens zu sich nehmen?", answer: ["0,5l","1,5l","3,0l","5,5l" ], cAnswer: "1,5l")
    ]
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        if userAnswer == ernährungsquiz[questionNumber2].cAnswer {
            correctQuestions2 += 1
            return true
        } else {
            wrongQuestions2+=1
            return false
        }
    }
    
    mutating func nextQuestion() {
        if questionNumber2 + 1 < ernährungsquiz.count {
        questionNumber2+=1
        } else {
            questionNumber2 = 0
            print("Correct Questions: \(correctQuestions2)")
            print("Wrong Questions: \(wrongQuestions2)")
            correctQuestions2=0
            wrongQuestions2=0
        }
        
    }
    func getProgress() -> Float {
        return Float (questionNumber2)/Float(ernährungsquiz.count)
    }
    
    func isFinish() -> Bool {
        return questionNumber2 > ernährungsquiz.count
    }
}
