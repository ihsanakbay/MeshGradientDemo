//
//  ContentView.swift
//  MeshGradientDemo
//
//  Created by İhsan Akbay on 7.12.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var isAnimating: Bool = false

    let gradientColors = (0..<9).map { _ in
        [Color.blue, .orange, .cyan].randomElement() ?? .blue
    }
    let gradientColors2 = (0..<9).map { _ in
        [Color.blue, .red, .cyan].randomElement() ?? .blue
    }

    var body: some View {
        MeshGradient(
            width: 3,
            height: 3,
            points: [
                .init(x: 0, y: 0), .init(x: 0.5, y: 0), .init(x: 1, y: 0),
                .init(x: 0, y: 0.5), .init(x: 0.5, y: 0.5), .init(x: 1, y: 0.5),
                .init(x: 0, y: 1), .init(x: 0.5, y: 1), .init(x: 1, y: 1)
            ],
            colors: isAnimating ? gradientColors : gradientColors2
        )
        .ignoresSafeArea()
        .onAppear {
            withAnimation(.easeInOut(duration: 2).repeatForever()) {
                isAnimating.toggle()
            }
        }
    }
}

#Preview {
    ContentView()
}
