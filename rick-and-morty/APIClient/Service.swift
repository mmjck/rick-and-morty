//
//  Service.swift
//  rick-and-morty
//
//  Created by Jackson Matheus on 07/12/23.
//

import Foundation


final class Service {
    static let shared = Service()
    
    
    private let cacheManager = APICacheManager()

    private init() {
        
    }
    
    
    enum ServiceError: Error {
        case failedToCreateRequest
        case failedToGetData

    }
    
    
    public func execute<T: Codable> (
        _ request: Request,
        expecting type: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    ){
        
        if let cachedData = cacheManager.cachedResponse(for: request.endPoint, url: request.url)
        {
            do {
                let result = try JSONDecoder().decode(type.self, from: cachedData)
                completion(.success(result))
            }catch {
                completion(.failure(error))
                
            }
            
            return
        }
        
        guard let urlRequest = self.request(from: request) else {
            completion(.failure(ServiceError.failedToCreateRequest))
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) {
            [weak self] data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? ServiceError.failedToGetData))
                return
            }
            
            
            do {
                let result = try JSONDecoder().decode(type.self, from: data)
                completion(.success(result))
            }catch {
                completion(.failure(error))

            }
        }
    }
    
    
    
    private func request(from rqt: Request) -> URLRequest?{
        guard let url = rqt.url else {
            return nil
        }
        
        var currentRequest = URLRequest(url: url)
        currentRequest.httpMethod = currentRequest.httpMethod
        return currentRequest
    }
}
