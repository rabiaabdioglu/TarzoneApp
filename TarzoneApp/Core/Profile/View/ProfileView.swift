import SwiftUI

struct ProfileView: View {
    var user: User
    @Environment(\.presentationMode) var presentationMode
    @State private var isFollowersActive = false
    @State private var isFollowingActive = false
    @StateObject private var viewModel =  TimeLineViewModel()
    @StateObject private var followViewModel =  FollowViewModel()
    var body: some View {
        NavigationStack {
            Spacer()
            VStack(spacing: 1) {
                ScrollView {
                    VStack(spacing: 20) {
                        HStack(spacing: UIScreen.screenWidth * 0.10) {
                            UserProfileView(user: user)
                                .disabled(true)
                            FollowButton(user: user, followCheck: $followViewModel.followCheck, followingCount: $followViewModel.following, followersCount: $followViewModel.followers)
                        }
                        .padding()
                        HStack{
                            Text(user.description ?? " ")
                        }
                        HStack(spacing: UIScreen.screenHeight * 0.03) {
                            Text("\(followViewModel.formatNumber(viewModel.profileOutfit.count))\nOutfit")
                                .multilineTextAlignment(.center)
                            Text("\(followViewModel.formatNumber(followViewModel.following))\nFollowing")
                                .multilineTextAlignment(.center)
                                .onTapGesture {
                                    isFollowingActive = true
                                }
                            Text("\(followViewModel.formatNumber(followViewModel.followers))\nFollowers")
                                .multilineTextAlignment(.center)
                                .onTapGesture {
                                    isFollowersActive = true
                                }
                        }
                        Divider()
                    }
                    if user.privacy == true {
                        VStack {
                            Image("privacy")
                                .frame(width: 100, height: 100)
                            Text("This profile is private")
                                .font(Font.custom("HelveticaNeue", size: UIScreen.screenWidth * 0.03))
                                .padding(0.1)
                                .fontWeight(.thin)
                        }
                    } else {
                        ScrollView {
                            HStack {
                                Spacer()
                                Text("Outfits")
                                    .font(Font.custom("HelveticaNeue", size: UIScreen.screenWidth * 0.03))
                                    .padding(0.1)
                                    .foregroundColor(.black)
                                Spacer()
                                Button(action: {
                                    Task {
                                        do {
                                            try await viewModel.fetchProfileOutfit()
                                        } catch {
                                            print("Error fetching outfit post: \(error)")
                                        }
                                    }
                                }) {
                                    Image(systemName: "arrow.clockwise")
                                        .padding(.trailing, 20)
                                }
                            }
                            PostGridView(viewModel: viewModel, viewType: "ProfileView")
                        }
                    }
                }
            }
            .font(Font.custom("HelveticaNeue-Light", size: 10))
            .navigationBarItems(leading: backButton)
            .sheet(isPresented: $isFollowersActive, content: {
                FollowerListView(user: user, pageName: "Follower")
            })
            .sheet(isPresented: $isFollowingActive, content: {
                FollowerListView(user: user, pageName: "Following")
            })
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear(){
                viewModel.userIdForProfileViews = user.id
                followViewModel.follows(userId: user.id)
                followViewModel.followers(userId: user.id)
                followViewModel.followState(userId: user.id)
            }
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
