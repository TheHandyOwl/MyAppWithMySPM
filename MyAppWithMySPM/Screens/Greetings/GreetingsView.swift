//
//  GreetingsView.swift
//  MyAppWithMySPM
//
//  Created by Carlos Company on 22/9/24.
//

import SwiftUI

struct GreetingsView: View {
    
    @Environment(GreetingsVM.self) private var greetingsVM
    
    var body: some View {
        
        @Bindable var bindableVM = greetingsVM
        
        VStack(spacing: 16) {
            HStack {
                Text("Name:")
                    .frame(width: 100, alignment: .trailing)
                TextField(
                    "Write your name here",
                    text: $bindableVM.name)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            HStack {
                Text("Greetings:")
                    .frame(width: 100, alignment: .trailing)
                Text(bindableVM.greetings)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(.gray, lineWidth: 2)
        )
        .padding()
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .topLeading
        )
    }
}

#Preview {
    GreetingsView()
        .environment(
            GreetingsVM()
        )
}
