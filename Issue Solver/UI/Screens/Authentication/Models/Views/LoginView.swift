//
//  LoginView.swift
//  Issue Solver
//
//  Created by Vusal Nuriyev on 12.06.24.
//

import SwiftUI

struct LoginView: View {
    @StateObject var vm = LoginViewModel()
    
    var body: some View {
        ZStack {
            Color.surfaceBackground.ignoresSafeArea()
            
            VStack {
                ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 24) {
                    titleView
                    textFieldsView
                    Spacer()
                }
            }
                loginButtonView
        }
            .padding(.horizontal, 16)
            .padding(.bottom, 16)
    }
        .onTapGesture {
            hideKeyboard()
        }
    }
    
    // Title View
    var titleView: some View {
        CustomTitleView(title: "Daxil olun", subtitle: "Zəhmət olmasa, giriş üçün məlumatlarınızı daxil edin.")
    }
    
    var textFieldsView: some View {
        
        VStack(alignment: .trailing, spacing: 20) {
            // Email TextField View
            CustomTextField(placeholder: "E-poçtunuzu daxil edin", title: "E-poçt", text: $vm.emailText)
            
            // Password TextField View
            CustomTextField(placeholder: "Şifrənizi daxil edin", title: "Şifrə", isSecure: true, text: $vm.passwordText)
            
            // Forgot Password Button View
            CustomButton(style: .text, font: .subtitle, title: "Şifrənizi unutmusunuz?") {
                
            }
        }
    }
    
    var loginButtonView: some View {
        VStack {
            // Log in Button View
            CustomButton(title: "Daxil ol", color: canContinue ? .primaryBlue : .primaryBlue.opacity(0.5)) {
                Task {
                    await vm.login()
                }
            }
            .disabled(vm.emailText.isEmpty && vm.passwordText.isEmpty)
            
            // Email Exists Button View
            HStack {
                Text("Hesabınız yoxdur?")
                    .foregroundColor(.secondaryGray)
                CustomButton(style: .text, title: "Qeydiyyatdan keçin") {
                    
                }
            }
            .jakartaFont(.subtitle)
            .padding(.top, 8)
        }
    }
    var canContinue: Bool {
        return !vm.emailText.isEmpty && !vm.passwordText.isEmpty
    }
}

#Preview {
    LoginView()
}
