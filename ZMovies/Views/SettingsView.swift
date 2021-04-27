//
//  SettingsView.swift
//  ZMovies
//
//  Created by Zin Lin Htet Naing on 16/03/2021.
//

import SwiftUI

struct SettingsView: View {
    
    @Binding var isPresented: Bool
    
    @State private var selection = 0
    @State private var email = ""
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    
    let genreArray = ["Action", "Comedy", "Horror", "Scify"]
    
    var body: some View {
        NavigationView {
            Form {
                Picker(selection: $selection, label: Text("Favorite Genre").foregroundColor(.blue)) {
                    ForEach(0 ..< genreArray.count) {
                        Text(self.genreArray[$0]).tag($0)
                    }
                }.listRowBackground(Color.gray.opacity(0.05))
                
                Section(header: Text("Appearance").bold()) {
                    HStack {
                        Image(systemName: "moon.fill")
                            .font(.system(size: 18, weight: .regular))
                            .foregroundColor(.gray)
                        Toggle(isOn: $isDarkMode) {
                            Text("Dark Mode").foregroundColor(.blue)
                        }
//                        .toggleStyle(PowerToggleStyle())
                    }
                }.listRowBackground(Color.gray.opacity(0.05))
                
                Section(header: Text("ABOUT").bold()) {
                    HStack {
                        Text("Version").foregroundColor(.blue)
                        Spacer()
                        Text("1.0.0").foregroundColor(.gray)
                    }
                }.listRowBackground(Color.gray.opacity(0.05))
                
                Section(header: Text("Email").bold()) {
                    HStack {
                        Image(systemName: "envelope.fill")
                            .font(.system(size: 18, weight: .regular))
                            .foregroundColor(.gray)
                        TextField("Email", text: $email)
                            .textFieldStyle(DefaultTextFieldStyle())
                    }
                }.listRowBackground(Color.gray.opacity(0.05))
                
                Button(action: {
                    print(email)
                    isPresented.toggle()
                }) {
                    Text("Save").foregroundColor(.blue)
                }.listRowBackground(Color.gray.opacity(0.05))
                
            }.navigationTitle("Settings")
        }
        
    }
    
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(isPresented: .constant(false))
    }
}
