//
//  ContentView.swift
//  Materials
//
//  Created by Philip Davis on 1/14/21.
//

import SwiftUI

struct ContentView: View {
    private var materials: [Material] = [.ultraThinMaterial, .thinMaterial, .regularMaterial, .thickMaterial, .ultraThickMaterial]
    private var materialLabels: [String] = ["Ultra Thin Material", "Thin Material", "Regular Material", "Thick Material", "Ultra Thick Material"]
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/ .fill/*@END_MENU_TOKEN@*/)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/ .all/*@END_MENU_TOKEN@*/)
            TabView {
                ForEach(0 ..< materials.count) { i in
                    ZStack {
                        Color(.clear)
                        Text(materialLabels[i]).padding().foregroundColor(.secondary)
                        
                    }.background(materials[i]).cornerRadius(24)
                }
                .padding(.all, 10)
            }
            .frame(width: UIScreen.main.bounds.width, height: 200)
            .tabViewStyle(PageTabViewStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
