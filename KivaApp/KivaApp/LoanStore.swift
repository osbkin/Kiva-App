//
//  LoanStore.swift
//  KivaApp
//
//  Created by Olha Kostenko on 2024-04-02.
//

import Foundation

class LoanStore: Decodable, ObservableObject {
    
    private static var kivaLoanURL = "https://api.kivaws.org/v1/loans/newest.json"
    
    @Published var loans: [Loan] = []
    
    enum CodingKeys: CodingKey {
        case loans
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        loans = try values.decode([Loan].self, forKey: .loans)
    }
    
    init() {}
    
    func fetchLatestLoans() {
        
        guard let loanUrl = URL(string: Self.kivaLoanURL) else { return }
        
        let request = URLRequest(url: loanUrl)
        let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
            if let error = error {
                print(error)
                return
            }
            
        // MARK: - Parse JSON data
            if let data = data {
                DispatchQueue.main.async {
                    self.loans = self.parseJsonData(data: data)
                }
            }
        })
        task.resume()
    }
    
    func parseJsonData(data: Data) -> [Loan] {
        let decoder = JSONDecoder()
        
        do {
            let loanStore = try decoder.decode(LoanStore.self, from: data)
            self.loans = loanStore.loans
        } catch {
            print(error)
        }
        return loans
    }
}