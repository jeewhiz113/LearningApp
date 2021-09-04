//
//  Models.swift
//  LearningApp
//
//  Created by Jee Zhou on 9/3/21.
//

import Foundation

struct Module: Decodable, Identifiable {    //For a module, we have an id number, category and a Content object, which contains an array of lesssons, a Test object which contains an array of questions.
    var id : Int
    var category: String
    var content : Content  //content variable is a single content object
    var test: Test
}

struct Content: Decodable, Identifiable {  //each content contains these properties with a lessons array
    var id: Int
    var image : String
    var time: String
    var description: String
    var lessons: [Lesson]  //lessons variable is an array of Lesson structs
}

struct Lesson: Decodable, Identifiable {  //each lesson contains these fields
    var id : Int
    var title : String
    var video : String
    var duration: String
    var explanation: String
}

struct Test : Decodable, Identifiable {  //Test is exactly that
    var id : Int
    var image : String
    var time: String
    var description: String
    var questions: [Question]
}

struct Question : Decodable, Identifiable {  //in the question struct, the model is also precisely that
    //Note, for this Question struct or any other struct, if the property name does not match, so say we have var answer : [String], then the decoder fails.  This can be a very annoy bug to spot and fix!
    var id: Int
    var content : String
    var correctIndex: Int
    var answers: [String]
}
