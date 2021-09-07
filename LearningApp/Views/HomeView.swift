//
//  ContentView.swift
//  LearningApp
//
//  Created by Jee Zhou on 9/3/21.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var model : ContentModel
    var body: some View {
        NavigationView{
            VStack(alignment: .leading){
                Text("What do you want to do today?")
                    .padding(.leading, 18)
                ScrollView{  //have cards that scrolls
                    LazyVStack{  //lazy load the cards
                        ForEach(model.modules){ module in  //Generate all the cards with this foreach function
                            
                            //recall model is the environment object and when that gets initialized, we call the getLocalData function, which parses our local file into an array of Modules (refer to ContentModel)
                            
                            //learning card
                            VStack(spacing: 20){
                                HomeViewRow(image: module.content.image, title: "Learn \(module.category)", description: module.content.description, count: "\(module.content.lessons.count) Lessons", time: module.content.time)
                                //Test card
                                
                                HomeViewRow(image: module.test.image, title: "\(module.category) Test", description: module.test.description, count: "\(module.test.questions.count) Lessons", time: module.test.time)
                            }
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Get Started")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())  //So now we have access to an array of modules in the preview page
    }
}
