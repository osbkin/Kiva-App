//
//  ContentView.swift
//  KivaApp
//
//  Created by Olha Kostenko on 2024-04-02.
//

import SwiftUI

struct LoanView: View {
    @ObservedObject var loanStore = LoanStore()
    @State private var selectedLoan: Loan?
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(loanStore.loans) { loan in
                    LoanCellView(loan: loan)
                        .padding(.vertical, 5)
                        .onTapGesture {
                            self.selectedLoan = loan
                        }
                }
            }
            .navigationTitle("Kiva Loan")
        }
        .task {
            self.loanStore.fetchLatestLoans()
        }
        .sheet(item: $selectedLoan) { loan in
            DetailLoanView(loan: loan)
                .ignoresSafeArea()
                .presentationDetents([.medium])
        }
        
    }
}

#Preview {
    LoanView()
}
