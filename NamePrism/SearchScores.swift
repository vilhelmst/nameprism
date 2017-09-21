//
//  SearchScores.swift
//  NamePrism
//
//  Created by Vilhelm Sturen on 2017-09-21.
//  Copyright © 2017 Vilhelm Sturen. All rights reserved.
//

import Foundation
import HermesNetwork


public class SearchScores : JSONOperation<ScoreModel?> {

    public init?(name: String) {
        super.init()
        self.request = Request(method: .get, endpoint: "{name}", params: ["name" : name])
        self.onParseResponse = { json in
            return ScoreModel(json)
        }
    }

}
