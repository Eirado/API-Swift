//
//  CoinModel.swift
//  APIandTesting
//
//  Created by Gabriel Eirado on 26/06/24.
//

import Foundation

struct Coins: Codable{
    let quotes: [String: Float]
}

struct CurrenciesName: Codable{
    let currencies: [String: String]
}

