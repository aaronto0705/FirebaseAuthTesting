//
//  CreateAccountView.swift
//  FirebaseUserLogins
//
//  Created by Aaron To on 10/20/23.
//

import SwiftUI
import FirebaseAuth

struct CreateAccountView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var fname: String = ""
    @State private var lname: String = ""
    @State private var showAlert = false
    var body: some View {
        VStack {
            Text("FIRST NAME")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            TextField("First Name", text: $fname)
                .padding(.horizontal, 10)
                .frame(height: 42)
                .overlay(
                    RoundedRectangle(cornerSize: CGSize(width: 4, height: 1))
                        .stroke(Color.gray)
                )
            Text("LAST NAME")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            TextField("Last Name", text: $lname)
                .padding(.horizontal, 10)
                .frame(height: 42)
                .overlay(
                    RoundedRectangle(cornerSize: CGSize(width: 4, height: 4))
                        .stroke(Color.gray, lineWidth: 1)
                )
            Text("Email")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            TextField("Email", text: $email)
                .padding(.horizontal, 10)
                .frame(height: 42)
                .overlay(
                    RoundedRectangle(cornerSize: CGSize(width: 4, height: 4))
                        .stroke(Color.gray, lineWidth: 1)
                )
            Button(action: {
                print($fname)
                print($lname)
                print($email)
                Auth.auth().createUser(withEmail: email, password: "testPassword") { (result, err) in
                    if let err = err {
                        print("Error creating user")
                        print(err)
                        self.showAlert.toggle()
                    } else {
                        print("User created")
                    }
                }
            })
            {
                Text("Next")
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Error Creating Account"),
                  message: Text("An account is already associated with this email. Please login instead."),
                  dismissButton: .default(Text("Dismiss")))
        }
    }
}

struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView()
    }
}
