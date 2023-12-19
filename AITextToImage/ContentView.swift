//
//  ContentView.swift
//  AITextToImage
//
//  Created by Andrew Wen on 2023-12-18.
//

import SwiftUI

struct ContentView: View {
    @State var selectedStyle = ImageStyle.allCases[0]
    @State var promptText: String = ""
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 30) {
                Image(systemName: "arrow.left")
                    .fontWeight(.semibold)
                    .frame(width: 60, height: 60 )
                    .background(.gray.opacity(0.3))
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                
                Text("Choose a style of picture").font(.system(size: 32, weight: .black))
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(ImageStyle.allCases, id: \.self) {
                            imageStyle in
                            
                            Button {
                                withAnimation(.snappy) {
                                    selectedStyle = imageStyle
                                }
                            }
                        label: { Image(imageStyle.rawValue)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 150, height: 200)
                                .clipShape(.rect(cornerRadius: 20))
                        }
                        .overlay(content: {
                            RoundedRectangle(cornerRadius: 20).stroke(LinearGradient(colors: [Color.blue, Color.purple, Color.pink, Color.orange], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: imageStyle == selectedStyle ? 3 : 0)
                        })
                        }
                    }
                }
                
                TextEditor(text: $promptText)
                    .scrollContentBackground(.hidden)
                    .padding()
                    .background(Color.gray.opacity(0.15))
                    .cornerRadius(20)
                    .foregroundColor(.white)
                    .tint(Color.yellow)
                
                NavigationLink(destination: GeneratorView(viewModal: .init(prompt: promptText, selectedStyle: selectedStyle))) {
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
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .padding()
        }
        .navigationBarHidden(true)
        
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}
