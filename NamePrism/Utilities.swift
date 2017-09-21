//
//  Utilities.swift
//  NamePrism
//
//  Created by Vilhelm Sturen on 2017-09-18.
//  Copyright © 2017 Vilhelm Sturen. All rights reserved.
//

import Foundation
import RxAlamofire
import RxSwift
import Alamofire

class Utilities {
    let disposeBag = DisposeBag()


//    static func search(with Name: String) {
//        let sourceStringURL = "http://www.name-prism.com/api/json/Barack%20Obama"
//
//        RxAlamofire.requestJSON(.get, sourceStringURL)
//            .debug()
//            .subscribe(onNext: { [weak self] (r, json) in
//
//
//            if let dict = json as? [String: AnyObject] {
//                let valDict = dict["rates"] as! Dictionary<String, AnyObject>
//                if let conversionRate = valDict["USD"] as? Float {
//                    self?.toTextField.text = formatter
//                        .string(from: NSNumber(value: conversionRate * fromValue))
//                }
//            }
//                }, onError: { [weak self] (error) in
//                    self.displayError(error as NSError)
//            })
//            .addDisposableTo(disposeBag)
//    }

}
