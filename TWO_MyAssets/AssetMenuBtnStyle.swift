//
//  AssetMenuBtnStyle.swift
//  TWO_MyAssets
//
//  Created by 이윤수 on 2022/07/26.
//

import SwiftUI

struct AssetMenuBtnStyle: ButtonStyle {
    let menu : AssetMenu
    
    func makeBody(configuration: Configuration) -> some View {
        return VStack{
            Image(systemName: menu.systemImageName)
                .resizable()
                .frame(width: 30, height: 30)
                .padding([.leading, .trailing], 15)
            Text(menu.title)
                .font(.system(size: 12, weight: .bold))
        }
        .padding([.top, .bottom], 10)
        .foregroundColor(.black)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct AssetMenuBtnStyle_Previews: PreviewProvider {
    static var previews: some View {
        HStack(spacing: 24){
            Button(""){
                print("")
            }.buttonStyle(AssetMenuBtnStyle(menu: .creditScore))
            Button(""){
                print("")
            }.buttonStyle(AssetMenuBtnStyle(menu: .bankAccount))
            Button(""){
                print("")
            }.buttonStyle(AssetMenuBtnStyle(menu: .creditCard))
            Button(""){
                print("")
            }.buttonStyle(AssetMenuBtnStyle(menu: .cash))
        }
    }
}
