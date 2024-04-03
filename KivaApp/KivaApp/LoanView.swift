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
    
    let columns: [GridItem] = [GridItem(.flexible())]
    
    var body: some View {
        VStack {
            HeaderView()
            
            ScrollView(.vertical) {
                LazyVGrid(columns: columns) {
                    ForEach(loanStore.loans) { loan in
                        LoanCellView(loan: loan)
                            .padding(.vertical, 8)
                            .onTapGesture {
                                self.selectedLoan = loan
                            }
                    }
                }
            }
            .task {
                self.loanStore.fetchLatestLoans()
            }
            .sheet(item: $selectedLoan) { loan in
                DetailLoanView(loan: loan)
                    .ignoresSafeArea()
                    .presentationDetents([.medium])
                    .presentationCornerRadius(48)
            }
            .background(.bgColor1)
        }
        .background(.bgColor1)
    }
    
}

#Preview {
    LoanView()
}
