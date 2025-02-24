//
//  ContentView.swift
//  LoginScreenSwift
//
//  Created by Rashad Milton on 2/24/25.
//

import SwiftUI

struct ContentView: View {
    @State private var currentScreen: Screen = .welcome
    
    enum Screen {
        case welcome, login, signup
    }
    
    var body: some View {
        NavigationStack {
            switch currentScreen {
            case .welcome:
                WelcomeView(currentScreen: $currentScreen)
            case .login:
                LoginView(currentScreen: $currentScreen)
            case .signup:
                SignupView(currentScreen: $currentScreen)
            }
        }
    }
}

struct WelcomeView: View {
    @Binding var currentScreen: ContentView.Screen
    
    var body: some View {
        VStack(spacing: 24) {
            // Illustration
            IllustrationView()
                .frame(height: 200)
            
            VStack(spacing: 16) {
                Text("Hello!")
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("Best place to write life stories and\nshare your journey experiences")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
            }
            
            VStack(spacing: 12) {
                Button(action: { currentScreen = .login }) {
                    Text("LOGIN")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.indigo)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                
                Button(action: { currentScreen = .signup }) {
                    Text("SIGNUP")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.white)
                        .foregroundColor(.indigo)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.indigo, lineWidth: 1)
                        )
                }
            }
            .padding(.horizontal)
        }
        .padding()
    }
}

struct LoginView: View {
    @Binding var currentScreen: ContentView.Screen
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack(spacing: 24) {
            VStack(spacing: 8) {
                Text("Welcome!")
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("Sign in to continue")
                    .foregroundColor(.gray)
            }
            
            VStack(spacing: 16) {
                TextField("amishkr@gmail.com", text: $email)
                    .textFieldStyle(.roundedBorder)
                
                SecureField("••••••••", text: $password)
                    .textFieldStyle(.roundedBorder)
            }
            
            VStack(spacing: 16) {
                Button(action: {}) {
                    Text("LOGIN")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.indigo)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                
                Button(action: {}) {
                    Text("Forgot Password?")
                        .foregroundColor(.gray)
                }
                
                Text("or")
                    .foregroundColor(.gray)
                
                HStack(spacing: 20) {
                    ForEach(["google", "facebook", "apple"], id: \.self) { provider in
                        Button(action: {}) {
                            Image(provider)
                                .resizable()
                                .frame(width: 100, height: 100)
                        }
                    }
                }
                
                HStack {
                    Text("Don't have an account?")
                        .foregroundColor(.gray)
                    Button(action: { currentScreen = .signup }) {
                        Text("Sign up")
                            .foregroundColor(.indigo)
                    }
                }
            }
        }
        .padding()
        //.navigationBarBackButtonHidden(false)
    }
}

struct SignupView: View {
    @Binding var currentScreen: ContentView.Screen
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack(spacing: 24) {
            VStack(spacing: 8) {
                Text("Hi!")
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("Create a new account")
                    .foregroundColor(.gray)
            }
            
            VStack(spacing: 16) {
                TextField("Amish567", text: $username)
                    .textFieldStyle(.roundedBorder)
                
                TextField("amishkr@gmail.com", text: $email)
                    .textFieldStyle(.roundedBorder)
                
                SecureField("••••••••", text: $password)
                    .textFieldStyle(.roundedBorder)
            }
            
            VStack(spacing: 16) {
                Button(action: {currentScreen = .welcome}) {
                    Text("SIGN UP")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.indigo)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                
                Text("or")
                    .foregroundColor(.gray)
                
                HStack(spacing: 20) {
                    ForEach(["google", "facebook", "apple"], id: \.self) { provider in
                        Button(action: {}) {
                            Image(provider)
                                .resizable()
                                .frame(width: 100, height: 100)
                        }
                    }
                }
                
                HStack {
                    Text("Already have an account?")
                        .foregroundColor(.gray)
                    Button(action: { currentScreen = .login }) {
                        Text("Sign in")
                            .foregroundColor(.indigo)
                    }
                }
            }
        }
        .padding()
       // .navigationBarBackButtonHidden(false)
    }
}

struct IllustrationView: View {
    var body: some View {
            VStack {
                Image("SampleImage")
                    .resizable()
                    .frame(width: .infinity, height: .infinity)
                    .foregroundColor(.indigo)
            }
    }
}

#Preview {
    ContentView()
}
