import SwiftUI

struct ProfileView: View {
    var user: User
    @Environment(\.presentationMode) var presentationMode
    
    @State private var isFollowersActive = false
    @State private var isFollowingActive = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: UIScreen.screenHeight * 0.07) {
                ScrollView {
                    VStack(spacing: UIScreen.screenWidth * 0.1) {
                        HStack(spacing: UIScreen.screenWidth * 0.10) {
                            UserProfileView(user: user)
                                .disabled(true)
                            
                            if !user.isMe {
                                Button(action: {
                                    // Takip et butonuna tıklandığında gerçekleşecek işlemler
                                }) {
                                    Text(user.hasFollowed ? "Unfollow" : "Follow")
                                        .padding(.horizontal, 10)
                                        .padding(.vertical, 5)
                                        .foregroundColor(.white)
                                        .background(user.hasFollowed ? Color(red: 0.718, green: 0.467, blue: 0.369)  : Color.green)
                                        .cornerRadius(5)
                                }
                            } else {
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
                        }
                        .padding()
                        
                        HStack(spacing: UIScreen.screenHeight * 0.03) {
                            Text("\(user.followers)\nCombine")
                                .multilineTextAlignment(.center)
                            
                            Text("\(user.following)\nFollowing")
                                .multilineTextAlignment(.center)
                                .onTapGesture {
                                    isFollowingActive = true
                                }
                            
                            Text("\(user.followers)\nFollowers")
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
                    
                    if user.privacy && !user.isMe {
                        VStack {
                            Image("privacy")
                                .frame(width: 100, height: 100)
                            Text("Kullanıcının kombinleri gizli")
                        }
                    } else {
                        PostGridView(combine: MockData().posts)
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
        }
    }
    
    var backButton: some View {
        if user.isMe {
            return AnyView(EmptyView()) // Kullanıcı uygulamayı kullanan kişi ise boş bir view döndür
        } else {
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
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: MockData().users[1])
    }
}
