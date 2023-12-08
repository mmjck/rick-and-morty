//
//  Request.swift
//  rick-and-morty
//
//  Created by Jackson Matheus on 06/12/23.
//

import Foundation


final class Request {
    private struct Constants {
        static let baseUrl: String = "https://rickandmortyapi.com/api"
    }
    
    let endPoint: Endpoint
    
    
    private let pathComponents: [String]
    private let queryParameters: [URLQueryItem]
    
    
    private urlString: String {
        var string = Constants.baseUrl
        string += "/"
        string += endPoint.rawValue
        
        
        if !pathComponents.isEmpty {
            pathComponents.forEach({
                string += "/\($0)"
            })
        }
        
        if !queryParameters.isEmpty {
            string += "?"
            let argumentString = queryParameters.compactMap({
                guard let value = $0.value else { return nil }
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            
            string += argumentString
        }
        
        return string
    }
    
    public var url: URL? {
        return URL(string: urlString)
    }
    
    
    public let httpMethod = "Method"
    
    init(endPoint: Endpoint, pathComponents: [String] = [], queryParameters: [URLQueryItem] = []) {
        self.endPoint = endPoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
    
    convenience init?(url: URL) {
        let string = url.absoluteString
        if !string.contains(Constants.baseUrl) {
            return nil
        }
        let trimmed = string.replacingOccurrences(of: Constants.baseUrl+"/", with: "")
        if trimmed.contains("/") {
            let components = trimmed.components(separatedBy: "/")
            if !components.isEmpty {
                let endpointString = components[0] // Endpoint
                var pathComponents: [String] = []
                if components.count > 1 {
                    pathComponents = components
                    pathComponents.removeFirst()
                }
                if let rmEndpoint = Endpoint(
                    rawValue: endpointString
                ) {
                    self.init(endpoint: Endpoint, pathComponents: pathComponents)
                    return
                }
            }
        } else if trimmed.contains("?") {
            let components = trimmed.components(separatedBy: "?")
            if !components.isEmpty, components.count >= 2 {
                let endpointString = components[0]
                let queryItemsString = components[1]
                // value=name&value=name
                let queryItems: [URLQueryItem] = queryItemsString.components(separatedBy: "&").compactMap({
                    guard $0.contains("=") else {
                        return nil
                    }
                    let parts = $0.components(separatedBy: "=")
                    
                    return URLQueryItem(
                        name: parts[0],
                        value: parts[1]
                    )
                })
                
                if let endpoint = Endpoint(rawValue: endpointString) {
                    self.init(endPoint: endPoint, queryParameters: queryItems)
                    return
                }
            }
        }
        
        return nil
    }
}


extension Request {
    static let listCharactersRequest = Request(endPoint: .character)
    static let listEpisodesRequest = Request(endPoint: .episode)
    static let listLocationsRequest = Request(endPoint: .location)
}
