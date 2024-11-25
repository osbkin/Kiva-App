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
    @State private var filterEnable = false
    @State private var maximumLoanAmount = 10000.0
    
    let columns: [GridItem] = [GridItem(.flexible())]
    
    var body: some View {
        VStack {
            HeaderView()
            
            Button {
                withAnimation(.linear) {
                    self.filterEnable.toggle()
                    self.loanStore.filterLoans(maxAmount: Int(self.maximumLoanAmount)) }
            } label: {
                Text("Filter")
                    .padding(.horizontal, 50)
                    .padding(.vertical, 4)
                    .background(.bgColorPB)
                    .font(.title2)
                    .foregroundColor(.bgColorBW)
                    .bold()
                    .clipShape(Capsule())
            }
            .padding(.top, 10)
            
            ScrollView(.vertical) {
                if filterEnable {
                    LoadFilterView(amount: self.$maximumLoanAmount)
                        .transition(.opacity)
                }
                
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
