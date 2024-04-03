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
        VStack {
            VStack {
                RoundedRectangle(cornerRadius: 2)
                    .fill(.white)
                    .opacity(0.5)
                    .frame(width: 50, height: 4, alignment: .center)
                    .padding(.top, 4)
            }
            
            HStack(spacing: 5) {
                VStack(alignment: .leading, spacing: 5) {
                    Text(loan.name)
                        .font(.system(.title))
                        .bold()
                    
                    Text(loan.country)
                        .font(.system(.title3))
                        .fontWeight(.semibold)
                    
                    Text(loan.use)
                        .font(.system(.body))
                }
                .foregroundColor(.dark)
                Spacer()
            }
            .padding(.bottom, 20)
            
            VStack {
                Image("imageBackground")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxHeight: 200)
                    .cornerRadius(10)
                    .overlay {
                        Rectangle()
                            .opacity(0.3)
                            .cornerRadius(10)
                        Text("$\(loan.amount)")
                            .font(.system(size: 50))
                            .bold()
                            .foregroundColor(.white)
                    }
            }
            Spacer()
        }
        .padding(16)
        .background(.warmMint)
    }
}

#Preview {
    DetailLoanView(loan: Loan.mockData)
}
