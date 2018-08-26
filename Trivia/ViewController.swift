//
//  ViewController.swift
//  Trivia
//
//  Created by Kendall Poindexter on 8/23/18.
//  Copyright © 2018 Kendall Poindexter. All rights reserved.



// Create a trivia game application consisting of at least 8 questions
//If the user guesses a question correctly, the background of the app should flash green, and the user should be taken to the next question
//If the user chooses an incorrect answer, the background of the app should flash red, and that answer should be disabled
//If the user gets more than 3 questions wrong, the user should lose the game
//At the end of the game, your app should show the user their score
//The user should be able to start over when the game ends

import UIKit

class ViewController: UIViewController {
    
    //MARK: - IBOutlets

    @IBOutlet weak var outputQuestions: UILabel!
    @IBOutlet weak var userAnswer: UITextField!
    @IBOutlet weak var outputScore: UILabel!
    @IBOutlet weak var disableButton: UIButton!
    
    //MARK: - Properties
    
   static var questionsAndAnswers: [(question: String, answer: String)] = [
        (question: "What is the biggest land animal on Earth?", answer: "Elephant"),
        (question: "What is the fastest animal on Earth?", answer: "Cheetah"),
        (question: "What is the largest rodent in the world?", answer: "Capybara"),
        (question: "What is the largest lizard on Earth", answer: "Komodo dragon")
    ]
    var randomIndex = ViewController.generateRandomNumber()
    var score = 0
    var wrongAnswer = 0
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        outputRandomQ()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Actions
    
    
    //MARK: - Methods
    
    static func generateRandomNumber() -> Int {
        let randomNumber = Int(arc4random_uniform(UInt32(ViewController.questionsAndAnswers.count)))
        return randomNumber
    }
    func outputRandomQ() {
        // Step 1: Recalculate randomIndex
        randomIndex = ViewController.generateRandomNumber()
        
        // Step 2: Pick new QnA with randomIndex
        let randomQuestion = ViewController.questionsAndAnswers[randomIndex].question
        
        outputQuestions.text = randomQuestion
    }
    
    func removeSeenQnA() {
        // Remove the QnA that we just saw
        ViewController.questionsAndAnswers.remove(at: randomIndex)
    }
    
    func isAnswerCorrect() -> Bool {
        let answer = ViewController.questionsAndAnswers[randomIndex].answer
        if answer == userAnswer.text {
            return true
        } else {
            return false
        }
       
    }
    
    func updateQuestion() {
        userAnswer.text = ""
        if ViewController.questionsAndAnswers.count > 0 {
            removeSeenQnA()
            outputRandomQ()
        }
        
    }
    
    func flashGreen() {
        UIView.animate(withDuration: (0.5), animations: {
            self.view.backgroundColor = UIColor.green
        }, completion: { didAnimateGreen in
            if didAnimateGreen == true {
               self.view.backgroundColor = UIColor.white
            }
        })
        
    }
    
    func flashRed() {
        UIView.animate(withDuration: (0.5), animations: {
            self.view.backgroundColor = UIColor.red
        }) { (didAnimateRed) in
            if didAnimateRed == true {
                self.view.backgroundColor = UIColor.white
            }
        }
    }
    
    func notifyUserOfResults() {
        
        
        if isAnswerCorrect() == true {
            flashGreen()
            score+=1
        }
        
        if isAnswerCorrect() == false {
            flashRed()
            score-=1
            wrongAnswer+=1
        }
        
        if ViewController.questionsAndAnswers.count == 0 {
            outputScore.text = String(score)
        }
        
        if score >= 3 && ViewController.questionsAndAnswers.count == 0 {
          outputQuestions.text = "You Win"
            disableButton.isEnabled = false
        
        } else if wrongAnswer > 3 {
            outputQuestions.text = "You Lose"
            disableButton.isEnabled = false
        }
    }
    
    @IBAction func submitTapped(_ sender: UIButton) {
        notifyUserOfResults()
        updateQuestion()
       
       
    }
    
    

}

