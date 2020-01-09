//
//  String+Localize.swift
//  iOSSampler
//
//  Created by Yuki Okudera on 2020/01/09.
//  Copyright © 2020 YukiOkudera. All rights reserved.
//

import Foundation

extension String {
    
    var localized: String {
      return NSLocalizedString(self, comment: "")
    }
}
