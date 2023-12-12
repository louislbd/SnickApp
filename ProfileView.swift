//
//  ProfileView.swift
//  Snick
//
//  Created by Louis Leblond on 12/4/23.
//

import Foundation
import SwiftUI

struct ProfileView: View {
    @State private var isLoggedIn = false // Assume the user is not logged in initially

    var body: some View {
        if isLoggedIn {
            // User is logged in, display the profile page
            LoggedInView()
        } else {
            // User is not logged in, display the login/register page
            LoginRegisterView(isLoggedIn: $isLoggedIn)
        }
    }
}

struct LoggedInView: View {
    var body: some View {
        VStack {
            // Profile picture
            Image("profile") // Replace with the actual image name
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 2))
                .shadow(radius: 4)

            // Client name (replace "John Doe" with the actual user's name)
            Text("John Doe")
                .font(.title)
                .padding(.top, 8)

            // Additional profile details can be added here
        }
        .padding(16)
        .navigationTitle("Profile")
    }
}

struct LoginRegisterView: View {
    @Binding var isLoggedIn: Bool

    var body: some View {
        NavigationView {
            VStack {
                // Add login/register buttons or form fields

                Button("Login") {
                    // Perform login logic
                    isLoggedIn = true
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)

                Spacer()
            }
            .padding(16)
            .navigationTitle("Login/Register")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
