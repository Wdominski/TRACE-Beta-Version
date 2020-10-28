//
//  EditView.swift
//  TRACE
//
//  Created by stonecodecs on 10/27/20.
//

import SwiftUI

struct EditView : View {
    

    @Binding var editMode: Bool
    @State var index = 0

    var body : some View {
        ZStack {
            Color(rgb: [0, 0, 0], alpha: 0.3)
                .ignoresSafeArea(.all)
            
            // Vertical structure
            VStack {
                Text("Tap the Circle to edit\nSwipe up to delete.")
                    .font(Font.custom("Comfortaa-Regular", size: 18))
                    .foregroundColor(Color(rgb: WHITE))
                    .multilineTextAlignment(.center)
                    .offset(y: 30)
                
                // Events List
                TabView(selection: self.$index) {
                        ForEach(0...50, id: \.self) {index in
                            CircleView(index: self.index)
                                .padding(.horizontal, 5)
                                .scaleEffect(self.index == index ? 1.0 : 0.3)
                                .tag(index)
                                .offset(y: 10)
                        }
                }
                .tabViewStyle(PageTabViewStyle())
                //.offset(y: -70)
                .animation(.easeOut)
                .frame(height: UIScreen.main.bounds.height - 240)
            
                
                // Exit Edit Mode
                Button(action: {
                        withAnimation{self.editMode.toggle() }}) {
                    ZStack {
                        Circle()
                            .strokeBorder(Color(rgb: WHITE), lineWidth: 3)
                            .background(Circle().foregroundColor(Color(rgb: RED)))
                            .frame(width: UIScreen.main.bounds.width / 4, height: UIScreen.main.bounds.width / 4)
                        Image("close_icon")
                            .foregroundColor(Color(rgb: DARK_GREY, alpha: 0.9))
                            .scaleEffect(1.8)
                    }
                }
            } // End of VStack
        } // End of ZStack
    }
}

struct CircleView : View {
    let index: Int
    
    init(index: Int) {
        self.index = index
        UIScrollView.appearance().bounces = false
    }
    
    var body : some View {
        VStack {
            // Circle Subject Matter
            
            Button(action: {print("\(index)")}) {
                ZStack {
                    Circle()
                        .foregroundColor(index % 2 == 0 ? Color(rgb: ORANGE) : Color(rgb: RED))
                        .frame(width: UIScreen.main.bounds.width / 1.4, height: UIScreen.main.bounds.width / 1.4)
                        .shadow(color: index % 2 == 0 ? Color(rgb: ORANGE) : Color(rgb: RED), radius: 6)
                    Text("CS 506")
                        .font(Font.custom("Comfortaa-Light", size: 40))
                        .padding()
                        .foregroundColor(Color(rgb: DARK_GREY))
                        .frame(width: UIScreen.main.bounds.size.width - 145, height: UIScreen.main.bounds.size.width - 160, alignment: .center)
                        .multilineTextAlignment(.center)
                        .fixedSize()
                        //.offset(y: 5)
                }
            }
            .padding(.bottom, 70)
            
            
            // Event Date & Time
            ZStack {
                RoundedRectangle(cornerRadius: 15.0)
                    .foregroundColor(index % 2 == 0 ? Color(rgb: ORANGE) : Color(rgb: RED))
                    .frame(width: UIScreen.main.bounds.size.width * 0.70, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .shadow(color: index % 2 == 0 ? Color(rgb: ORANGE) : Color(rgb: RED), radius: 3)
                Text("10/30/31\n8:20pm-10:05pm")
                    .font(Font.custom("Comfortaa-Light", size: 24))
                    .foregroundColor(Color(rgb: DARK_GREY, alpha: 0.9))
                    .multilineTextAlignment(.center)
                    //.offset(y: 5)
            }
            
        }
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
