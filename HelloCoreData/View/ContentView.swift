//
//  ContentView.swift
//  HelloCoreData
//
//  Created by Denisa on 16/01/23.
//

import SwiftUI

struct ContentView: View {
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
        NavigationView {
            GeometryReader { geometry in
                VStack {
                    switch viewRouter.currentPage {
                    case .produk:
                        ProdukView(coreDM: CoreDataManager())
                    case .pembeli:
                        PembeliView()
                    case .transaksi:
                        TransaksiView()
                    case .stockOpname:
                        StockOpnameView()
                    case .laporanPenjualan:
                        LaporanPenjualanView()
                    case .laporanPembelian:
                        LaporanPembelianView()
                    case .laporanPiutang:
                        LaporanPiutangView()
                    }
//                        TransaksiView(vminfo: vminfo, viewRouter: viewRouter).environmentObject(envObj)
                    //                TextField("Masukkan Nama Produk", text: $namaProduk).textFieldStyle(RoundedBorderTextFieldStyle())
                    //                Button("Save"){
                    //                    coreDM.saveProduk(nama: namaProduk)
                    //                    hitungProduk()
                    //                }
                    //                Table(produk)
//                    List {
//                        ForEach(produk, id: \.self) { prod in
//                            NavigationLink(
//                                destination: produkDetail(prod:prod, needRefresh: $needRefresh, coreDM: coreDM),
//                                label:{ Text(prod.nama ?? "")
//                                })
//                        }.onDelete(perform: {indexSet in
//                            indexSet.forEach {index in
//                                let prod = produk[index]
//                                // hapus dari CoreData
//                                coreDM.deleteProduk(prod: prod)
//                                hitungProduk()
//                            }
//                        })
//
//                    }.accentColor(needRefresh ? .white:.black)
                                    Spacer()
                    TabBarView(viewRouter: viewRouter)
                        .frame(width: geometry.size.width, height: geometry.size.height/13)
                }
                
//                .padding(.bottom,1)
                
//                .navigationTitle("Produk")
//                .onAppear(perform: {
//                    hitungProduk()
                    
//                })
            }}  .navigationViewStyle(.stack)
        .navigationBarHidden(true)
        
        
    }
    
}

struct TabBarView: View {
    @ObservedObject var viewRouter: ViewRouter
    
    var body: some View {
        HStack {
            TabBarItem(imageName: "produk", imageText: AppText.TabBar.produk.rawValue, viewRouter: viewRouter, assignedPage: .produk)
            TabBarItem(imageName: "pembeli", imageText: AppText.TabBar.pembeli.rawValue, viewRouter: viewRouter, assignedPage: .pembeli)
            TabBarItem(imageName: "transaksi", imageText: AppText.TabBar.transaksi.rawValue, viewRouter: viewRouter, assignedPage: .transaksi)
            TabBarItem(imageName: "stockOpname", imageText: AppText.TabBar.stockOpname.rawValue, viewRouter: viewRouter, assignedPage: .stockOpname)
            TabBarItem(imageName: "laporanPenjualan", imageText: AppText.TabBar.laporanPenjualan.rawValue, viewRouter: viewRouter, assignedPage: .laporanPenjualan)
            TabBarItem(imageName: "laporanPembelian", imageText: AppText.TabBar.laporanPembelian.rawValue, viewRouter: viewRouter, assignedPage: .laporanPembelian)
            TabBarItem(imageName: "laporanPiutang", imageText: AppText.TabBar.laporanPiutang.rawValue, viewRouter: viewRouter, assignedPage: .laporanPiutang)
        }
        .background(Color("tabbar").shadow(radius: 2))
    }
    
}

struct TabBarItem: View{
    var imageName: String
    var imageText: String
    @ObservedObject var viewRouter: ViewRouter
    let assignedPage: mPage
    @State var isPressed = false
    
    var body: some View{
        GeometryReader { geometry in
            HStack {
                ZStack(alignment: .center) {
//                    RoundedRectangle(cornerRadius: 12)
//                        .stroke(Color(.black), lineWidth: 2)
//                        .background(viewRouter.currentPage == assignedPage ? RoundedRectangle(cornerRadius: 20).fill(Color("activeColour")) : RoundedRectangle(cornerRadius: 20).fill(Color("inactiveColour")))
//                        .frame(width: geometry.size.width/1.6, height: geometry.size.height)
                    VStack {
                        Image(imageName)
                            .resizable()
                            .scaledToFit()
                        Text(LocalizedStringKey(imageText))
                            //.font(.title)
                            .font(Font.custom(FontManager.comicNeue.Regular, size: 14))
                            .foregroundColor(.white)
                    }
                }
            }
            .frame(width: geometry.size.width/1, height: geometry.size.height)
//            .padding(.trailing,15)
            .opacity(isPressed ? 0.5 : 1.0)
            .scaleEffect(isPressed ? 1.2 : 1.0)
            
        }
        .onTapGesture {
            viewRouter.currentPage = assignedPage
            
        }
        .pressEvents {
            withAnimation(.easeIn(duration: 0.2)) {
                isPressed = true
            }
        } onRelease: {
            withAnimation {
                isPressed = false
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(coreDM: CoreDataManager())
    }
}
