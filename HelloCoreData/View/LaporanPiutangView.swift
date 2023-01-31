//
//  LaporanPiutangView.swift
//  HelloCoreData
//
//  Created by Denisa on 30/01/23.
//

import SwiftUI

struct LaporanPiutangView: View {
    var body: some View {
        NavigationView{
            VStack {
                Text("Ini adalah halaman laporan Piutang")
            }.navigationTitle("Laporan Piutang")
        }
        .navigationViewStyle(.stack)
            .navigationBarHidden(true)
    }
}

struct LaporanPiutangView_Previews: PreviewProvider {
    static var previews: some View {
        LaporanPiutangView()
    }
}
