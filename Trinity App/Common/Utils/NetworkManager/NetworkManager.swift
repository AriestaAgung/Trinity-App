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
    func callApi<T: Codable, U: Codable>(urlString: String, parameter: U, method: HTTPMethod, responseModel: T.Type, completion: @escaping (Result<T, AFError>) -> Void) {
        guard let url = URL(string: urlString) else {
            fatalError("Url Not Valid")
        }
        let header: HTTPHeaders = [
            HTTPHeader(name: "Content-type", value: "application/x-www-form-urlencoded")
        ]
        var urlRequest = URLRequest(url: url)
        if (parameter is EmptyRequest) == false {
            let parameterData = try? JSONEncoder().encode(parameter)
            urlRequest.httpBody = parameterData
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
    
    func readMockJSON(name: String, completion: @escaping(Data?, Error?) -> Void) {
        if let path = Bundle.main.path(forResource: name, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                completion(data, nil)
            } catch let errr{
                completion(nil, errr)
            }
        }
    }
}

struct EmptyRequest: Codable {
}

