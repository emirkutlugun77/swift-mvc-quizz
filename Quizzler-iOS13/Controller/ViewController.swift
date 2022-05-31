//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//


import UIKit

var questions: [Question] = [
    Question(question: "The Big Apple is a nickname given to Washington D.C in 1971.", answer: false),
    Question(question: "Muddy York is a nickname for New York in the Winter.", answer: false),
    Question(question: "Peanuts are not nuts!", answer: true),
    Question(question: "People may sneeze or cough while sleeping deeply.", answer: false),
    Question(question: "Copyrights depreciate over time.", answer: true),
    Question(question: "Emus can’t fly.", answer: true),
    Question(question: "Electrons move faster than the speed of light.", answer: false),
    Question(question: "Light travels in a straight line.", answer: true),
    Question(question: "The Mona Liza was stolen from the Louvre in 1911.", answer: true),
    Question(question: "Janet Jackson performed at halftime of Super Bowl LV.", answer: false),];

class ViewController: UIViewController {
    var count:Int=0;
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    var quizBrain:QuizBrain=QuizBrain(questions: questions);
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text=questions[0].questionText;
        progressBar.progress=quizBrain.getProgress();
        // Do any additional setup after loading the view.
    }
  
 
   
    @IBAction func buttonPress(_ sender: UIButton) {
        let check=quizBrain.answerQuestion(answer: sender.currentTitle=="True" ? true:false, questionIndex: count);
        blink(check: check);
        if(!(count==quizBrain.questions.count-1)){
            count+=1;
            questionLabel.text=quizBrain.questions[count].questionText;
        }
        else{
            questionLabel.text=String(quizBrain.trueCount)+"/"+String(quizBrain.progressSlice) + " is your score congrats! \ngame will restart in 5";
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) { [self] in
               
                self.quizBrain.reset();
                self.count=0;
                self.questionLabel.text=self.quizBrain.questions[self.count].questionText;
                self.progressBar.progress=self.quizBrain.getProgress();
            }
        }
       
       
        progressBar.progress=quizBrain.getProgress();
    }
    
    

    

    
    func blink(check:Bool) {
     
        let color: UIColor = check ? UIColor(red: 0, green: 100, blue: 0, alpha: 1):UIColor(red: 100, green: 0, blue: 0, alpha: 1);
        runBlink(with: color)
    }

    func runBlink(with color: UIColor) {
        let currentColor:UIColor=self.view.backgroundColor ?? UIColor(red:0,green: 0,blue:0,alpha: 1);
       let color = color ;
        UIView.animate(withDuration: 0.35, delay: 0, options: .curveLinear, animations: {
            self.view.backgroundColor = color
        }, completion: { finished in
            if finished {
                self.view.backgroundColor=currentColor;
            }
        })
    }
}

