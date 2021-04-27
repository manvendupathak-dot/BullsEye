//
//  ContentView.swift
//  BullsEye
//
//  Created by Manvendu Pathak on 27/04/21.
//

import SwiftUI

struct ContentView: View {
    
//MARK: - PROPERTIES
    var value = Int.random(in: 0...100)
    @State var sliderValue:Double = 50.0
    @State var showingAlert = false
    @State var expand = false
    var diff: Int {
        Int(abs(sliderValue - Double(value)))
    }
    
    func computeScore() -> Int {
        let points: Int
        if diff == 0 {
             points = 200
        }else if diff == 1{
            points = 150
        }else{
            points = 100 - diff
        }
       return points
    }
    
    
//MARK:- BODY
    var body: some View {
          
        ZStack {
            VStack {
                HStack {
                    Circle()
                        .fill(Color.red)
                        .frame(width: expand ? 100 : 50, height: expand ? 300 : 150)
                        .offset(x: expand ? -100 : 0 )
                        .animation(.default)
                        .onTapGesture {
                            self.expand.toggle()
                    }
                    Circle()
                        .fill(Color.red)
                        .frame(width: expand ? 100 : 50, height: expand ? 300 : 150)
                        .offset(x: expand ? 100 : 0 )
                        .animation(.default)
                        .onTapGesture {
                            self.expand.toggle()
                }
                }//HSTACK
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
               
                Text("MAKE A BULLSEYE IN THE SLIDER OF-> ")
                    .bold()
                    .frame(width: 290, height: 100, alignment: .center)
                    .font(.system(size: 15.0))
                
                Text("\(value)")
                    .bold()
                    .underline(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, color: /*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                    .font(.largeTitle)
                HStack{
                    Text("0").foregroundColor(.red).bold()
                    Slider(value: $sliderValue  ,in: 0...100)
                        .background(Color.red)
                        .cornerRadius(5)
                        .accentColor(.white)
                        .opacity(0.9)
                    Text("100").foregroundColor(.red).bold()
                }//HSTACK
                .frame(width: 410, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding()
                
                Button(action:  {
                    self.showingAlert.toggle()
                }) {
                        Text("HIT ME!")
                            .padding()
                            .font(.largeTitle)
                            .background(Color.red)
                            .foregroundColor(.white)
                            .border(Color.black, width: 10)
                            .cornerRadius(10)
                            .alert(isPresented: self.$showingAlert, content: {
                                Alert(title: Text("Your Score is "), message: Text(String(computeScore())))
                            }
                    )}
                
            }//VSTACK
            .frame(width: 415, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }//ZSTACK
       
         
        
        
        
              
    }

//MARK:- PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDisplayName("iPhone 11")
            .previewDevice("iPhone 11")
    }
    
}
}

