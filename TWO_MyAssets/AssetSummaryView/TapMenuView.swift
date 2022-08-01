//
//  TapMenuView.swift
//  TWO_MyAssets
//
//  Created by 이윤수 on 2022/08/01.
//

import SwiftUI

struct TapMenuView: View {
    var tabs : [String]
    @Binding var seletedTap : Int
    @Binding var updated : CreditCardAmounts?
    
    
    var body: some View {
        HStack(spacing: 20){
            ForEach(0..<tabs.count, id: \.self){ row in
                Button(
                    action: {
                    seletedTap = row
                        UserDefaults.standard.set(true, forKey: "checked\(row)")
                },
                    label: {
                        VStack(spacing: 0){
                            HStack{
                                if updated?.id == row{
                                    let checked = UserDefaults.standard.bool(forKey: "checked\(row)")
                                    Circle()
                                        .fill(
                                            !checked
                                            ? Color.red
                                            : Color.clear
                                        )
                                        .frame(width: 6, height: 6)
                                        .offset(x:2 , y: -8)
                                }else{
                                    Circle()
                                        .fill(Color.clear)
                                        .frame(width: 6, height: 6)
                                        .offset(x:2 , y: -8)
                                }
                                Text(tabs[row])
                                    .font(.system(.headline))
                                    .foregroundColor(
                                        seletedTap == row
                                        ? .accentColor
                                        : .gray
                                        )
                                    .offset(x: -4, y: 0)
                            }
                            .frame(height: 52)
                            Rectangle()
                                .fill(
                                    seletedTap == row
                                    ? Color.secondary
                                    : Color.clear
                                )
                                .frame(height: 3)
                                .offset(x: 4, y: 0)
                        }
                })
                    .buttonStyle(PlainButtonStyle())
            }
        }
        .frame(height: 55)
    }
}

struct TapMenuView_Previews: PreviewProvider {
    static var previews: some View {
        TapMenuView(tabs: ["A", "B", "C"], seletedTap: .constant(1), updated: .constant(.currentMonth(amount: "100원")))
    }
}
