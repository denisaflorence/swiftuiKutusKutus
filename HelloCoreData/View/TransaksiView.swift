//
//  TransaksiView.swift
//  HelloCoreData
//
//  Created by Denisa on 30/01/23.
//

import SwiftUI

struct TransaksiView: View {
    var body: some View {
        NavigationView{
            VStack {
                Text("Ini adalah halaman transaksi")
            }.navigationTitle("Transaksi")
        }
        .navigationViewStyle(.stack)
            .navigationBarHidden(true)
    }
}

struct TransaksiView_Previews: PreviewProvider {
    static var previews: some View {
        TransaksiView()
    }
}
