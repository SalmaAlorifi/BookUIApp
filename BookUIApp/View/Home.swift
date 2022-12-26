//
//  Home.swift
//  BookUIApp
//
//  Created by salma alorifi on 18/05/1444 AH.
//

import SwiftUI

struct Home: View {
    
        // mark animeation properies
        
        @State var currentBook: Book = sampleBooks.first!
        
        var body: some View {
            
            VStack{
                HeaderView()
                BookSlider()
                
                //mark deatils view
                BookDetailView()
                
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .top)
            
        }
        
        @ViewBuilder
        func BookDetailView()-> some View{
            VStack{
                GeometryReader{
                    let size = $0.size
                    
                    //mark implementing delayed slider effert
                    HStack(spacing: 0){
                        ForEach(sampleBooks){book in
                            let index = indexOf(book: book)
                            var currentIndex = indexOf(book: currentBook)
                            VStack(alignment: .leading, spacing: 18){
                                Text(book.title)
                                    .font(.largeTitle)
                                    .foregroundColor(.black.opacity(0.7))
                                    // mark sliding to the current index position with delay based on index
                                    .offset(x: CGFloat(currentIndex) * -(size.width + 30))
                                    .opacity (currentIndex == index ? 1 : 0)
                                    .animation(.interactiveSpring (response: 0.6,
                                   dampingFraction: 0.7, blendDuration:
                                   0.7).delay (currentIndex > index ? 0.1 : 0), value: currentIndex == index)

                                
                                
                                
                                
                                Text("By \(book.author)")
                                    .font(.callout)
                                    .foregroundColor(.gray)
                                    .offset(x: CGFloat(currentIndex) * -(size.width + 30))
                                    .opacity(currentIndex == index ? 1 : 0)
                            }
                            .frame(width: size.width + 30, alignment: .leading)
                        }
                    }
        
                }
                .padding(.horizontal,15)
                .frame(height: 100)
                .padding(.bottom,10)
                
                
                ZStack(alignment: .leading){
                    Capsule()
                        .fill(.gray.opacity(0.4))
                    
                    GeometryReader{
                        let size = $0.size
                        // mark updating progress when ever current book is updated
                        Capsule()
                            .fill(Color("Color 1"))
                            .frame(width: CGFloat(indexOf(book: currentBook)) / CGFloat(sampleBooks.count - 1) * size.width)
                        
               .animation(.interactiveSpring(response: 0.6 ,dampingFraction: 0.75 ,blendDuration: 0.75), value: currentBook)
                    }
            
                }
                .frame(height: 4)
                .padding(.top,10)
                .padding([.horizontal, .bottom],15)
                
                
            }
            
        }
        
        
        // Mark index
        func indexOf(book: Book)->Int{
            
            if let index = sampleBooks.firstIndex(of: book){
                return index
            }
            return 0
        }
        
        
        // Mark book slider
        @ViewBuilder
        func BookSlider()->some View{
            
            TabView(selection: $currentBook){
                ForEach(sampleBooks){book in
                    BookView(book: book)
                        .tag(book)
                    
                }
        
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .background{
                Image("BG")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
            }
            

        }
        
        //Mark book view
        @ViewBuilder
        func BookView(book: Book)->some View{
            GeometryReader{
                let size = $0.size
                
                ZStack{
                    //mark book like view
                    // with the help of isometric view
                    //
                    
                    Image(book.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: size.width / 1.2, height: size.height / 1.5)
                        .clipped()

                }
                .frame(maxWidth: .infinity,maxHeight: .infinity)
                
                
            }.padding(.horizontal,50)
             

        }
        
        // Mark header view
        @ViewBuilder
        func HeaderView()->some View{
            HStack(spacing :15){
                Text("BookRead")
                    .font(.title2)
                    .fontWeight(.medium)
                    .foregroundColor(.black.opacity(0.7))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                
                
                Button {
                }label: {
                    Image(systemName:"books.vertical")
                        .font(.title3)
                    .foregroundColor(.gray) }
                
                Button{
                } label:{
                    Image(systemName: "book.closed")
                        .font(.title3)
                    .foregroundColor(.gray)  }
                
                
                
            }.padding(15)
        }
    }


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
