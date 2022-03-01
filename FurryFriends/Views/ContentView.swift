//
//  ContentView.swift
//  FurryFriends
//
//  Created by Russell Gordon on 2022-02-26.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: Stored properties
    
    // Address for main image
    // Starts as a transparent pixel – until an address for an animal's image is set
    @State var currentImage = URL(string: "https://www.russellgordon.ca/lcs/miscellaneous/transparent-pixel.png")!
    
    // MARK: Computed properties
    var body: some View {
        
        VStack {
            
            // Shows the main image
            RemoteImageView(fromURL: currentImage)
                .padding()
           
            
            Button(action: {
                
            },label: {
                Text("next dog")
                })
            buttonStyle(.bordered)
            
            
            
            // Load in the required favourites Icon
            // Hstack, to prepare for two images:
            // One that will turn red and on that
            // Stays the same throughout
            HStack{
                Image(systemName: "heart.text.square.fill")
                    .font(.largeTitle)
            }
            
        
            
            Text("Saved")
                .font(.title)
            Text("List of dogs to be filled")
                .font(.caption)
            
            // Push main grouping
            Spacer()
        }
        
        
        
        
        // Runs once when the app is opened
        .task {
            
            
            // Example images for each type of pet
            //            let remoteCatImage = "https://purr.objects-us-east-1.dream.io/i/JJiYI.jpg"
            
            //MARK: Load Dog image
            
            let remoteDogImage = "https://images.dog.ceo/breeds/labrador/lab_young.JPG"
            
            // Replaces the transparent pixel image with an actual image of an animal
            // Adjust according to your preference ☺️
            currentImage = URL(string: remoteDogImage)!
            
            
            
        }
        .navigationTitle("Furry Friends")
    }
    
    // MARK: Functions
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
    }
}
