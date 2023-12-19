//
//  Welcome.swift
//  AITextToImage
//
//  Created by Andrew Wen on 2023-12-18.
//

import SwiftUI

struct Welcome: View {
    var body: some View {
        NavigationStack {
            VStack {
                
                Spacer()
                
                Text("Start Creating Your Own Art Now").font(.system(size: 64, weight: .black))
                    .foregroundColor(.white)
                
                Spacer()
                
                NavigationLink(destination: ContentView()) {
                    HStack{
                        Text("Generate Image")
                        Image(systemName: "sparkles")
                    }
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .frame(height: 60)
                    .background {
                        LinearGradient(colors: [Color.purple, Color.pink, Color.orange], startPoint: .topLeading, endPoint: .bottomTrailing)
                    }
                    .fontWeight(.semibold)
                    .clipShape(Capsule())
                }
                
            }
            .background (
                Image("welcome").ignoresSafeArea()
            )
            .padding()
        }
    }
}

#Preview {
    Welcome()
}
