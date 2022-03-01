//
//  ContentView.swift
//  FurryFriends
//
//  Created by Russell Gordon on 2022-02-26.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: Stored properties
    
    
    @State var currentDogAddedToSaved: Bool = false
    // Address for main image
    // Starts as a transparent pixel – until an address for an animal's image is set
    @State var currentDog = URL(string: "https://images.dog.ceo/breeds/labrador/lab_young.JPG")!
    
    // MARK: Computed properties
    var body: some View {
        
        VStack {
            
            // Shows the main image
            RemoteImageView(fromURL: currentDog)
                .padding()
            
            
            //            Button(action: {} ,label: {
            //                Text("next dog")
            //                })
            //            buttonStyle(.bordered)
            
            
            
            // Load in the required favourites Icon
            // Hstack, to prepare for two images:
            // One that will turn red and on that
            // Stays the same throughout
            HStack{
                Image(systemName: "heart.text.square.fill")
                    .font(.largeTitle)
            }
            
            
            //            .multilineTextAlignment(.leading)
            Text("Saved")
                .font(.title)
            
            Text("List of dogs to be filled")
                .font(.caption)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.primary, lineWidth: 4)
                )
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
            currentDog = URL(string: remoteDogImage)!
            
            
            
        }
        .navigationTitle("Furry Friends")
    }
    
    // MARK: Functions
    func loadNewDog() async {
        let url = URL(string: "")!
        
        var request = URLRequest(url: url)
        // Request the JSON data
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
                                            
            currentDog = try JSONDecoder().decode(.self, from: data)
            
            // Reset the flag that tracks whether the current joke
            // is a favourite
            currentDogAddedToSaved = false
            
        } catch {
            print("Could not retrieve or decode the JSON from endpoint.")
            // Print the contents of the "error" constant that the do-catch block
            // populates
            print(error)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
    }
}
