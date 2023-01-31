//
//  LaporanPenjualanView.swift
//  HelloCoreData
//
//  Created by Denisa on 30/01/23.
//

import SwiftUI

struct LaporanPenjualanView: View {
    var body: some View {
        NavigationView{
            VStack {
                Text("Ini adalah halaman laporan penjualan")
            }.navigationTitle("Laporan Penjualan")
        }
        .navigationViewStyle(.stack)
            .navigationBarHidden(true)
    }
}

struct LaporanPenjualanView_Previews: PreviewProvider {
    static var previews: some View {
        LaporanPenjualanView()
    }
}
