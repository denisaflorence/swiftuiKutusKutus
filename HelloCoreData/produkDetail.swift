//
//  produkDetail.swift
//  HelloCoreData
//
//  Created by Denisa on 16/01/23.
//

import SwiftUI

struct produkDetail: View {
    let prod:Produk
    @State private var namaProduk:String = ""
    @Binding var needRefresh:Bool
    let coreDM: CoreDataManager
    
    var body: some View {
        VStack{
            TextField(prod.nama ?? "", text: $namaProduk).textFieldStyle(RoundedBorderTextFieldStyle())
            Button("Update"){
                if !namaProduk .isEmpty {
                    prod.nama = namaProduk
                    coreDM.updateProduk()
                    needRefresh.toggle()
                }
            }
        }
    }
}

struct produkDetail_Previews: PreviewProvider {
    static var previews: some View {
        let prod = Produk()
        let coreDM = CoreDataManager()
        produkDetail(prod:prod, needRefresh: .constant(false), coreDM: CoreDataManager())
    }
}
