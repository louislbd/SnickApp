//
//  SneakerDetailView.swift
//  Snick
//
//  Created by Louis Leblond on 12/5/23.
//

import Foundation
import SwiftUI

struct SneakerDetailView: View {
    let sneaker: Sneaker

    @State private var isAddedToCart = false

    var body: some View {
        VStack {
            Image(sneaker.imageName)
                .resizable()
                .scaledToFit()

            Text(sneaker.name)
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 8)

            Text("$\(sneaker.price, specifier: "%.2f")")
                .font(.subheadline)
                .foregroundColor(.secondary)

            // Add to cart button
            Button(action: {
                // Add logic to add the pair of shoes to the cart
                addToCart()
            }) {
                Text(isAddedToCart ? "Added to Cart" : "Add to Cart")
                    .foregroundColor(.white)
                    .padding()
                    .background(isAddedToCart ? Color.green : Color.blue)
                    .cornerRadius(8)
            }
        }
        .padding()
        .navigationTitle("Details") // Set the navigation title to "Details"
    }

    private func addToCart() {
        // Add logic to handle adding the pair of shoes to the cart
        // You might update some state or perform other actions here
        isAddedToCart = true
    }
}
