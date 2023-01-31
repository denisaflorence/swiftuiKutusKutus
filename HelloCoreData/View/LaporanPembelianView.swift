//
//  LaporanPembelianView.swift
//  HelloCoreData
//
//  Created by Denisa on 30/01/23.
//

import SwiftUI

struct LaporanPembelianView: View {
    var body: some View {
        NavigationView{
            VStack {
                Text("Ini adalah halaman laporan pembelian")
            }.navigationTitle("Laporan Pembelian")
        }
        .navigationViewStyle(.stack)
            .navigationBarHidden(true)
    }
}

struct LaporanPembelianView_Previews: PreviewProvider {
    static var previews: some View {
        LaporanPembelianView()
    }
}
