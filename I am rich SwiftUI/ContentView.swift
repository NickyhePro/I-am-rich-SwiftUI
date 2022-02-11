//
//  ContentView.swift
//  I am rich SwiftUI
//
//  Created by Nick He on 11/02/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack {
            Color(.systemTeal)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("I Am Rich!")
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Image("diamond").resizable().aspectRatio(contentMode: .fit).frame(width: 200, height: 200, alignment: .center)
            }
            
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
