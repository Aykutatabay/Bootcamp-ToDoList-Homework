//
//  anasayfaInteractor.swift
//  YapilacakIsler(SQLite Veritabani ile)
//
//  Created by Aykut ATABAY on 1.09.2022.
//

import Foundation
class anasayfaInteractor : presenterToInteractorAnasayfa{
    var presenterAnasayfa: interactorToPresenterAnasayfa?
    let db:FMDatabase?
    init(){
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("Yapilacaklar.sqlite")
        db = FMDatabase(path: kopyalanacakYer.path)
    }
    
    func isleriAl() {
        var liste = [YapilacakIsler]()
        db?.open()
        do{
            let q = try db!.executeQuery("SELECT * FROM Yapilacaklar", values: nil)
            
            while q.next(){
                let kisi = YapilacakIsler(is_id: Int(q.string(forColumn: "is_id"))!, is_ad: q.string(forColumn: "is_ad")!)
                liste.append(kisi)
            }
            presenterAnasayfa?.presenteraVeriGonder(isListesi: liste)
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func isAra(aramaKelimesi: String) {
        var liste = [YapilacakIsler]()
        
        db?.open()
        do{
            let q = try db!.executeQuery("SELECT * FROM Yapilacaklar WHERE is_ad like '%\(aramaKelimesi)%'", values: nil)
            while q.next(){
                let yapilacak = YapilacakIsler(is_id: Int(q.string(forColumn: "is_id"))!, is_ad: q.string(forColumn: "is_ad")!)
                liste.append(yapilacak)
            }
            presenterAnasayfa?.presenteraVeriGonder(isListesi: liste)
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func isSil(is_id: Int) {
        db?.open()
        do{
            try db!.executeUpdate("DELETE FROM Yapilacaklar WHERE is_id = ?", values: [is_id])
            isleriAl()
            
            
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    
}
