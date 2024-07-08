//
//  QueryDetailView.swift
//  Issue Solver
//
//  Created by Valeh Amirov on 07.07.24.
//

import SwiftUI

struct QueryDetailView: View {

    @EnvironmentObject var router: Router

//    var postText: String = ""
//    var isDetailView: Bool
//    var postToGovernmentName: String
//    var userName: String
//    var postStatus: String
    @State var isLike: Bool = false
    @State private var isPresented: Bool = false
    
    var body: some View {
        ZStack {
            Color.surfaceBackground.ignoresSafeArea()
            ScrollView {
                VStack {
                    CustomPostRowView(postText: "postText", isDetailView: true, postToGovernmentName: "Daxili İşlər Nazirliyi", userName: "Valeh Amirov", postStatus: "Gözləmədə", isLiked: $isLike) {
                        isPresented.toggle()
                    }
                    .fullScreenCover(isPresented: $isPresented, content: {
                        QueryCommentBottomSheetView()
                    })
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 16)
            }
            .navigationBarBackButtonHidden(true)
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                backButtonView
            }
        }
    }
    
    var backButtonView: some View {
        CustomButton(style: .back, title: "") {
            router.dismissView()
        }
    }

}


#Preview {
    QueryDetailView()
}
