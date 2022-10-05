//
//  ContentView.swift
//  TodoList
//
//  Created by OmarMattr on 03/10/2022.
//

import SwiftUI

struct MyListView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    var body: some View {
        ZStack {
            if listViewModel.items.isEmpty {
              NoItemView()
            }else {
                List{
                    ForEach(listViewModel.items){ item in
                        RowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear){
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete (perform: listViewModel.deleteItem(indexSet:))
                    .onMove (perform: listViewModel.moveItem)
                }
                .listStyle(.plain)
                
            }
        }
        .navigationTitle ("Todo List")
        .navigationBarItems(leading: EditButton(),trailing: NavigationLink("Add",destination: AddView()))
        
    }
 
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            MyListView()
        }
        .environmentObject(ListViewModel())
    }
}

