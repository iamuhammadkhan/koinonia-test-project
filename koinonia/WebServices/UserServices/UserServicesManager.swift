//
//  UserServicesManager.swift
//  koinonia
//
//  Created by Muhammad Khan on 7/7/21.
//

import Foundation
final class UserServicesManager: NSObject {
    private static var singleton: UserServicesManager?
    private override init() { }
    
    static var shared: UserServicesManager {
        if UserServicesManager.singleton == nil {
            UserServicesManager.singleton = UserServicesManager()
        }
        let lock = DispatchQueue(label: "UserServicesManager")
        return lock.sync { return UserServicesManager.singleton! }
    }
    
    func login(email: String, password: String, completion: @escaping Completion<String>) {
        UserProvider.request(service: .login(email: email, password: password)) { (data, error) in
            if let error = error {
                completion(nil, error)
            } else if let data = data {
                do {
                    let user = try JSONDecoder().decode(String.self, from: data)
                    completion(user, nil)
                } catch {
                    completion(nil, error)
                }
            } else {
                completion(nil, nil)
            }
        }
    }
    
    func register(name: String, email: String, phone: String, password: String, completion: @escaping Completion<String>) {
        UserProvider.request(service: .register(name: name, email: email, phone: phone, password: password)) { (data, error) in
            if let error = error {
                completion(nil, error)
            } else if let data = data {
                do {
                    let user = try JSONDecoder().decode(String.self, from: data)
                    completion(user, nil)
                } catch {
                    completion(nil, error)
                }
            } else {
                completion(nil, nil)
            }
        }
    }
}
