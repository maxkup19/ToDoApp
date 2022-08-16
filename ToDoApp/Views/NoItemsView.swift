//
//  NoItemsView.swift
//  ToDoApp
//
//  Created by Max Kup on 16.08.2022.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var animate: Bool = false
    private let secondaryAccentColor = Color("SecondaryAccentColor")
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("There are no items!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Are you a productive person? I think you should tap add button and create a bunch of items to your todo list!")
                    .padding(.bottom, 20)
                NavigationLink(                 destination: AddView()) {
                    Text("Add something")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? secondaryAccentColor : Color.accentColor)
                        .cornerRadius(10)
                    }
                .padding(.horizontal, animate ? 30 : 50)
                .shadow(color: animate ? secondaryAccentColor.opacity(0.7) : Color.accentColor.opacity(0.7),
                        radius: animate ? 30 : 10,
                        x: 0,
                        y: animate ? 50 : 30)
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
            }
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear {
                guard !animate else { return }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    withAnimation(
                        Animation
                            .easeInOut(duration: 2)
                            .repeatForever()
                    ) {
                        animate.toggle()
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoItemsView()
                .navigationTitle("Title")
        }
    }
}
