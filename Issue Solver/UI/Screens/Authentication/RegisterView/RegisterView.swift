//
//  RegisterView.swift
//  Issue Solver
//
//  Created by Vusal Nuriyev on 12.06.24.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject var router: Router
    @StateObject var vm = RegisterViewModel()
   
    var body: some View {
        ZStack {
            Color.surfaceBackground.ignoresSafeArea()
            VStack {
                ScrollView(showsIndicators: false) {
                    VStack (alignment: .leading){
                        titleView
                        textFieldsView
                        Spacer()
                    }
                }
                continueButtonView
            }
            .padding(.horizontal, 20)
            
            if vm.isLoading {
                loadingView
            }
        }
        .navigationBarBackButtonHidden(true)
        .onTapGesture {
            hideKeyboard()
        }
    }
    
    
    // MARK: - TitleView
    var titleView: some View {
        CustomTitleView(title: "Qeydiyyat", subtitle: "Zəhmət olmasa, şəxsi məlumatlarınızı daxil edin.")
    }
    
    // MARK: - TextFieldViews
    var textFieldsView: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            /// - Name Surname Text Field View
            CustomTextField(placeholder: "Ad, Soyad", title: "Ad, Soyad", text: $vm.fullNameText,isRightTextField: $vm.isRightFullName, errorMessage: $vm.fullNameError)
            
            /// - Email Text Field View
            CustomTextField(placeholder: "E-poçtunuzu daxil edin", title: "E-poçt", text: $vm.emailText, isRightTextField: $vm.isRightEmail, errorMessage: $vm.emailError)
                   
            /// - Password TextField View
            VStack(alignment: .leading, spacing: 8) {
                CustomTextField(placeholder: "Şifrənizi təyin edin", title: "Şifrə", isSecure: true, text: $vm.passwordText,isRightTextField: $vm.isRightPassword, errorMessage: $vm.passwordError)
            }
            
            /// - Confirm Password TextField View
            CustomTextField(placeholder: "Şifrənizi təsdiq edin", title: "Şifrənin təsdiqi", isSecure: true, text: $vm.confirmPasswordText,isRightTextField: $vm.isRightConfirmPassword, errorMessage: $vm.confirmPasswordError)
            
            checkboxView
                .padding(.vertical, 8)
        }
        .padding(1)
    }
    
    // MARK: - CheckBoxView
    var checkboxView: some View {
        HStack {
            CustomCheckBox(isChecked: $vm.isChecked, borderColor: vm.showCheckboxError && !vm.isChecked ? .red : .clear)
            
            TextView(text: "Şərtlər və qaydaları qəbul edirəm", clickableTexts: [ Constants.termsOfUse], uiFont: UIFont.jakartaFont(weight: .regular, size: 12)!, isScrollEnabled: false)
        }
    }
    
    // MARK: - BUTTONS
    var continueButtonView: some View {
        VStack {
            CustomButton(title: "Davam et", color: canContinue ? .primaryBlue : .primaryBlue.opacity(0.5)) {
                Task {
                    if !vm.isChecked {
                        vm.showCheckboxError = true
                    } else {
                        vm.showCheckboxError = false
                        vm.isLoading = true
                        await vm.register { success in
                            if success {
                                router.navigate(to: OTPView(isChangePassword: false).environmentObject(router))
                            }
                        }
                    }
                }
            }
            .disabled(vm.fullNameText.isEmpty || vm.emailText.isEmpty || vm.passwordText.isEmpty || vm.confirmPasswordText.isEmpty || !vm.isRightFields)
            
            // MARK: - If Have Already an Account LOGIN BUTTON
            HStack {
                Text("Hesabınız var mı?")
                    .foregroundStyle(.secondaryGray)
                CustomButton(style: .text, title: "Daxil olun") {
                    router.popToRoot()
                }
            }
            .jakartaFont(.subtitle)
            .padding(.top, 8)
        }
    }
    
    // MARK: - For Making Button Color With Opacity Logic
    var canContinue: Bool {
        return !vm.fullNameText.isEmpty && !vm.emailText.isEmpty && !vm.passwordText.isEmpty && !vm.confirmPasswordText.isEmpty && vm.isRightFields && vm.isChecked
    }
    
    // MARK: - LoadingView
    var loadingView: some View {  /// - Creating loading view for some time, to replace actual full customized loading view
        ZStack {
            Color.black.opacity(0.2)
                .ignoresSafeArea()
            ProgressView()
                .progressViewStyle(.circular)
        }
    }
}

#Preview {
    RegisterView()
}
