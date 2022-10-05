//
//  TodoListApp.swift
//  TodoList
//
//  Created by OmarMattr on 03/10/2022.
//

import SwiftUI

@main
struct TodoListApp: App {
    @StateObject var listViewModel = ListViewModel ()
    var body: some Scene {
        WindowGroup {
            NavigationView{
                MyListView()
            }
            .environmentObject(listViewModel)
            }
    }
}
