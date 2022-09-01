//
//  isKayitInteractor.swift
//  YapilacakIsler(SQLite Veritabani ile)
//
//  Created by Aykut ATABAY on 1.09.2022.
//

import Foundation
class isKayitInteractor:presenterToInteractorKayitProtocol{
    let db:FMDatabase?
    init(){
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("Yapilacaklar.sqlite")
        db = FMDatabase(path: kopyalanacakYer.path)
    }
    func isEkle(is_ad: String) {
        db?.open()
        do{
            try db!.executeUpdate("INSERT INTO Yapilacaklar (is_ad) VALUES(?)", values: [is_ad])
            
            
            
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
}
