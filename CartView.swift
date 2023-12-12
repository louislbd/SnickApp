//
//  CartView.swift
//  Snick
//
//  Created by Louis Leblond on 12/5/23.
//

import Foundation
import SwiftUI

struct CartItem: Identifiable {
    let id = UUID()
    let sneaker: Sneaker
    var quantity: Int
}

struct CartView: View {
    @State private var cartItems: [CartItem] = []

    var totalAmount: Double {
        cartItems.reduce(0) { $0 + $1.sneaker.price * Double($1.quantity) }
    }

    var body: some View {
        VStack {
            if cartItems.isEmpty {
                Text("Your cart is empty.")
            } else {
                List {
                    ForEach(cartItems) { cartItem in
                        CartItemView(cartItem: cartItem, cartItems: $cartItems)
                    }
                }
                .listStyle(InsetGroupedListStyle())

                Text("Total: $\(totalAmount, specifier: "%.2f")")
                    .font(.headline)
                    .padding()

                // Button to proceed to payment
                Button("Proceed to Payment") {
                    // Add logic to handle payment
                    // This is a placeholder; you can navigate to a payment screen or perform other actions
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
        }
        .navigationTitle("Cart")
        .onAppear {
            // For demonstration purposes, pre-populating the cart with some items
            cartItems = [
                CartItem(sneaker: Sneaker(name: "Air Jordan 4 Red Cement", price: 255, imageName: "shoe1"), quantity: 1),
                CartItem(sneaker: Sneaker(name: "Nike Dunk Low Cacao", price: 298, imageName: "shoe2"), quantity: 1),
                // Add more items as needed
            ]
        }
    }
}

struct CartItemView: View {
    @State private var quantity: Int

    let cartItem: CartItem
    var cartItems: Binding<[CartItem]>

    init(cartItem: CartItem, cartItems: Binding<[CartItem]>) {
        self.cartItem = cartItem
        _quantity = State(initialValue: cartItem.quantity)
        self.cartItems = cartItems
    }

    var body: some View {
        HStack {
            Image(cartItem.sneaker.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
                .cornerRadius(8)

            VStack(alignment: .leading) {
                Text(cartItem.sneaker.name)
                    .font(.headline)

                Text("Price: $\(cartItem.sneaker.price, specifier: "%.2f")")
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                HStack {
                    Text("Quantity:")
                        .font(.subheadline)
                        .foregroundColor(.secondary)

                    // Stepper buttons for quantity
                    Stepper(value: $quantity, in: 1...10) {
                        Text("\(quantity)")
                    }
                    .labelsHidden()
                }
            }

            Spacer()
        }
        .padding()
        .onChange(of: quantity) { oldQuantity, newQuantity in
            // Update the quantity in the cart when it changes
            updateQuantity(newQuantity)
        }
    }

    private func updateQuantity(_ newQuantity: Int) {
        // Update the quantity in the provided cartItems binding
        if let index = cartItems.wrappedValue.firstIndex(where: { $0.id == cartItem.id }) {
            cartItems.wrappedValue[index].quantity = newQuantity
        }
    }
}


struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
