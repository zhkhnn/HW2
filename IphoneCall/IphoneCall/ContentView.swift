//
//  ContentView.swift
//  IphoneCall
//
//  Created by Aruzhan Zhakhan on 31.03.2023.
//

import SwiftUI

struct ContentView: View {
    let callerName: String
    let callTime: String
    
    @State var isMuted = false
    @State var isSpeakerOn = false
    @State var isKeypadOpen = false
    @State var isFacetimeOpen = false
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(callerName)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.bottom, 5)
                        .foregroundColor(.white)
                    
                    Text(callTime)
                        .foregroundColor(.white)
                        .padding(.leading, 30)
                }
            }
//            .padding(.top, 20)
//            .padding(.bottom, 40)
//            .padding(.horizontal, 20)
            .frame(width: 300, height: 100)
            .offset(y: -20)
            .padding(.top, 90)
            VStack(spacing: 50){
                HStack(spacing: 20) {
                    Button(action: {
                        isMuted.toggle()
                    }) {
                        Image(systemName: isMuted ? "mic.slash.fill" : "mic.fill")
                        .foregroundColor(.white)
                        .frame(width: 80, height: 80)
                        .font(.largeTitle)
                        .clipShape(Circle())
                        .overlay(
                                    Circle()
                                        .stroke(Color.white, lineWidth: 2)
                                        .clipShape(Circle())
                                )
                        
                    }
                    
                    
                    Spacer()
                    
                    Button(action: {
                        isKeypadOpen.toggle()
                        
                    }) {
                        Image(systemName: "circle.grid.3x3.fill")
                            .foregroundColor(.white)
                            .frame(width: 80, height: 80)
                            .font(.largeTitle)
                            .clipShape(Circle())
                            .overlay(
                                        Circle()
                                            .stroke(Color.white, lineWidth: 2)
                                            .clipShape(Circle())
                                    )
                    }
                    
                    Spacer()
                    Button(action: {
                        isSpeakerOn.toggle()
                    }) {
                        Image(systemName: isSpeakerOn ? "speaker.wave.2.fill" : "speaker.wave.1.fill")
                            .foregroundColor(.white)
                            .frame(width: 80, height: 80)
                            .font(.largeTitle)
                            .clipShape(Circle())
                            .overlay(
                                        Circle()
                                            .stroke(Color.white, lineWidth: 2)
                                            .clipShape(Circle())
                                    )
                    }
                }
                .padding(.leading, 20)
                .padding(.trailing, 20)
                HStack(spacing: 20){
                    Button(action: {
                    }) {
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .frame(width: 80, height: 80)
                            .font(.largeTitle)
                            .clipShape(Circle())
                            .overlay(
                                        Circle()
                                            .stroke(Color.white, lineWidth: 2)
                                            .clipShape(Circle())
                                    )
                    }
                    
                    Spacer()
                    Button(action: {
                        isFacetimeOpen.toggle()
                    }) {
                        Image(systemName: "video")
                            .foregroundColor(.white)
                            .frame(width: 80, height: 80)
                            .font(.largeTitle)
                            .clipShape(Circle())
                            .overlay(
                                        Circle()
                                            .stroke(Color.white, lineWidth: 2)
                                            .clipShape(Circle())
                                    )
                    }
                    Spacer()
                    
                    Button(action: {
                    }) {
                        Image(systemName: "person.fill")
                            .foregroundColor(.white)
                            .frame(width: 80, height: 80)
                            .font(.largeTitle)
                            .clipShape(Circle())
                            .overlay(
                                        Circle()
                                            .stroke(Color.white, lineWidth: 2)
                                            .clipShape(Circle())
                                    )
                    }
                    .cornerRadius(50)
                    
                }
                .padding(.leading, 20)
                .padding(.trailing, 20)
            }
            .padding(.leading, 20)
            .padding(.trailing, 20)
            .padding(.top, 50)
            Spacer()
            
            Button(action: {
            }) {
                Image(systemName: "phone.down.circle.fill")
                    .foregroundColor(.red)
                    .background(Color.white)
                    .cornerRadius(50)
                    .font(.system(size: 80))
                    .clipShape(Circle())
//                    .frame(width: 100, height: 100, alignment: .center)
            }
            .padding(.bottom, 150)
        }
        
        .background(Color.black.opacity(0.5))
    }
        
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView(callerName: "John Doe", callTime: "10:23")
        }
    }
}
