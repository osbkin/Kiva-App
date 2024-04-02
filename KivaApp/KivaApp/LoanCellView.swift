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
        HStack(alignment: .center) {
            VStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(.green))
                    .overlay(content: {
                        Text(loan.code)
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    })
                    .frame(width: 54, height: 54)
            }
            
            VStack(alignment: .leading) {
                Text(loan.name)
                    .font(.system(.title3, design: .rounded))
                    .bold()
                
                Text(loan.country)
                    .font(.system(.body, design: .rounded))
                
            }
            Spacer()
            VStack {
                Text("$\(loan.amount)")
                    .font(.system(.title2, design: .rounded))
                    .bold()
            } }
        .frame(minWidth: 0, maxWidth: .infinity)
    }
}

#Preview {
    LoanCellView(loan: Loan.mockData)
}
