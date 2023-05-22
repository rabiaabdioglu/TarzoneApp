import SwiftUI

struct ProfileView: View {
    var user: User
    @Environment(\.presentationMode) var presentationMode
    
    @State private var isFollowersActive = false
    @State private var isFollowingActive = false
    
    var body: some View {

        NavigationStack {
            Spacer()

            VStack(spacing: 1) {
                ScrollView {
                    VStack(spacing: 20) {
                        HStack(spacing: UIScreen.screenWidth * 0.10) {
                            UserProfileView(user: user)
                                .disabled(true)
                            
                            
                            Button(action: {
                                // Takip et butonuna tıklandığında gerçekleşecek işlemler
                            }) {
                                Text(user.hasFollowed! ? "Unfollow" : "Follow")
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 5)
                                    .foregroundColor(.white)
                                    .background(user.hasFollowed! ? Color(red: 0.718, green: 0.467, blue: 0.369)  : Color.green)
                                    .cornerRadius(5)
                            }
                            
                        }
                        .padding()
                        
                        HStack{
                            Text(user.description ?? " ")
                        }
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
                        
                        Divider()

                    }
                
                    
                    if user.privacy! {
                        VStack {
                            Image("privacy")
                                .frame(width: 100, height: 100)
                            Text("Kullanıcının kombinleri gizli")
                        }
                    } else {
                        let userPosts = MockData().posts.filter { $0.userId == 1}

                        PostGridView(outfit: userPosts)
                    }
                }
            }
            .font(Font.custom("HelveticaNeue-Light", size: 10))
            .navigationBarItems(leading: backButton)
            .sheet(isPresented: $isFollowersActive, content: {
                FollowerListView(user: user)
            })
            .sheet(isPresented: $isFollowingActive, content: {
                FollowerListView(user: user)
            })
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
         
      
        }
        
        
    }
    
    var backButton: some View {
        
            return AnyView(
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .imageScale(.large)
                        .foregroundColor(Color(red: 153/255, green: 153/255, blue: 153/255))
                }
            )
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: MockData().users[1])
    }
}
