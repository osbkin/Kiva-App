//
//  LoaderFilterView.swift
//  KivaApp
//
//  Created by Olha Kostenko on 2024-04-03.
//

import SwiftUI

struct LoadFilterView: View {
    
    @Binding var amount: Double
    
    var minAmount = 0.0
    var maxAmount = 10000.0
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Show loan amount below $\(Int(amount))")
                .font(.system(.headline))
            
            HStack {
                Slider(value: $amount, in: minAmount...maxAmount, step: 100) .accentColor(.green1)
            }
            
            HStack {
                Text("\(Int(minAmount))")
                    .font(.system(.footnote))
                
                Spacer()
                
                Text("\(Int(maxAmount))")
                    .font(.system(.footnote))
            }
        }
        .padding(.horizontal)
        .padding(.bottom, 10)
    }
}

#Preview {
    LoadFilterView(amount: .constant(10000))
}
