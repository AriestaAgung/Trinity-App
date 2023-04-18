//
//  NetworkManager.swift
//  Trinity App
//
//  Created by BRIMO on 18/04/23.
//

import Foundation
import Alamofire
class NetworkManager {
    static let shared: NetworkManager = NetworkManager()
    static let emptyRequest: EmptyRequest = EmptyRequest()
    func callApi<T: Codable, U: Codable>(urlString: String, parameter: U? = nil, method: HTTPMethod, responseModel: T.Type, completion: @escaping (Result<T, AFError>) -> Void) {
        guard let url = URL(string: urlString) else {
            fatalError("Url Not Valid")
        }
        let header: HTTPHeaders = [
            HTTPHeader(name: "Content-type", value: "application/x-www-form-urlencoded")
            
        ]
        var urlRequest = URLRequest(url: url)
        if let parameter = parameter {
            if (parameter is EmptyRequest) == false {
                let parameterData = try? JSONEncoder().encode(parameter)
                urlRequest.httpBody = parameterData
            }
        }
        urlRequest.headers = header
        urlRequest.method = method
        
        AF.request(urlRequest)
            .validate()
            .responseDecodable(of: responseModel) { response in
                DispatchQueue.main.async {
                    completion(response.result)
                }
            }
    }
    
}

struct EmptyRequest: Codable {
}

