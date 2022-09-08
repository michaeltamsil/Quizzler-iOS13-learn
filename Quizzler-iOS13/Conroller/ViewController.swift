//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }


    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle! // True, False
        quizBrain.checkAnswer(userAnswer)
        
        if userAnswer == actualAnswer {
            print("Right!")
            sender.backgroundColor = .green
        }else {
            sender.backgroundColor = .red
        }
        questionNumber += 1
        if (quiz.count < ( questionNumber + 1) ) {
            questionNumber = 0
        }
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc  func updateUI(){
        questionLabel.text = quiz[questionNumber].text
        trueButton.backgroundColor = .clear
        falseButton.backgroundColor = .clear
        print(questionNumber)
        print(quiz.count)
        print(" nilai : \( Float(questionNumber) / Float(quiz.count) )")
        progressBar.progress = Float(questionNumber + 1) / Float(quiz.count)
    }
}

