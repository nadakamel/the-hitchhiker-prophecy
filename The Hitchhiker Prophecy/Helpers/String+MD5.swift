//
//  String+MD5.swift
//  The Hitchhiker Prophecy
//
//  Created by Nada Kamel on 15/03/2021.
//  Copyright © 2021 SWVL. All rights reserved.
//

import Foundation
import CryptoKit
//import CommonCrypto

extension String {
    var md5: String {
        let computed = Insecure.MD5.hash(data: self.data(using: .utf8)!)
        return computed.map { String(format: "%02hhx", $0) }.joined()
    }

//    var md5: String {
//        let data = Data(self.utf8)
//        let hash = data.withUnsafeBytes { (bytes: UnsafeRawBufferPointer) -> [UInt8] in
//            var hash = [UInt8](repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))
//            CC_MD5(bytes.baseAddress, CC_LONG(data.count), &hash)
//            return hash
//        }
//        return hash.map { String(format: "%02x", $0) }.joined()
//    }
}
