//
//  AddView.swift
//  TodoList
//
//  Created by OmarMattr on 03/10/2022.
//

import SwiftUI

struct AddView: View {
    @Environment (\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    @State var showAlert: Bool = false
    @State var alertTitle: String = ""

    var body: some View {
        ScrollView{
            TextField ("Type something here...",text: $textFieldText)
                .padding(.horizontal)
                .frame(height: 55)
                .foregroundColor(.white)
                .background(Color(.lightGray))
                .cornerRadius(10)
            Button (action: saveBtn, label: {
                Text("Save".uppercased())
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(.teal)
                    .foregroundColor(.white)
                    .font(.headline)
                    .cornerRadius(10)
            })
            
        }.padding(14)
            . navigationTitle("Add an Item /")
            .alert(isPresented: $showAlert,content: getAlert)
    }
    func saveBtn (){
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }else{
            
        }
    }
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Your new todo item must be at least 3 characters long!!!  😬😱"
            showAlert.toggle()
            return false
        }
        return true
    }
    func getAlert() ->  Alert{
        return  Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
