//
//  Homepage.swift
//  budgetingapp
//
//  Created by Fuad Farhan on 6/24/24.
//

import SwiftUI

struct Homepage: View {
    var body: some View {
        NavigationView {
            ZStack{
                Color(.white)
                    .ignoresSafeArea()
                VStack {
                    Image("twocentslogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                    NavigationLink(destination: ContentView()) {
                        Text("Get Started")
                            .font(.system(size: 15))
                            .foregroundColor(.black)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .padding()
                            .background(Color.yellow)
                            .cornerRadius(10)
                        
                    }
                }
                
                
                
            }
            
            
        }
    }
}

#Preview {
    Homepage()
}
