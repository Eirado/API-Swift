//
//  File.swift
//  APIandTesting
//
//  Created by Gabriel Eirado on 26/06/24.
//

import Foundation

class CurrencyConverter {
    let coins: Coins
    let currenciesName: CurrenciesName
    
    init(coins: Coins, currenciesName: CurrenciesName) {
        self.coins = coins
        self.currenciesName = currenciesName
    }
    
    func convert(amount: Float, fromCurrency: String, toCurrency: String) -> Float? {
        guard let fromRate = coins.quotes["USD\(fromCurrency)"],
              let toRate = coins.quotes["USD\(toCurrency)"] else {
            return nil
        }
        
        let amountInUSD = amount / fromRate
        let convertedAmount = amountInUSD * toRate
        return convertedAmount
    }
    
    func getCurrencyName(forCode code: String) -> String? {
        return currenciesName.currencies[code]
    }
}
