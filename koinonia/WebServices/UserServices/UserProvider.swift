//
//  UserProvider.swift
//  koinonia
//
//  Created by Muhammad Khan on 7/7/21.
//

import Foundation
import Moya

struct UserProvider {
    
    private init() {}
    
    private static let services = MoyaProvider<UserServices>(plugins: [MoyaPlugin.networkPlugin, NetworkLoggerPlugin()])
    
    static func request(service: UserServices, completion: @escaping Completion<Data>) {
        services.request(service) { (result) in
            switch result {
            case .success(let response):
                completion(response.data, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
