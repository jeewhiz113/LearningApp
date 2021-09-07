//
//  HomeViewRow.swift
//  LearningApp
//
//  Created by Jee Zhou on 9/7/21.
//

import SwiftUI

struct HomeViewRow: View {
    var image : String
    var title : String
    var description: String
    var count : String
    var time : String
    var body: some View {
        ZStack{  //So information can lie on top of the rectangle.
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .aspectRatio(CGSize(width: 335, height: 175), contentMode: .fit)
            HStack{ //overall, this will be an hstack, with iamge on left and text on right
                Image(image)
                    .resizable()
                    .frame(width:116, height:116)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                Spacer()
                //text here:
                VStack (alignment: .leading, spacing: 10){
                    Text(title)
                        .bold()
                    Text(description)
                        .padding(.bottom, 20)
                        .font(.caption)
                        
                    
                    //num of lessons and time
                    HStack{
                        Image(systemName: "text.book.closed")
                            .resizable()
                            .frame(width:15, height:15)
                        Text(count)
                            .font(Font.system(size: 10))
                        
                        Image(systemName:"clock")
                            .resizable()
                            .frame(width: 15, height: 15)
                            .padding(.leading, 15)
                            
                        Text(time)
                            .font(Font.system(size: 10))
                    }
                }
            }
            .padding(.horizontal, 15)
        }
    }
}

struct HomeViewRow_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewRow(image: "swift", title: "Learn Swift", description: "Some description", count: "10 Lessons", time: "2 Hours")
            
    }
}
