//
//  BooK.swift
//  BookUIApp
//
//  Created by salma alorifi on 18/05/1444 AH.
//

import Foundation


struct Book: Identifiable, Hashable{
    var id: String = UUID().uuidString
    var title: String
    var imageName: String
    var author: String
    
}
var sampleBooks: [Book] = [
    .init(title: "They Both Die At The End ", imageName: "Book1", author: "Adam Silvera"),
    .init(title: "1984", imageName: "Book2", author:"George Orwell"),
    .init(title:"Thorn", imageName: "Book3", author: "Intisar Khananl"),
    .init(title: "The House Of Mountatho", imageName: "Book4", author: "Nigel MeDowell"),
    .init(title: "The Book Of Living Secerts", imageName: "Book5", author: "Madeleine Roux"),
 ]
