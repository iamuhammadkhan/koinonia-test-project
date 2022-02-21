//
//  UserServices.swift
//  koinonia
//
//  Created by Muhammad Khan on 7/7/21.
//

import Foundation
import Moya

enum UserServices {
    case login(email: String, password: String)
    case register(name: String, email: String, phone: String, password: String)
    case forgotPassword(email: String)
}

extension UserServices: TargetType {
    var baseURL: URL {
        return URL(string: BaseURL.baseUrl)!
    }
    
    var path: String {
        switch self {
        case .login:
            return "login"
        case .register:
            return "register"
        case .forgotPassword:
            return "customer/password"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .login, .register, .forgotPassword:
            return .post
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .login(let email, let password):
            return .requestParameters(parameters: [ "email": email,
                                                    "password": password ], encoding: URLEncoding.default)
        case .register(let name, let email, let phone, let password):
            return .requestParameters(parameters: [ "email": email,
                                                    "name": name,
                                                    "phone": phone,
                                                    "password": password ], encoding: URLEncoding.default)
        case .forgotPassword(let email):
            return .requestParameters(parameters: [ "email": email ], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .forgotPassword:
            return [ "Authorization": "",
                     "Accept": "application/json"]
        default:
            return [ "Accept": "application/json" ]
        }
    }
}
