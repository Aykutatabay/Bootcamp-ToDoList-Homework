//
//  anasayfaPresenter.swift
//  YapilacakIsler(SQLite Veritabani ile)
//
//  Created by Aykut ATABAY on 1.09.2022.
//

import Foundation
class anasayfaPresenter:viewToPresenterAnasayfa{
    
    var interactorAnasayfa: presenterToInteractorAnasayfa?
    
    var viewAnasayfa: presenterToViewAnasayfa?
    
    func isleriYukle() {
        interactorAnasayfa?.isleriAl()
    }
    
    func ara(aramaKelimesi: String) {
        interactorAnasayfa?.isAra(aramaKelimesi: aramaKelimesi)
    }
    
    func sil(is_id: Int) {
        interactorAnasayfa?.isSil(is_id: is_id)
    }
}
extension anasayfaPresenter:interactorToPresenterAnasayfa{
    func presenteraVeriGonder(isListesi: Array<YapilacakIsler>) {
        viewAnasayfa?.vieweVeriGonder(isListesi: isListesi)
    }
    
    
    
    
}
