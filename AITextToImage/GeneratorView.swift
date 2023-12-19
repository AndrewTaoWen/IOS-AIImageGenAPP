//
//  GeneratorView.swift
//  AITextToImage
//
//  Created by Andrew Wen on 2023-12-18.
//

import SwiftUI

struct GeneratorView: View {
    
    @ObservedObject var viewModal: ViewModal
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 30) {
                Image(systemName: "arrow.left")
                    .fontWeight(.semibold)
                    .frame(width: 60, height: 60 )
                    .background(.gray.opacity(0.3))
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                
                Text("Choose a style of picture").font(.system(size: 32, weight: .black))
                
                AsyncImage(url: viewModal.image) { image in
                    image.resizable()
                        .scaledToFill()
                } placeholder: {
                    ProgressView().tint(.white)
                }
                .frame(width: 340, height: 400)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                
                HStack {
                    Text("Re-Generate")
                    Image(systemName: "sparkles")
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .frame(height: 60)
                .background {
                    LinearGradient(colors: [Color.purple, Color.pink, Color.orange], startPoint: .topLeading, endPoint: .bottomTrailing)
                }
                .foregroundColor(.white)
                .fontWeight(.semibold)
                .clipShape(Capsule())
            }
            .padding()
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
            .background(.black)
            .foregroundStyle(.white)
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    GeneratorView(viewModal: .init(prompt: "black cat", selectedStyle: .threeDRender))
}
