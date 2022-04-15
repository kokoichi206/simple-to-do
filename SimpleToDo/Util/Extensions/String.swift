//
//  String.swift
//  SimpleToDo
//
//  Created by Takahiro Tominaga on 2022/04/16.
//

import Foundation

extension String {
    var isBlank: Bool {
        if self.count == 0 {
            return true
        }
        let length = self.count
        var whitespaceCount = 0
        for str in self {
            // 半角 or 全角スペース
            if str == " " || str == "　" {
                whitespaceCount += 1
            } else {
                break
            }
        }
        return whitespaceCount == length
    }
}
