//
//  PersonView.swift
//  PersonView
//
//  Created by Andrew Ushakov on 9/5/21.
//

import SwiftUI

struct PersonView: View {
    var body: some View {
        ZStack {
            VStack {
                Image("p1")
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: 40))
                    .frame(width: 390, height: 370)
                    .edgesIgnoringSafeArea(.all)
                
                Spacer()
            }
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 340, height: 230)
                .foregroundColor(.white)
                .shadow(color: .blue, radius: 5)
            
            VStack(alignment: .leading) {
                Text("Sarah Kadir")
                    .font(.title)
                    .opacity(0.8)
                    .padding()
                
                Text("Moscow, Russia")
                    .font(.callout)
                    .foregroundColor(.gray)
                    .padding()
                
                Text("🇺🇸")
                    .font(.callout)
                    .foregroundColor(.gray)
                    .padding()
            }.padding(.trailing, 150)
                .padding(.bottom,30)
        }
    }
}

struct PersonView_Previews: PreviewProvider {
    static var previews: some View {
        PersonView()
    }
}
