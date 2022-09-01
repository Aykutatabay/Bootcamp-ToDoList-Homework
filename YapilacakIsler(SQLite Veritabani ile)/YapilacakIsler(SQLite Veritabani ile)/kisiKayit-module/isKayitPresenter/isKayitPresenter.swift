//
//  kisiKayitPresenter.swift
//  YapilacakIsler(SQLite Veritabani ile)
//
//  Created by Aykut ATABAY on 1.09.2022.
//

import Foundation
class isKayitPresenter:viewToPresenterKayitProtocol{
    var isKayitInteractor: presenterToInteractorKayitProtocol?
    
    func ekle(is_ad: String) {
        isKayitInteractor?.isEkle(is_ad: is_ad)
    }
    
    
}
    
