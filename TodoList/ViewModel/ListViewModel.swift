//
//  ListViewModell.swift
//  TodoList
//
//  Created by OmarMattr on 04/10/2022.
//

import Foundation

class ListViewModel : ObservableObject{
    @Published var items: [ItemModel] = [] {
        didSet{
            saveItems()
        }
        
    }
    let itemskey: String = "Items_list"
    
    init() {
        getItems()
    }
    
    func getItems(){
        guard
        let data = UserDefaults.standard.data(forKey:itemskey),
        let savedItems = try? JSONDecoder () . decode ([ItemModel].self, from: data)
        else { return }
        self.items = savedItems
        
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    func moveItem(from: IndexSet,to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    func addItem(title:String){
        items.append(ItemModel(title: title, isCompleted: false))
    }
    func updateItem(item:ItemModel){
        if let index = items.firstIndex (where: { $0.id == item.id }) {
            items[index] = ItemModel(id:item.id,title: item.title, isCompleted: !item.isCompleted)
        }
    }
    func saveItems(){
        if let encodedData = try? JSONEncoder () .encode (items) {
        UserDefaults.standard.set(encodedData, forKey:itemskey)
        }
    }
}
