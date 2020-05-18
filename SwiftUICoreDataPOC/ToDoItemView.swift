//
//  ToDoItemView.swift
//  SwiftUICoreDataPOC
//
//  Created by Djubo on 18/05/20.
//  Copyright © 2020 Djubo. All rights reserved.
//

import SwiftUI

struct ToDoItemView: View {
    var title: String=""
    var createdAT:String=""
    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: 1.0){
                Text(title).font(.headline)
                Text(createdAT).font(.caption)
            }
        }
    }
}

struct ToDoItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoItemView(title: "Ashwnai", createdAT: "asfds")
    }
}
