//
//  ContentModel.swift
//  LearningApp
//
//  Created by Jee Zhou on 9/3/21.
//

import Foundation


class ContentModel: ObservableObject{
    @Published var modules = [Module]()
    var styleData: Data?
    init(){
        getLocalData()
    }
    func getLocalData(){
        //get a url to the json file
        let jsonUrl = Bundle.main.url(forResource: "data", withExtension: "json")
        //read the file into a data object
        do {
            //read the file into the data object
            let jsonData = try Data(contentsOf: jsonUrl!)
            let jsonDecoder = JSONDecoder()
            
            let modules = try jsonDecoder.decode([Module].self, from: jsonData)
            self.modules = modules
        }catch {
            //log the error
            print("Couldnt parse local data")
        }
        
        //parse the style data
        let styleUrl = Bundle.main.url(forResource: "style", withExtension: "html")
        
        do {
            let styleData = try Data(contentsOf: styleUrl!)
            self.styleData = styleData
        }catch {
            print("Could not parse style data");
        }
    }
}
