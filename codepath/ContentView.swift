//
//  ContentView.swift
//  codepath
//
//  Created by Howard Thomas on 7/19/23.
//

import SwiftUI

struct ContentView: View {
    enum gradeLevel: String, CaseIterable{
    case first = "First"
    case second = "Second"
    case third = "Third"
    case forth = "Forth"
    }
    
    @State var firstName = ""
    @State var lastName = ""
    @State var schoolName = ""
    @State var schoolGradeLevel: gradeLevel = .first
    @State var numberOfPets = 0
    @State var toggle = true
    @State var showAlert = false
    var body: some View {
        VStack {
            Image("WGU")
                .resizable()
                .frame(width: 200, height: 200)
            HStack{
                Text("First")
                TextField("",text: $firstName)
                    .textFieldStyle(.roundedBorder)
            }
            HStack{
                Text("Last")
                TextField("", text: $lastName)
                    .textFieldStyle(.roundedBorder)
            }
            HStack{
                Text("School")
                TextField("", text: $schoolName)
                    .textFieldStyle(.roundedBorder)
            }
            
            Picker("", selection: $schoolGradeLevel) {
                ForEach(gradeLevel.allCases, id:\.self){item in
                    Text(item.rawValue)
                }
            }
            .pickerStyle(.segmented)
            HStack{
                Text("Pets \(numberOfPets)")
                Stepper("", value: $numberOfPets)
            }
            
            Toggle("More Pets? ", isOn: $toggle)
            
            Button {
                showAlert.toggle()
            } label: {
                Text("Introduce Self")
            }
        }
        .alert("My Introduction", isPresented: $showAlert, actions: {
            Button {
                showAlert.toggle()
            } label: {
                Text("Nice To Meet You")
            }

        }, message: {
            Text("My name is \(firstName) \(lastName) and I attend \(schoolName). I am currently in my \(schoolGradeLevel.rawValue) year and I own \(numberOfPets) dogs. It is \(toggle.description) that I want more pets. ")
        })
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
