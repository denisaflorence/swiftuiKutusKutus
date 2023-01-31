//
//  PembeliView.swift
//  HelloCoreData
//
//  Created by Denisa on 30/01/23.
//

import SwiftUI

struct PembeliView: View {
    var body: some View {
        NavigationView{
            VStack {
                Text("Ini adalah halaman pembeli")
            }.navigationTitle("Pembeli")
        }
            .navigationViewStyle(.stack)
                .navigationBarHidden(true)
    }
}

struct PembeliView_Previews: PreviewProvider {
    static var previews: some View {
        PembeliView()
    }
}
