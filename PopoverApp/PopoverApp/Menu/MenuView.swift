//
//  MenuView.swift
//  PopoverApp
//
//  Created by 서충원 on 2022/03/13.
//

import SwiftUI

struct MenuView: View {
    @Namespace var animation
    @State var currentTab = "Uploads"
    
    var body: some View {
        VStack{
            HStack{
                TabButton(title: "Help", currentTab: $currentTab, animation: animation)
                TabButton(title: "Uploads", currentTab: $currentTab, animation: animation)
            }
            .padding(.horizontal)
            .padding(.top)
            
            Divider()
                .padding(.top,4)
            
            Image("box")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(10)
            
            HStack{
                Text("Export your artboards...")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                
                Button(action: {}, label: {
                    Image(systemName: "square.and.arrow.up")
                        .foregroundColor(.primary)
                })
            }
            
            Spacer(minLength: 15)
            
            Divider()
                .padding(.bottom,2)
            
            HStack{
                Image("pic")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 25, height: 25)
                    .clipShape(Circle())
                
                Text("SeoSieve")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                
                Spacer(minLength: 0)
                
                Button(action: {}, label: {
                    Image(systemName: "gearshape.fill")
                        .foregroundColor(.primary)
                })
                    .buttonStyle(PlainButtonStyle())
            }
            .padding(.horizontal)
            .padding(.bottom)
        }
        .frame(width: 250, height: 300)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

struct TabButton: View {
    var title: String
    @Binding var currentTab: String
    var animation: Namespace.ID
    
    var body: some View {
        Button(action: {withAnimation {
            currentTab = title
        }}, label: {
            Text(title)
                .font(.callout)
                .fontWeight(.bold)
                .foregroundColor(currentTab == title ? .white : .primary)
                .padding(.vertical,4)
                .frame(maxWidth: .infinity)
                .background(
                    ZStack{
                        if currentTab == title {
                            RoundedRectangle(cornerRadius: 4)
                                .fill(Color.blue)
                                .matchedGeometryEffect(id: "TAB", in: animation)
                        } else {
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(Color.primary, lineWidth: 0.6)
                        }
                    }
                )
                .contentShape(RoundedRectangle(cornerRadius: 4))
        })
        .buttonStyle(PlainButtonStyle())
    }
}
