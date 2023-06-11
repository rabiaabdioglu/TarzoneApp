import SwiftUI
import FirebaseAuth
import MessageUI

struct ChoosenPostView: View {
    @State var chosenOutfitPost: OutfitPost
    var ownerUser: User
    @ObservedObject var viewModel: TimeLineViewModel
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView{
            VStack(spacing: UIScreen.screenWidth * 0.1) {
                VStack {
                    OutfitView(outfit: chosenOutfitPost.outfit, isClickable : true)
                        .scaledToFit()
                        .scaleEffect(1)
                        .padding(0)
                }
                .frame(width: UIScreen.main.bounds.size.width / 1.1, height: UIScreen.main.bounds.size.width / 1)
                .padding(5)
                .background(.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color(hex: "#DEDEDE"), lineWidth: 0.05)
                        .shadow(color: Color(hex: "#DEDEDE").opacity(0.5), radius: 8, x: 0, y: 0)
                )
                VStack {
                    HStack {
                        Text("Description :     ")
                        Text(chosenOutfitPost.description)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.trailing, UIScreen.screenWidth * 0.2)
                    HStack {
                        Text("Season      :     ")
                        Text(seasonToString(chosenOutfitPost.season!))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.trailing, UIScreen.screenWidth * 0.2)
                    HStack {
                        Text(chosenOutfitPost.description)
                        Spacer()
                    }
                    .alignmentGuide(.leading) { _ in UIScreen.main.bounds.size.width * 0.1 }
                }
                .padding(.leading, UIScreen.screenWidth * 0.1)
                HStack {
                    UserProfileView(user: ownerUser)
                        .padding(.trailing, UIScreen.screenWidth * 0.1)
                    Spacer()
                    Text("\(viewModel.outfitPost?.likes ?? 0)")
                    Button(action: {
                        if let outfitPost = viewModel.outfitPost, outfitPost.isLiked == true && outfitPost.likes > 0 {
                            viewModel.cancelInspireOutfit()
                        } else {
                            viewModel.inspireOutfit()
                        }
                    }) {
                        Image(viewModel.outfitPost?.isLiked == true ? "starFill" : "star")
                            .resizable()
                            .frame(width: UIScreen.screenWidth * 0.05, height: UIScreen.screenWidth * 0.05)
                            .padding(.trailing, UIScreen.screenWidth * 0.1)
                    }
                }
                .padding(.leading, UIScreen.screenWidth * 0.1)
                .overlay(
                    Divider()
                        .background(Color.gray)
                        .padding(.bottom, UIScreen.screenWidth * 0.2)
                )
            }
            .font(Font.custom("HelveticaNeue-Light", size: UIScreen.screenWidth * 0.025))
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: backButton, trailing: Group {
                if chosenOutfitPost.userId == Auth.auth().currentUser?.uid {
                    Button(action: {
                        viewModel.deleteOutfitPost(outfitPost: chosenOutfitPost)
                        viewModel.outfitPost = nil
                        viewModel.ownerUser = nil
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "trash")
                            .foregroundColor(.red)
                            .imageScale(.medium)
                    }
                } else {
                    if viewModel.isReportButtonEnable {
                        exclamationButton
                    }
                    else{
                        Text("Reported successfully.")
                            .font(Font.custom("HelveticaNeue", size: UIScreen.screenWidth * 0.02))
                            .padding(0.1)
                            .foregroundColor(.gray)
                    }
                }
            } )
            Spacer()
        }
    }
    var backButton: some View {
        Button(action: {
            viewModel.outfitPost = nil
            viewModel.ownerUser = nil
            viewModel.isReportButtonEnable = true
            presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.left")
                .imageScale(.large)
                .foregroundColor(Color(red: 153/255, green: 153/255, blue: 153/255))
        }
    }
    var exclamationButton: some View {
        Button(action: {
            Task {
                do {
                    try await viewModel.reportOutfit(outfitPost: chosenOutfitPost)
                } catch {
                    print("Error cancelling inspire outfit: \(error)")
                }
            }
        }) {
            Image(systemName: "exclamationmark.circle.fill")
                .imageScale(.large)
                .foregroundColor(Color(red: 153/255, green: 153/255, blue: 153/255))
        }
    }
}
