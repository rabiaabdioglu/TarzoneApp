
import Foundation
import SwiftUI
import PhotosUI
import Kingfisher


struct EditProfileView: View {
    var pageName = "Edit Profile"
    @Environment(\.dismiss) var dismiss
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedImage : PhotosPickerItem?
    @StateObject var viewModel : EditProfileViewModel
    init(user: User){
        self._viewModel = StateObject(wrappedValue: EditProfileViewModel(user: user))
    }
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Divider()
                PhotosPicker(selection: $viewModel.selectedImage)
                {
                    VStack{
                        if let image = viewModel.profileImage{
                            KFImage(URL(string: image))
                                .resizable()
                                .cornerRadius(100)
                                .frame(width: UIScreen.screenWidth * 0.13, height: UIScreen.screenWidth * 0.13, alignment: .center)
                                .padding(.leading, 5)
                        }
                        else{
                            Image(systemName: "person")
                                .resizable()
                                .cornerRadius(100)
                                .frame(width: UIScreen.screenWidth * 0.13, height: UIScreen.screenWidth * 0.13, alignment: .center)
                                .padding(.leading, 5)
                        }
                        Text("Edit profile picture")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        Divider()
                    }
                }
                .padding(.vertical , 8 )
                VStack{
                    EditProfileRowView(title: "Name",placeholder: "Enter your name", text: $viewModel.fullname)
                    EditProfileRowView(title: "Bio",placeholder: "Enter your bio", text: $viewModel.bio)
                }
                Spacer()
            }
            .font(Font.custom("HelveticaNeue-Light", size: 15))
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarTitle(pageName , displayMode: .inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(    leading: backButton,
                                    trailing: saveButton
                .foregroundColor(.green))
            Spacer()
        }
    }
    var backButton: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.left")
                .imageScale(.large)
                .foregroundColor(Color(red: 153/255, green: 153/255, blue: 153/255))
        }
    }
    var saveButton: some View {
        Button(action: {
            Task{try await viewModel.updateUserData()}
            presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "checkmark")
                .foregroundColor(.green)
        }
    }
}

struct EditProfileRowView: View{
    let title :String
    let placeholder:String
    @Binding var text : String
    var body: some View{
        HStack{
            Text(title)
                .padding(.leading, 8 )
                .frame(width: 100, alignment: .leading )
            VStack{
                TextField(placeholder, text: $text)
                Divider()
            }
        }
        .font(.subheadline)
        .frame(height: 36)
    }
}
