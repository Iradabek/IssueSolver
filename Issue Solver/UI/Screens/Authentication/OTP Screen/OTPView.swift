//
//  OTPView.swift
//  Issue Solver
//
//  Created by Irada Bakirli on 11.06.24.
//

import SwiftUI

struct OTPView: View {
    
    var body: some View {
        
        ZStack {
            Color.surfaceBackground
                .ignoresSafeArea()

            VStack(alignment: .leading, spacing: 24) {
                backButtonView
                titleView
                OTPTextField(numberOfFields: 6)
                timerView
                Spacer()
                confirmButtonView
            }
            .padding(.top, 24)
            .padding(.horizontal, 16)
            .padding(.bottom, 16)

            }
        }
    
    // Back Button View
    var backButtonView: some View {
        CustomButton(style: .back, title: "") {
        }
    }
    
    //Title View
    var titleView: some View {
        CustomTitleView(title: "Təsdiq Kodu", subtitle: "E-poçtunuza gələn təsdiq kodunu daxil edin.")
    }
    
    //Countdown View
    var timerView: some View {
        HStack {
            Text("Qalan vaxt:")
                .foregroundStyle(.primaryBlue)
                .font(.system(size: 17))
            CountdownView()
        }
    }
    
    // Button View
    var confirmButtonView: some View {
        
        VStack(spacing: 16) {
            
            CustomButton(title: "Təsdiqlə") {
               // TODO: action must be added here
            }
            
            CustomButton(style: .text, title: "Kodu yenidən göndər") {
                
            }
            
        }
    }
}


#Preview {
    OTPView()
}
