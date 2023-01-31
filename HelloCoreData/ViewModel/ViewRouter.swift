//
//  ViewRouter.swift
//  HelloCoreData
//
//  Created by Denisa on 30/01/23.
//

import Foundation
import SwiftUI

class ViewRouter: ObservableObject {
    @Published var currentPage: mPage = .produk
    @Published var showTab: Bool = true
}

enum mPage {
     case produk
     case pembeli
     case transaksi
     case stockOpname
     case laporanPenjualan
    case laporanPembelian
    case laporanPiutang
     
 }
