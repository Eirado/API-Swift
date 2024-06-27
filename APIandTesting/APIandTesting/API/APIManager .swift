//
//  API Manager .swift
//  APIandTesting
//
//  Created by Gabriel Eirado on 25/06/24.
//

import Foundation

enum FetchError: Error {
    case invalidURL
    case networkError(Error)
    case decodingError(Error)
}

class APIManager: ObservableObject{
    
    func fetch<T: Codable>(httpLink: String, object: T) async -> Result<T, FetchError> {
        
        guard let url = URL(string: httpLink) else {
            return .failure(.invalidURL)
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            if let httpResponse = response as? HTTPURLResponse, (200..<300).contains(httpResponse.statusCode) {
                let decodedObject = try JSONDecoder().decode(T.self, from: data)
                return .success(decodedObject)
            } else {
                return .failure(.networkError(NSError(domain: "Invalid response", code: 0, userInfo: nil)))
            }
        } catch let error as DecodingError {
            return .failure(.decodingError(error))
        } catch {
            return .failure(.networkError(error))
        }
    }
    
    
    func fetchWithCompletion<T: Codable>(httpLink: String, completion: @escaping(Result<T,Error>) -> Void){
        
        guard let url = URL(string: httpLink) else { return print("Cant find \(httpLink)") } // create a url
        

        URLSession.shared.dataTask(with: url) { data, response, error in // session
            
            if let error = error{
                completion(.failure(error))
                return
            }
                    
            guard let data = data else { return }
            
            guard let coins = try? JSONDecoder().decode(T.self, from: data) else { return print("Failed to decode")}
  
            completion(.success(coins))
            
        }.resume()
    }
}

