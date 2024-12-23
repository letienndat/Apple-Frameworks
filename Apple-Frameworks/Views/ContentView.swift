//
//  ContentView.swift
//  Apple-Frameworks
//
//  Created by Lê Tiến Đạt on 22/12/2024.
//

import SwiftUI

struct ContentView: View {
    
    private let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid (columns: columns) {
                    ForEach(MockData.frameworks) { framework in
                        NavigationLink(destination: FrameworkDetailView(framework: framework)) {
                            FrameworkTitleView(imageName: framework.imageName, name: framework.name)
                        }
                        .foregroundColor(Color(.label))
                    }
                }
                .padding()
            }
            .navigationTitle("🍎 Frameworks")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct FrameworkTitleView: View {
    
    var imageName: String
    var name: String
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .frame(width: 90, height: 90)
            Text(name)
                .font(.title2)
                .fontWeight(.semibold)
                .scaledToFit()
                .minimumScaleFactor(0.6)
        }
    }
}
