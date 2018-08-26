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
    
    //MARK: - Properties
    
    var questionsAndAnswers: [(question: String, answer: String)] = [
        (question: "What is the biggest land animal on Earth?", answer: "Elephant"),
        (question: "What is the fastest animal on Earth?", answer: "Cheetah"),
        (question: "What is the largest rodent in the world?", answer: "Capybara"),
        (question: "What is the largest lizard on Earth", answer: "Komodo dragon")
    ]
    var randomNumber = Int(arc4random_uniform(2))
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Actions
    
    
    //MARK: - Methods
    
    

}

