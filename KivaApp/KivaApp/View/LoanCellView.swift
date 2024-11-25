//
//  LoanCellView.swift
//  KivaApp
//
//  Created by Olha Kostenko on 2024-04-02.
//

import SwiftUI

struct LoanCellView: View {
    var loan: Loan
    
    var body: some View {
        ZStack {
            // shape
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(.bgColorWB))
                .frame(maxWidth: .infinity, minHeight: 70)
            
            // loan code
            HStack(alignment: .center) {
                VStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(.darkPurple))
                        .overlay(content: {
                            Text(loan.code)
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        })
                        .frame(width: 54, height: 54)
                }
                
                // info
                VStack(alignment: .leading) {
                    Text(loan.name)
                        .font(.system(.title3))
                        .bold()
                    
                    Text(loan.country)
                        .font(.system(.body))
                }
                Spacer()
                VStack {
                    Text("$\(loan.amount)")
                        .font(.system(.title2))
                        .bold()
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(8)
        }
        .tint(Color.yellow)
        .padding([.leading, .trailing], 8)
    }
}

#Preview {
    LoanCellView(loan: Loan.mockData)
}
