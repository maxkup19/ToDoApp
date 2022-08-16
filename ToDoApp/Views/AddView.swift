//
//  AddView.swift
//  ToDoApp
//
//  Created by Max Kup on 16.08.2022.
//

import SwiftUI

struct AddView: View {
    
    @State var textFieldText: String = ""
    @EnvironmentObject var lvm: ListViewModel
    @Environment(\.dismiss) var dismiss
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here..", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(10)
                Button {
                    if lvm.verify(text: textFieldText) {
                        lvm.addItem(named: textFieldText)
                        dismiss()
                    } else {
                        alertTitle = "Your new item is too short"
                        showAlert.toggle()
                    }
                } label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }
            }.padding(14)
        }
        .navigationTitle("Add item 🖊")
        .alert(isPresented: $showAlert) {
            Alert(title: Text(alertTitle))
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
                .environmentObject(ListViewModel())
        }
    }
}
