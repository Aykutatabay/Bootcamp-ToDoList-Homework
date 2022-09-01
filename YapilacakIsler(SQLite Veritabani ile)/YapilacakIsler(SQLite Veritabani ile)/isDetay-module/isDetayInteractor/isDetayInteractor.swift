//
//  isDetayInteractor.swift
//  YapilacakIsler(SQLite Veritabani ile)
//
//  Created by Aykut ATABAY on 1.09.2022.
//

import Foundation
class isDetayInteractor: presenterToInteractorIsDetayProtocol{
    let db:FMDatabase?
    init(){
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("Yapilacaklar.sqlite")
        db = FMDatabase(path: kopyalanacakYer.path)
    }
    func is_guncelle(is_id: Int, is_ad: String) {
        db?.open()
        do{
            try db!.executeUpdate("UPDATE Yapilacaklar SET is_ad = ?  WHERE is_id = ?", values: [is_ad,is_id])
            
            
            
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    
    
    
}
