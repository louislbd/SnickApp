//
//  DropsScheduleView.swift
//  Snick
//
//  Created by Louis Leblond on 12/4/23.
//

import Foundation
import SwiftUI

struct DropItem: Identifiable {
    let id = UUID()
    let sneaker: Sneaker
    let releaseDate: Date
}

struct DropsScheduleView: View {
    let dropItems: [DropItem] = [
        DropItem(sneaker: Sneaker(name: "Nike Air Max 90 Easter", price: 235, imageName: "shoe7"), releaseDate: Date()),
        DropItem(sneaker: Sneaker(name: "Air Jordan 6 Cool Grey", price: 149.99, imageName: "shoe8"), releaseDate: Date().addingTimeInterval(86400)),
        DropItem(sneaker: Sneaker(name: "Air Jordan 1 Panda", price: 149.99, imageName: "shoe9"), releaseDate: Date().addingTimeInterval(86400)),
    ]
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
        List(dropItems) { dropItem in
            DropItemView(dropItem: dropItem)
        }
        .navigationTitle("Drops Schedule Page")
    }
}

struct DropItemView: View {
    let dropItem: DropItem

    var body: some View {
        HStack {
            Image(dropItem.sneaker.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
                .cornerRadius(8)

            VStack(alignment: .leading) {
                Text(dropItem.sneaker.name)
                    .font(.headline)

                Text("Price: $\(dropItem.sneaker.price, specifier: "%.2f")")
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                Text("Release Date: \(formattedDate())")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }

            Spacer()
        }
        .padding()
    }

    private func formattedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter.string(from: dropItem.releaseDate)
    }
}

struct DropsScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        DropsScheduleView()
    }
}
