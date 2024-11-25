//
//  CustomSliderView.swift
//  KivaApp
//
//  Created by Olha Kostenko on 2024-04-03.
//

import SwiftUI

struct CustomSliderView: View {
    
    @State var offset: CGFloat = 0
    
    @State private var maximumLoanAmount: Double = 0.0
    @State private var filterEnabled = false
    
    // Slider Properties
    @State var sliderProgress: CGFloat = 0
    @State var lastDragValue: CGFloat = 0
    
    
    var body: some View {
        VStack {
            
            ZStack(alignment: Alignment(horizontal: .leading, vertical: .center), content: {
                
                Capsule()
                    .fill(.bg)
                    .opacity(0.4)
                    .frame(height: 4)
                    .padding([.trailing, .leading], 30)
                
                Capsule()
                    .fill(.bg)
                    .frame(width: offset, height: 4)
                    .padding([.trailing, .leading], 30)
                
                
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color(.warmMint), lineWidth: 4)
                    .frame(width: 60, height: 60)
                    .overlay {
                        Circle()
                            .frame(width: 20)
                            .foregroundColor(.bg)
                    }
                    .offset(x: offset)
                    .gesture(DragGesture()
                        .onChanged({ (value) in
                            
                            // padding + circle radius
                            if value.location.x > 20 && value.location.x <= UIScreen.main.bounds.width - 60 {
                                offset = value.location.x - 20
                                
                                let progress = (offset / (UIScreen.main.bounds.width - 60)) * 2000
                                print(progress)
                                sliderProgress = progress <= 15000 ? sliderProgress : 15000
                                maximumLoanAmount = progress
                            }
                        })
                            .onEnded({ (value) in
                                lastDragValue = offset
                                
                            }))
                
            })
            
            Text("Less $\(Int(maximumLoanAmount))")
                .font(.title3)
                .foregroundColor(.white)
                .padding(.top, 10)
        }
        .padding(.horizontal, 8)
    }
}

#Preview {
    CustomSliderView()
}
