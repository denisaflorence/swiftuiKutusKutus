//
//  CoreDataManagers.swift
//  HelloCoreData
//
//  Created by Denisa on 16/01/23.
//

import Foundation
import CoreData

class CoreDataManager {
    let persistentContainer : NSPersistentContainer
    
    init() {
        persistentContainer = NSPersistentContainer(name: "HelloCoreDataModel")
        persistentContainer.loadPersistentStores {(description,error) in
            if let error = error {
                fatalError("Core Data Store Failed \(error.localizedDescription)")
            }
        }
    }
    
    func getAllProduk() -> [Produk] {
        let fetchRequest: NSFetchRequest<Produk> = Produk.fetchRequest()
        do{
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            return[]
        }
    }
    
    func updateProduk(){
        do{
            try persistentContainer.viewContext.save()
        } catch{
            persistentContainer.viewContext.rollback()
        }
    }
    
    func deleteProduk(prod:Produk) {
        persistentContainer.viewContext.delete(prod)
        
        do{
            try persistentContainer.viewContext.save()
        } catch{
            persistentContainer.viewContext.rollback()
            print("Gagal untuk menyimpan data \(error)")
        }
    }
    func saveProduk(nama : String) {
        let produk = Produk(context: persistentContainer.viewContext)
        produk.nama = nama
        
        do{
            try persistentContainer.viewContext.save()
        } catch {
            print("Failed to save the produk \(error)")
        }
        
    }
}
