//
//  String+MD5.swift
//  The Hitchhiker Prophecy
//
//  Created by Nada Kamel on 15/03/2021.
//  Copyright © 2021 SWVL. All rights reserved.
//

import Foundation
import CryptoKit

extension String {
    var md5: String {
        let computed = Insecure.MD5.hash(data: self.data(using: .utf8)!)
        return computed.map { String(format: "%02hhx", $0) }.joined()
    }
}
