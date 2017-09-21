//
//  Score.swift
//  NamePrism
//
//  Created by Vilhelm Sturen on 2017-09-21.
//  Copyright © 2017 Vilhelm Sturen. All rights reserved.
//

import Foundation
import SwiftyJSON

public class ScoreModel {
    var scoreDict: [String: Float]

    public init?(_ json: JSON) {
        guard let testDict = json.dictionaryObject as? [String: Float] else { return nil }
        self.scoreDict = testDict

    }

    public func countryForHighestScore() -> String {
        var sortedScoreDict = self.scoreDict.sorted{ $0.1 > $1.1 }
        return sortedScoreDict[0].key
    }

}
