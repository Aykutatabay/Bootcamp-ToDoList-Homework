//
//  isDetayPresenter.swift
//  YapilacakIsler(SQLite Veritabani ile)
//
//  Created by Aykut ATABAY on 1.09.2022.
//

import Foundation
class isDetayPresenter:viewToPresenterIsDetayProtocol{
    var isDetayInteractor: presenterToInteractorIsDetayProtocol?
    
    func guncelle(is_id: Int, is_ad: String) {
        isDetayInteractor?.is_guncelle(is_id: is_id, is_ad: is_ad)
    }
    
    
    
    
}

