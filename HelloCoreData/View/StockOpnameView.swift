//
//  StockOpnameView.swift
//  HelloCoreData
//
//  Created by Denisa on 30/01/23.
//

import SwiftUI

struct StockOpnameView: View {
    var body: some View {
        NavigationView{
            VStack {
                Text("Ini adalah halaman Stock Opname")
            }.navigationTitle("Stock Opname")
        }
        .navigationViewStyle(.stack)
            .navigationBarHidden(true)
    }
}

struct StockOpnameView_Previews: PreviewProvider {
    static var previews: some View {
        StockOpnameView()
    }
}
