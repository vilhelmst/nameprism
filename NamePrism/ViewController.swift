//
//  ViewController.swift
//  NamePrism
//
//  Created by Vilhelm Sturen on 2017-09-18.
//  Copyright © 2017 Vilhelm Sturen. All rights reserved.
//

import UIKit
import Foundation
import RxAlamofire
import RxSwift
import HermesNetwork

class ViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var countryLabel: UILabel!
    var country = Variable<String>("")
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.nameTextField.delegate = self;
        setupLabelConfiguration()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

//RX
extension ViewController {
    fileprivate func setupLabelConfiguration() {
        country
            .asObservable()
            .subscribe(onNext: { value in
                self.countryLabel.text = self.country.value
            })
            .addDisposableTo(disposeBag)
    }
}


extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        guard let serviceConfig = ServiceConfig(base: "http://www.name-prism.com/api/json/") else { return true}
        let service: Service = Service(serviceConfig)
        guard let name = nameTextField.text?.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) else { return true }
        SearchScores(name: name)?.execute(in: service).then { scores in
            self.countryLabel.text = scores?.countryForHighestScore()

            }.catch({ err in
                print(err)
            })
        return true
    }
}

