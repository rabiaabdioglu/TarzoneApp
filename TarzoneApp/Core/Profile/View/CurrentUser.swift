import SwiftUI

struct CurrentUser: View {
    var user: User
    @Environment(\.presentationMode) var presentationMode
    
    @State private var isFollowersActive = false
    @State private var isFollowingActive = false
    
    var body: some View {

        NavigationStack {
            Spacer()

            VStack(spacing: UIScreen.screenHeight * 0.07) {
                ScrollView {
                    VStack(spacing: UIScreen.screenWidth * 0.1) {
                        HStack(spacing: UIScreen.screenWidth * 0.10) {
                            UserProfileView(user: user)
                                .disabled(true)
                        
                                Button(action: {
                                    // Edit butonuna tıklandığında gerçekleşecek işlemler
                                }) {
                                    Text("Edit")
                                        .padding(.horizontal, 10)
                                        .padding(.vertical, 5)
                                        .foregroundColor(.white)
                                        .background(Color.accentColor)
                                        .cornerRadius(5)
                                }
                            
                        }
                        .padding()
                        
                        HStack(spacing: UIScreen.screenHeight * 0.03) {
                            Text("\(user.followers!)\nOutfit")
                                .multilineTextAlignment(.center)
                            
                            Text("\(user.following!)\nFollowing")
                                .multilineTextAlignment(.center)
                                .onTapGesture {
                                    isFollowingActive = true
                                }
                            
                            Text("\(user.followers!)\nFollowers")
                                .multilineTextAlignment(.center)
                                .onTapGesture {
                                    isFollowersActive = true
                                }
                        }
                        
                        Spacer()
                    }
                    .overlay(
                        Divider()
                            .background(Color.gray)
                            .padding(.top, 150)
                    )
                    //değişecek
                    let userPosts = MockData().posts.filter { $0.userId == 0}

                    PostGridView(outfit: userPosts)
                    
                }
            }
            .font(Font.custom("HelveticaNeue-Light", size: 10))
            .sheet(isPresented: $isFollowersActive, content: {
                FollowerListView(user: user)
            })
            .sheet(isPresented: $isFollowingActive, content: {
                FollowerListView(user: user)
            })
            .navigationTitle("Profile")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    
                 
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button{
                                AuthService.shared.signOut()
                                
                            }label:{
                                
                                Image(systemName: "line.3.horizontal")
                                    .foregroundColor(.gray)
                                
                            }
                        }
                    }
      
        }
        
        
    }
    

}

struct CurrentUser_Previews: PreviewProvider {
    static var previews: some View {
        CurrentUser(user: MockData().users[0])
    }
}
