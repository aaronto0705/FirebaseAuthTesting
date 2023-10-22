//
//  ContentView.swift
//  FirebaseUserLogins
//
//  Created by Aaron To on 10/20/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            VStack {
                Text("Troved")
                NavigationView {
                    VStack {
                        NavigationLink(destination: CreateAccountView()) {
                            Text("Create Account")
                            
                        }
                        
                    }
                    
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
