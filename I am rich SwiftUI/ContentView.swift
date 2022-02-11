//
//  ContentView.swift
//  I am rich SwiftUI
//
//  Created by Nick He on 11/02/22.
//

import SwiftUI

extension Image {
    func imageModifier() -> some View {
        self
            .resizable()
            .scaledToFit()
    }
    
    func iconModifier() -> some View {
        self
            .imageModifier()
            .frame(width: 200, height: 200, alignment: .center)
    }
}

struct ContentView: View {
    private let imageURL: String = "https://credo.academy/credo-academy@3x.png"
    
    var body: some View {
        
        ZStack {
            Color(.systemTeal)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("I Am Rich!")
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                // MARK: - AsyncImage Placeholder
//                AsyncImage(url: URL(string: imageURL)) { image in
//                    image.imageModifier()
//                } placeholder: {
//                    Image("diamond").iconModifier()
//                }
//                .padding(40)
                
                // MARK: - AsyncImage Phase
//                AsyncImage(url: URL(string: imageURL)) { phase in
//                    if let image = phase.image {
//                        image.imageModifier()
//                    } else if phase.error != nil {
//                        Image(systemName: "ant.circle.fill").iconModifier()
//                    } else {
//                        Image("diamond").iconModifier()
//                    }
//                }
//                .padding(40)
                
                // MARK: - AsyncImage Animation
                AsyncImage(url: URL(string: imageURL), transaction: Transaction(animation: .spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.25))) { phase in
                    switch phase {
                    case .success(let image):
                        image.imageModifier().transition(.scale)
                    case .failure(_):
                        Image(systemName: "ant.circle.fill").iconModifier()
                    case .empty:
                        Image("diamond").iconModifier()
                    @unknown default:
                        ProgressView()
                    }
                
                }
                .padding(40)
                
            }
            
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
