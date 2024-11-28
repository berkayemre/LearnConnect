//
//  MockAuthService.swift
//  LearnConnect
//
//  Created by Berkay Emre Aslan on 28.11.2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class FirebaseAuthService: AuthServiceProtocol {
    func signIn(email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(()))
            }
        }
    }
}

protocol AuthServiceProtocol {
    func signIn(email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void)
}

class MockAuthService: AuthServiceProtocol {
    var shouldSucceed = true
    var errorToReturn: Error?

    func signIn(email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void) {
        if shouldSucceed {
            completion(.success(()))
        } else if let error = errorToReturn {
            completion(.failure(error))
        }
    }
        
    var shouldLogOutSucceed = true
    var logOutError: Error?

    func signOut() throws {
        if !shouldLogOutSucceed, let error = logOutError {
            throw error
        }
    }
}


