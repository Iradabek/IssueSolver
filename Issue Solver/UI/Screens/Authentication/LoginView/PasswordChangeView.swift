//
//  PasswordChangeView.swift
//  Issue Solver
//
//  Created by Irada Bakirli on 14.06.24.
//

import SwiftUI

struct PasswordChangeView: View {
    
    @StateObject var authVM: AuthViewModel = AuthViewModel()
    
    var body: some View {
        
        ZStack {
            Color.surfaceBackground.ignoresSafeArea()
            
            VStack (spacing: 24 ) {
                titleView
                textFieldView
                Spacer()
                renewButtonView
            }
            .padding(.top, 24)
            .padding(.horizontal, 16)
            .padding(.bottom, 16)
        }
    }
    
    //Title View
    var titleView: some View {
        CustomTitleView(title: "Yeni şifrə", subtitle: "Daxil olmaq üçün yeni şifrə təyin edin.")
    }
    
    //Text Field View
    
    var textFieldView: some View {
        VStack (spacing: 20 ){
            
            CustomTextField(placeholder: "Şifrənizi təyin edin",title: "Şifrə", isSecure: true, text: $authVM.passwordText)
            
            CustomTextField(placeholder: "Şifrənizi təsdiq edin",title: "Şifrənin təsdiqi", isSecure: true, text: $authVM.confirmPasswordText)
        }
    }
    
    // Renew Button View
    var renewButtonView: some View {
        CustomButton(title: "Yenilə") {
            // TODO: action must be added here
        }
    }
    
}

#Preview {
    PasswordChangeView()
}