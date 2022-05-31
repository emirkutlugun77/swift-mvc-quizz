//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Emir Kutlugun on 31.05.2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation


struct Question{
    var questionText:String;
    var answer:Bool;
    init(question:String,answer:Bool) {
        self.answer=answer;
        self.questionText=question;
    }
}
