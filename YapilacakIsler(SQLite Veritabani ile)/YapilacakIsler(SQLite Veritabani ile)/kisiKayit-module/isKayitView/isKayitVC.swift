//
//  isKayit.swift
//  YapilacakIsler(SQLite Veritabani ile)
//
//  Created by Aykut ATABAY on 1.09.2022.
//

import UIKit

class isKayitVC: UIViewController {

    @IBOutlet weak var TFYapilacakIs: UITextField!
    var isKayitViewNesne:viewToPresenterKayitProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        isKayitRouter.createModule(ref: self)

        
    }
    
    @IBAction func ButtonKayit(_ sender: Any) {
        if let ia = TFYapilacakIs.text {
            isKayitViewNesne?.ekle(is_ad: ia)
        }
    }
    
}
