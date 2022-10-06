//
//  RowView.swift
//  TodoList
//
//  Created by OmarMattr on 03/10/2022.
//

import SwiftUI

struct RowView: View {
    let item: ItemModel
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor (item.isCompleted ?.green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical,8)
    }
}


struct RowView_Previews: PreviewProvider {
    static var item1 = ItemModel(title: "First item!", isCompleted: false)
    static var item2 = ItemModel(title: "Second Item.", isCompleted: true)
    static var previews: some View {
        Group {
            RowView(item: item1)
            RowView(item: item2)
        }
        .previewLayout(.sizeThatFits)
        
    }
}
