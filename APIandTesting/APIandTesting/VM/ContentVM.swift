//
//  ContentVM.swift
//  APIandTesting
//
//  Created by Gabriel Eirado on 26/06/24.
//

import Foundation

class ContentVM: ObservableObject{
    let apiManager = APIManager()
    
    let codeAndName = "https://raw.githubusercontent.com/Banking-iOS/mock-interview/main/api/list.json"
    let codeAndQuotation = "https://raw.githubusercontent.com/Banking-iOS/mock-interview/main/api/live.json"
   
    
    var coins: Coins?
    var currenciesName: CurrenciesName?
    
    
    init(){
        fetch()
    }

        
    func converter(){
        let converter = CurrencyConverter(coins: <#T##Coins#>, currenciesName: <#T##CurrenciesName#>)
    }
    
    func fetch(){
        Task {
            let result = await apiManager.fetch(httpLink: codeAndName, object: currenciesName)
            switch result {
            case .success(let decodedObject):
                print("Successfully fetched and decoded: \(String(describing: decodedObject))")
            case .failure(let error):
                switch error {
                case .invalidURL:
                    print("Invalid URL.")
                case .networkError(let networkError):
                    print("Network error: \(networkError.localizedDescription)")
                case .decodingError(let decodingError):
                    print("Decoding error: \(decodingError.localizedDescription)")
                }
            }
        }
    }
    
    func fetchCompletion() { // Need do handle errors better here
        apiManager.fetchWithCompletion(httpLink: codeAndQuotation) { (result: Result<Coins, Error>) in
            switch result {
                
            case .success(let fetchedCoins):
                print(fetchedCoins)
                
            case .failure(let error):
                print("Error fetching coins: \(error)")
            }
        }
    }
}


