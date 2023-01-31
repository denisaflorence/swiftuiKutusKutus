//
//  ProdukView.swift
//  HelloCoreData
//
//  Created by Denisa on 30/01/23.
//

import SwiftUI

struct ProdukView: View {
    let coreDM: CoreDataManager
    @State private var namaProduk:String = ""
//    @EnvironmentObject var envObj: EnvObject
    @StateObject var viewRouter = ViewRouter()
    @State private var produk: [Produk] = [Produk]()
    @State private var needRefresh: Bool = false
    private func hitungProduk() {
        produk = coreDM.getAllProduk()
    }
    
    var body: some View {
        NavigationView{
            VStack {
                
                //                TextField("Masukkan Nama Produk", text: $namaProduk).textFieldStyle(RoundedBorderTextFieldStyle())
                //                              Button("Save"){
                //                                  coreDM.saveProduk(nama: namaProduk)
                //                                  hitungProduk()
                //                              }
                List {
                    ForEach(produk, id: \.self) { prod in
                        NavigationLink(
                            destination: produkDetail(prod:prod, needRefresh: $needRefresh, coreDM: coreDM),
                            label:{ Text(prod.nama ?? "")
                            })
                    }.onDelete(perform: {indexSet in
                        indexSet.forEach {index in
                            let prod = produk[index]
                            // hapus dari CoreData
                            coreDM.deleteProduk(prod: prod)
                            hitungProduk()
                        }
                    })
                    
                }.accentColor(needRefresh ? .white:.black)
                Spacer()
            }.padding(.bottom,1)
                .navigationTitle("Produk")
                .onAppear(perform: {
                    hitungProduk()
                })
        }
        .navigationViewStyle(.stack)
            .navigationBarHidden(true)
            
    }
}

struct ProdukView_Previews: PreviewProvider {
    static var previews: some View {
        ProdukView(coreDM: CoreDataManager())
    }
}
