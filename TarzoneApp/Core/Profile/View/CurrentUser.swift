import SwiftUI

struct CurrentUser: View {
    var user: User
    @Environment(\.presentationMode) var presentationMode
    @State private var isFollowersActive = false
    @State private var isFollowingActive = false
    @State private var editProfile = false
    @State private var isMenuOpen = false
    @State private var showMenu = false
    @State private var isPrivate = false
    @StateObject private var viewModel = TimeLineViewModel()
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
                            Button(action: {
                                editProfile.toggle()
                            }) {
                                Text("Edit")
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 5)
                                    .foregroundColor(.white)
                                    .background(Color.accentColor)
                                    .cornerRadius(5)
                            }
                            .sheet(isPresented: $editProfile) {
                                EditProfileView(user: user)
                            }
                        }
                        .padding()
                        HStack {
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
                        Spacer()
                        Divider()
                    }
                    Group {
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
            .sheet(isPresented: $isFollowersActive, content: {
                FollowerListView(user: user, pageName: "Follower")
            })
            .sheet(isPresented: $isFollowingActive, content: {
                FollowerListView(user: user, pageName: "Following")
            })
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        showMenu = true
                    }) {
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(.gray)
                    }
                }
            }
            .onAppear() {
                viewModel.userIdForProfileViews = user.id
                followViewModel.follows(userId: user.id)
                followViewModel.followers(userId: user.id)
                followViewModel.followState(userId: user.id)
                viewModel.isPrivateProfile = user.privacy
            }
        }
        .sheet(isPresented: $showMenu) {
            menuContent(viewModel: viewModel, isPrivate: $isPrivate)
                .frame(height: UIScreen.main.bounds.height * 0.1)
                .background(Color.white)
                .cornerRadius(10)
                .padding()
                .presentationDetents([.fraction(0.2), .medium])
                .presentationDragIndicator(.visible)
        }
    }
    struct menuContent: View {
        @ObservedObject var viewModel: TimeLineViewModel
        @Binding var isPrivate: Bool
        var body: some View {
            VStack {
                Button(action: {
                    AuthService.shared.signOut()
                }) {
                    Label("Log Out", systemImage: "power")
                        .font(Font.custom("HelveticaNeue", size: UIScreen.screenWidth * 0.03))
                        .padding(0.1)
                }
                .padding(.vertical, 10)
                Divider()
                Button(action: {
                    isPrivate.toggle()
                    viewModel.isPrivateProfile?.toggle()
                    viewModel.updatePrivacy()
                }) {
                    VStack{
                        HStack{
                            Image(systemName: privacyIcon)
                                .font(Font.custom("HelveticaNeue", size: UIScreen.screenWidth * 0.03))
                                .padding(0.1)
                            Text(isPrivate ? "Turn Off Privacy" : "Turn On Privacy")
                                .font(Font.custom("HelveticaNeue", size: UIScreen.screenWidth * 0.03))
                                .padding(0.1)
                        }
                        Text("When your profile is set to private, none of your followers or anyone else can see your outfit posts.")
                            .font(Font.custom("HelveticaNeue", size: UIScreen.screenWidth * 0.03))
                            .padding(0.1)
                            .fontWeight(.thin)
                            .lineLimit(2)
                    }
                }
                .padding(.vertical, 10)
            }
        }
        var privacyIcon: String {
            return isPrivate ? "shield.fill" : "shield"
        }
        var privacyColor: Color {
            return isPrivate ? .green : .red
        }
    }
}
