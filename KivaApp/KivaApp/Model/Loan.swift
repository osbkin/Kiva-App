//
//  Loan.swift
//  KivaApp
//
//  Created by Olha Kostenko on 2024-04-02.
//

import Foundation

struct Loan: Identifiable {
    var id = UUID()
    var name: String
    var country: String
    var code: String
    var use: String
    var amount: Int
    
    init(name: String, country: String, code: String, use: String, amount: Int) {
        self.name = name
        self.country = country
        self.code = code
        self.use = use
        self.amount = amount
    }
}

extension Loan: Codable {
    enum CodingKeys: String, CodingKey {
        case name
        case country = "location"
        case code
        case use
        case amount = "loan_amount"
    }
    
    enum LocationKeys: String, CodingKey {
        case code = "country_code"
        case country
        
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: .name)
        
        let location = try values.nestedContainer(keyedBy: LocationKeys.self, forKey: .country)
        code = try location.decode(String.self, forKey: .code)
        country = try location.decode(String.self, forKey: .country)
        use = try values.decode(String.self, forKey: .use)
        amount = try values.decode(Int.self, forKey: .amount)
    }
}

extension Loan {
    static let mockData = Loan(name: "Olha", country: "Ukraine", code: "UK", use: "to donate to the Ukrainian troops", amount: 25)
}
