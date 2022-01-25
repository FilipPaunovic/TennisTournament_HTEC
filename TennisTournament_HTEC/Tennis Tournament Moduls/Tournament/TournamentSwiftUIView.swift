//
//  TournamentSwiftUIView.swift
//  TennisTournament_HTEC
//
//  Created by Filip Paunovic on 25.1.22..
//

import SwiftUI

struct TournamentSwiftUIView: View {
    let vm: TournamentVM
    
    init(vm: TournamentVM) {
        self.vm = vm
    }
    
    var body: some View {
        ZStack {
            Color.backgroundColor
                .edgesIgnoringSafeArea(.all)
                
            VStack(spacing: 80) {
                Label("Select Tournament", systemImage: ".fill")
                    .frame(width: 190, height: 30, alignment: .center)
                    .foregroundColor(Color.white)
                Divider()
                Button("Tournament ID 822344") {
                    vm.goToPlayersPage()
                }
                    .font(Font.system(size: 25))
                    .frame(width: 300, height: 30, alignment: .top)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 15)
                    .foregroundColor(Color.pink)
                    .background(Color.black)
                    .cornerRadius(17.0)
                    .overlay(
                    RoundedRectangle(cornerRadius: 17).stroke(Color.pink, lineWidth: 1)
                   )
        }
          
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height-50, alignment: .top)
            
            .background(Color.clear)
        }
  
    }
    
}

struct TournamentSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = TournamentVM()
        TournamentSwiftUIView(vm: vm)
    }
}
