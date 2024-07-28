//
//  APIManager.swift
//  WeatherForecast
//
//  Created by Rishab Maharjan on 28/07/2024.
//

import Foundation
import Combine

class APIManager {
    static let shared = APIManager() // Singleton instance
    
    static let baseURL = "https://api.met.no/weatherapi"
    
    private init() {}
    
    func fetchData<T: Decodable>(_ call: APICall, baseUrl: String = APIManager.baseURL) -> AnyPublisher<(T), Error> {
        do {
            var request = try call.urlRequest(baseURL: APIManager.baseURL)
            request.httpMethod = HTTPMethod.get.identifier
            return URLSession.shared.dataTaskPublisher(for: request)
                .tryMap { output in
                    guard let httpResponse = output.response as? HTTPURLResponse else {
                        throw URLError(.badServerResponse)
                    }
                    
                    
                    return (try JSONDecoder().decode(T.self, from: output.data))
                }
            
                .eraseToAnyPublisher()
        } catch {
            return Fail(error: error).eraseToAnyPublisher()
        }
    }
}

