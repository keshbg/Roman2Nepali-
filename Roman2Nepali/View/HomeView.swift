//
//  HomeView.swift
//  Roman2Nepali
//
//  Created by Kesh Gurung on 25/04/2024.
//

import SwiftUI

struct HomeView: View {
    @State private var isModalViewPresented = false
    @ObservedObject var viewModel: RomanToNepaliViewModel
    @State private var isCopied = false
    @State private var isTextSelected = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("Type in Roman")
                    .bold()
                
                CustomTextField(text: $viewModel.romanText, placeholder: "Type here...")
                
                HStack {
                    Spacer()
                    CommonButton(action: {
                        viewModel.romanText = ""
                    }, label: "Clear")
                }
                .padding(.bottom, 40)
                
                Text("Nepali Unicode")
                    .bold()
                
                CustomTextField(text: $viewModel.nepaliText, placeholder: "")
                    
                HStack {
                    Spacer()
                    CommonButton(action: {
                        isTextSelected = true
                    }, label: "Select All")
                    
                    CommonButton(action: {
                        // Copy selected text
                        UIPasteboard.general.string = viewModel.nepaliText
                        isCopied = true
                    }, label: "Copy")
                }
                
                Spacer()
                
                Text("&copy;2024 KRy inc.")
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.top, 16)
            }
            .padding(.horizontal, 16)
            .padding(.top, 16)
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Image("welcome")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .clipShape(Circle())
            }
            ToolbarItem(placement: .topBarTrailing){
                Button(action: {
                    isModalViewPresented = true
                }){
                    Image(systemName: "info.circle")
                        .foregroundStyle(.black)
                }
            }
        }
        .padding(.bottom, 50)
        .background(Color(CGColor(gray: 0.9, alpha: 0.0)))
        .navigationBarBackButtonHidden()
        .sheet(isPresented: $isModalViewPresented) {
            HelpView(isPresented: $isModalViewPresented)
        }
    }
}

#Preview {
    HomeView(viewModel: RomanToNepaliViewModel())
}
