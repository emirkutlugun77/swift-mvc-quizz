//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Emir Kutlugun on 31.05.2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain{
    var questions:[Question];
    var progressSlice:Int;
    var progress=0;
    var trueCount=0;
    init(questions:[Question]) {
        self.questions=questions;
        self.progressSlice=questions.count;
    }
    
    //function below will trigger after every answer
    func getProgress()->Float{
        
        return Float(self.progress)/Float(self.progressSlice);
    }
    mutating func answerQuestion(answer:Bool,questionIndex:Int)->Bool{
        self.progress+=1;
        if(self.questions[questionIndex].answer==answer){
            self.trueCount+=1;
            return true;
        }
        else{
            return false;
        }
       
    }
    mutating func reset(){
        self.progress=0;
        self.trueCount=0;
        
    }
    
}

