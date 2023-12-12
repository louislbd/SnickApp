//
//  ContentView.swift
//  Snick
//
//  Created by Louis Leblond on 12/4/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }

            DropsScheduleView()
                .tabItem {
                    Label("Drops", systemImage: "calendar")
                }

            CartView()
                .tabItem {
                    Label("Cart", systemImage: "cart")
                }

            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
            }
        }
}

#Preview {
    ContentView()
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
