//
//  ShoeGridView.swift
//  Snick
//
//  Created by Louis Leblond on 12/5/23.
//

import Foundation
import SwiftUI

struct Sneaker {
    var name: String
    var price: Double
    var imageName: String
}

struct ShoeGridView: View {
    let sneakers: [Sneaker] = [
        Sneaker(name: "Air Jordan 4 Red Cement", price: 255, imageName: "shoe1"),
        Sneaker(name: "Nike Dunk Low Cacao", price: 298, imageName: "shoe2"),
        Sneaker(name: "Air Jordan 4 Thunder 2023", price: 132, imageName: "shoe3"),
        Sneaker(name: "Nike KD 16 Aunt Pearl", price: 96, imageName: "shoe4"),
        Sneaker(name: "Air Jordan 1 True Blue", price: 235, imageName: "shoe5"),
        Sneaker(name: "Air Jordan 4 Black Canvas", price: 99, imageName: "shoe6"),
        // ... add more sneakers
    ]

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 16), count: 2), spacing: 16) {
                    ForEach(sneakers, id: \.name) { sneaker in
                        NavigationLink(destination: SneakerDetailView(sneaker: sneaker)) {
                            ShoeGridItemView(sneaker: sneaker)
                        }
                    }
                }
                .padding(16)
            }
            .navigationTitle("Sneakers")
        }
    }
}

struct ShoeGridItemView: View {
    let sneaker: Sneaker

    var body: some View {
        VStack {
            Image(sneaker.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)

            Text(sneaker.name)
                .font(.headline)
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 8)

            Text("$\(sneaker.price, specifier: "%.2f")")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .frame(width: 170, height: 230)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 4)
    }
}

struct SneakerGridView_Previews: PreviewProvider {
    static var previews: some View {
        ShoeGridView()
    }
}

