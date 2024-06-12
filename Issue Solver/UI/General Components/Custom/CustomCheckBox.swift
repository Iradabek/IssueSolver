//
//  CustomCheckBox.swift
//  Issue Solver
//
//  Created by Vusal Nuriyev on 12.06.24.
//

import SwiftUI

struct CustomCheckBox: View {
    @Binding var isChecked: Bool
    let boxSize: CGSize = CGSize(width: 25, height: 25)
    
    var body: some View {
        Button {
            withAnimation {
                isChecked.toggle()
            }
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: Constants.cornerRadius/2)
                    .fill(Color(.systemBackground))
                if isChecked {
                    Image(systemName: "checkmark")
                }
            }
        }
        .frame(width: boxSize.width, height: boxSize.height)
    }
    
}
