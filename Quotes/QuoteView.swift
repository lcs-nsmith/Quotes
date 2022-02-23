//
//  QuoteView.swift
//  Quotes
//
//  Created by Nathan Smith on 2022-02-22.
//

import SwiftUI

struct QuoteView: View {
    // MARK: Stored Properties
    @State var currentQuote: Quote = Quote(quoteText: "Doot doola doot doo", quoteAuthor: "Nardwuar")
    
    // MARK: Computed Properties
    var body: some View {
        
        ZStack {
//            Color(.systemGray6)
//                .ignoresSafeArea()
            
            Color(.black)
                .ignoresSafeArea()
            
            VStack {
                
                    VStack {
                        Text(currentQuote.quoteText)
                            .multilineTextAlignment(.leading)
                            .font(.system(size: 25, weight: .medium, design: .serif))
                            .padding(.top, 30)
                            .padding(.horizontal, 30)
                        
                        Text(" - \(currentQuote.quoteAuthor)")
                            .multilineTextAlignment(.trailing)
                            .font(.system(size: 15, weight: .medium, design: .rounded))
                            .padding(.vertical, 15)
                            .padding(.horizontal,30)
                    }
                    .overlay(
                        Rectangle()
                            .stroke(Color.primary, lineWidth: 4)
                        )
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: "heart.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .foregroundColor(.gray)
                        .frame(width: 45, height: 45)
                })
                    .buttonStyle(.plain)
                    .padding(.top)
                
                
                Button(action: {
                    
                }, label: {
                    Text("Another One!")
                        .font(.title2)
                })
                    .buttonStyle(.borderedProminent)
                    .tint(.gray)
                
                List {
                    Text("He that respects himself is safe from others; he wears a coat of mail that none can pierce.")
                    Text("What you are is what you have been. What you’ll be is what you do now.")
                    Text("A smile is a light in the window of your face to show your heart is at home.")
                }
                
                Spacer()
                
            }
            // When the app opens, get a new joke from the web service
            .task {
                // Assemble the URL that points to the endpoint
                let url = URL(string: "https://api.forismatic.com/api/1.0/?method=getQuote&key=457653&format=json&lang=en")!
                
                // Define the type of data we want from the endpoint
                // Configure the request to the web site
                var request = URLRequest(url: url)
                // Ask for JSON data
                request.setValue("application/json",
                                 forHTTPHeaderField: "Accept")
                
                // Start a session to interact (talk with) the endpoint
                let urlSession = URLSession.shared
                
                // Try to fetch a new joke
                // It might not work, so we use a do-catch block
                do {
                    
                    // Get the raw data from the endpoint
                    let (data, _) = try await urlSession.data(for: request)
                    
                    // Attempt to decode the raw data into a Swift structure
                    // Takes what is in "data" and tries to put it into "currentJoke"
                    //                                 DATA TYPE TO DECODE TO
                    //                                         |
                    //                                         V
                    currentQuote = try JSONDecoder().decode(Quote.self, from: data)
                    
                } catch {
                    print("Could not retrieve or decode the JSON from endpoint.")
                    // Print the contents of the "error" constant that the do-catch block
                    // populates
                    print(error)
                }
                
            }
            .padding()
            .navigationTitle("Forismatic Quotes")
        }
    }
    
}

struct QuoteView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                QuoteView()
            }
            .preferredColorScheme(.dark)
        }
    }
}
