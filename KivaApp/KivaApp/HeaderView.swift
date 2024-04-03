//
//  HeaderView.swift
//  KivaApp
//
//  Created by Olha Kostenko on 2024-04-03.
//

import SwiftUI

struct HeaderView: View {
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
                
                // slider
                RoundedRectangle(cornerRadius: 2)
                    .fill(.bg)
                    .opacity(0.4)
                    .frame(height: 4)
                    .padding([.trailing, .leading], 16)
                    .overlay {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color(.warmMint), lineWidth: 4)
                                .frame(width: 60, height: 60)
                            
                            Circle()
                                .frame(width: 20)
                                .foregroundColor(.bg)
                        }
                    }
                Spacer()
            }
        }
    }
}

#Preview {
    HeaderView()
}
