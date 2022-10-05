//
//  ItemModel.swift
//  TodoList
//
//  Created by OmarMattr on 04/10/2022.
//

import Foundation

struct ItemModel: Identifiable,Codable {
    let id: String
    let title: String
    let isCompleted: Bool
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
        
    }
    
}
