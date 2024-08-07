//
//  CustomTextField.swift
//  Issue Solver
//
//  Created by Vusal Nuriyev 2 on 11.06.24.
//

import SwiftUI

struct CustomTextField: View {
    var placeholder: String?
    var title: String?
    var clickableText: [String: String]?
    var isSecure: Bool = false
    var textColor: Color?
    var color: Color?
    
    var clickableTextWidth: CGFloat?
    var clickableTextHeight: CGFloat?
    
    @Binding var text: String
    @Binding var errorMessage: String?
    @Binding var isRightTextField: Bool
    @State var isShowPassword: Bool = false
    
    init(placeholder: String? = nil, title: String? = nil, isSecure: Bool = false, textColor: Color? = nil, color: Color? = nil, text: Binding<String>, isRightTextField: Binding<Bool> = .constant(true), isShowPassword: Bool = false, errorMessage: Binding<String?> = .constant(nil), clickableText: [String: String]? = nil, clickableTextWidth: CGFloat? = nil,clickableTextHeight: CGFloat? = nil) {
        self.placeholder = placeholder
        self.title = title
        self.isSecure = isSecure
        self.textColor = textColor
        self.color = color
        self._text = text
        self._isRightTextField = isRightTextField
        self.isShowPassword = isShowPassword
        self._errorMessage = errorMessage
        self.clickableText = clickableText
        self.clickableTextWidth = clickableTextWidth
        self.clickableTextHeight = clickableTextHeight
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            titleView
            textFieldView
        }
    }
    
    // TitleView
    var titleView: some View {
        ZStack {
            if let title {
                Text(title)
                    .jakartaFont(.heading)
                    .foregroundStyle(isRightTextField ? (textColor ?? .black) :  .red)
            }
        }
    }
    
    // Custom TextField view
    var textFieldView: some View {
        VStack(alignment: .leading) {
            Group {
                if !isSecure {
                    TextField(placeholder ?? "", text: $text)

                } else {
                    HStack {
                        if isShowPassword {
                            TextField(placeholder ?? "", text: $text)

                        } else {
                            SecureField(placeholder ?? "", text: $text)

                        }
                        HStack {
                            showPasswordButtonView
                        }
                    }
                }
            }
            .padding()
            .overlay(RoundedRectangle(cornerRadius: Constants.cornerRadius).stroke((isRightTextField) ? Color.clear : Color.red, lineWidth: 1))
            .background {
                RoundedRectangle(cornerRadius: Constants.cornerRadius)
                    .fill(color ?? .white)
            }
            .textInputAutocapitalization(.never)
            
            HStack {
                if let errorMessage {
                    Text(errorMessage)
                        .jakartaFont(.subtitle2)
                        .foregroundStyle(.red)
                    Spacer()
                }
                if let clickableText {
                    ZStack {
                        TextView(clickableTexts: [clickableText], uiFont: UIFont.jakartaFont(weight: .regular, size: 12)!, isScrollEnabled: false)
                    }
                    .frame(width: clickableTextWidth,height: clickableTextHeight)
                }
            }
        }
        .jakartaFont(.subtitle)
    }
    
    // Show/hide password
    var showPasswordButtonView: some View {
        Button {
            isShowPassword.toggle()
        } label: {
            Image(isShowPassword ? "eye" : "closeeye")
                .foregroundStyle(isRightTextField ? Color.primaryBlue :  .red)
                .background(.white)
        }
    }
    
}

