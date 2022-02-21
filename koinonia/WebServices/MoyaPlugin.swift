//
//  MoyaPlugin.swift
//  koinonia
//
//  Created by Muhammad Khan on 7/7/21.
//

import Foundation
import Moya

struct MoyaPlugin {
    
    private init() {}
    
    static let networkPlugin = NetworkActivityPlugin(networkActivityClosure: { (changeType, _) in
        DispatchQueue.main.async {
            switch changeType {
            case .began:
                UIApplication.startActivityIndicator()
            case .ended:
                UIApplication.stopActivityIndicator()
            }
        }
    })
}
