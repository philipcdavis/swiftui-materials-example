//
//  ContentView.swift
//  Materials
//
//  Created by Philip Davis on 1/14/21.
//

import SwiftUI

struct Blur: UIViewRepresentable {
    var style: UIBlurEffect.Style = .systemUltraThinMaterial
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}


struct ContentView: View {
    private var materials: [UIBlurEffect.Style] = [ .systemUltraThinMaterial, .systemThinMaterial, .systemMaterial, .systemThickMaterial, .systemChromeMaterial]
    private var materialLabels: [String] = [ "System Ultra Thin Material", "System Thin Material", "System Material", "System Thick Material", "System Chrome Material"]
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            TabView {
                ForEach(0..<materials.count) { i in
                    ZStack {
                        Color(.clear)
                        Text(materialLabels[i]).padding().opacity(0.7)
                        
                        
                    }.background(Blur(style: materials[i])).cornerRadius(24)
                    
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
