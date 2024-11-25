//
//  HeaderView.swift
//  KivaApp
//
//  Created by Olha Kostenko on 2024-04-03.
//

import SwiftUI

struct HeaderView: View {
    @ObservedObject var loanStore = LoanStore()
    @State var maximumLoanAmount: Double = 0.0
    @State private var filterEnabled = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.dark)
                .clipShape(
                    .rect(topLeadingRadius: 0,
                          bottomLeadingRadius: 48,
                          bottomTrailingRadius: 48,
                          topTrailingRadius: 0)
                )
                .ignoresSafeArea()
            VStack(spacing: 16) {
                // logo
                HStack {
                    Spacer()
                    Image("kiwaLogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50)
                        .padding([.top, .trailing], 20)
                }
                Spacer()
                // text
                Text("Make a loan, \nchange live")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.warmMint)
                    .padding(.bottom, 40)
                Spacer()
            }
        }
    }
}

#Preview {
    HeaderView()
}
