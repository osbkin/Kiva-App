//
//  DetailLoanView.swift
//  KivaApp
//
//  Created by Olha Kostenko on 2024-04-02.
//

import SwiftUI

struct DetailLoanView: View {
    
    var loan: Loan
    
    var body: some View {
        RoundedRectangle(cornerRadius: 2)
            .frame(width: 50, height: 4)
            .foregroundColor(.secondary)
            .frame(alignment: .center)
            .padding(.top, 8)
        VStack(alignment: .center) {
            VStack(alignment: .leading) {
                Text(loan.name)
                    .font(.system(.title, design: .rounded))
                    .bold()
                
                Text(loan.country)
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.semibold)
                    .foregroundColor(.secondary)
                
                Text(loan.use)
                    .font(.system(.body, design: .rounded))
                
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.green)
                        .frame(maxWidth: .infinity, maxHeight: 200)
                    
                    Text("$\(loan.amount)")
                        .font(.system(.largeTitle, design: .rounded))
                        .bold()
                        .foregroundColor(.white)
                }
                Spacer()
            }
        }
        .padding(16)
    }
}

#Preview {
    DetailLoanView(loan: Loan.mockData)
}
