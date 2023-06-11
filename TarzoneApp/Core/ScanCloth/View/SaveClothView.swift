import SwiftUI
import Firebase

struct SaveClothView: View {
    @StateObject private var viewModel = SaveClothViewModel()
    @Environment(\.presentationMode) var presentationMode
    //from ScanCloth
    var clothImage: UIImage
    var catIdP : Int
    var subCatIdP : Int
    var hashtag : [String]
    //for viewmodel
    @State private var pickerCategoryIndex : Int
    @State private var pickerSubcategoryIndex : Int
    @State private var hashtagInput = ""
    init(clothImage: UIImage, catIdP: Int, subCatIdP: Int, hashtag: [String]) {
        self.clothImage = clothImage
        self.catIdP = catIdP
        self.subCatIdP = subCatIdP
        self.hashtag = hashtag
        _pickerCategoryIndex = State(initialValue: catIdP)
        _pickerSubcategoryIndex = State(initialValue: subCatIdP)
    }
    var body: some View {
        NavigationView {
            VStack {
                HStack(spacing: 1) {
                    Spacer()
                    Image(uiImage: clothImage)
                        .resizable()
                        .scaledToFit()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.screenWidth * 0.8, height: UIScreen.screenHeight * 0.3)
                    Spacer()
                }
                .frame(width: UIScreen.screenWidth , height: UIScreen.screenHeight * 0.35)
                .background(Color(UIColor(red: 0.976, green: 0.976, blue: 0.976, alpha: 1.0)))
                HStack(spacing: 0) {
                    Text("  Features")
                        .fontWeight(.light)
                        .font(Font.custom("HelveticaNeue", size: UIScreen.screenWidth * 0.04))
                        .fontWeight(.light)
                        .font(Font.custom("HelveticaNeue", size: UIScreen.screenWidth * 0.04))
                    Spacer()
                }
                HStack(spacing: 0) {
                    VStack {
                        HStack(spacing: 0) {
                            List(viewModel.tableItems, id: \.self) { item in
                                Text(item)
                                    .font(.system(size: 9))
                            }
                            .scrollDisabled(true)
                            .listStyle(PlainListStyle())
                            Divider()
                            List{
                                Menu {
                                    Picker(selection: $pickerCategoryIndex) {
                                        ForEach(0..<MockData().categories.count, id: \.self) { index in
                                            Text(MockData().categories[index].name)
                                                .tag(index)
                                                .font(Font.custom("HelveticaNeue-Light", size: 10))
                                        }
                                    } label:{}
                                        .pickerStyle(DefaultPickerStyle())
                                } label: {
                                    Text(MockData().categories[pickerCategoryIndex].name)
                                        .font(Font.custom("HelveticaNeue-Light", size: 10))
                                        .foregroundColor(.black)
                                        .frame(width: UIScreen.screenWidth * 0.4,alignment: .leading)
                                }
                                Menu {
                                    Picker(selection: $pickerSubcategoryIndex) {
                                        ForEach(0..<MockData().categories[pickerCategoryIndex].subcategories.count, id: \.self) { index in
                                            Text(  MockData().categories[pickerCategoryIndex].subcategories[index].name)
                                                .font(Font.custom("HelveticaNeue-Light", size: 10))
                                        }
                                    } label:{}
                                        .pickerStyle(DefaultPickerStyle())
                                } label: {
                                    Text(MockData().categories[pickerCategoryIndex].subcategories[pickerSubcategoryIndex].name)
                                        .font(Font.custom("HelveticaNeue-Light", size: 10))
                                        .foregroundColor(.black)
                                        .frame(width: UIScreen.screenWidth * 0.4,alignment: .leading)
                                }
                                TextField("Black, White, etc.", text: $viewModel.color)
                                    .onChange(of: viewModel.color) { newValue in
                                        if newValue.count > 20 {
                                            viewModel.color = String(newValue.prefix(20))
                                        }
                                    }
                                TextField("L, 38", text: $viewModel.size)
                                    .onChange(of: viewModel.size) { newValue in
                                        if newValue.count > 10 {
                                            viewModel.size = String(newValue.prefix(10))
                                        }
                                    }
                                TextField("https://www.storename.com...", text: $viewModel.url)
                                    .font(Font.custom("HelveticaNeue-Light", size: 10))
                                    .foregroundColor(.black)
                                    .textFieldStyle(.plain)
                                    .onChange(of: viewModel.url) { newValue in
                                        if newValue.count > 50 {
                                            viewModel.url = String(newValue.prefix(50))
                                        }
                                    }
                                HStack {
                                    ForEach(viewModel.hashtag, id: \.self) { tag in
                                        Text(tag)
                                            .padding(.horizontal, 8)
                                            .padding(.vertical, 4)
                                            .background(Color.gray)
                                            .foregroundColor(.white)
                                            .cornerRadius(10)
                                            .background(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 0.2))
                                    }
                                    TextField("Enter hashtags", text: $hashtagInput, onCommit: {
                                        if !hashtagInput.isEmpty {
                                            viewModel.hashtag.append(hashtagInput)
                                            hashtagInput = ""
                                        }
                                    })
                                    .onChange(of: hashtagInput, perform: { newValue in
                                        if hashtagInput.count > 20 {
                                            hashtagInput = String(hashtagInput.prefix(20))
                                        }
                                    })
                                }
                            }
                            .scrollDisabled(true)
                            .font(.system(size: 9))
                            .listStyle(PlainListStyle())
                        }
                    }
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color.gray, lineWidth: 0.2)
                )
                Spacer()
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("New Cloth")
                            .font(.system(size: 12))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 8)
                            .background(Color.blue.opacity(0.8))
                            .cornerRadius(8)
                    }
                    if viewModel.isShowingSaveSuccessfulMessage  == true{
                        Button(action: {
                            print("Success")
                        }) {
                            Text("Success")
                                .font(.system(size: 12))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 8)
                                .background(Color.green.opacity(0.8))
                                .cornerRadius(8)
                        }}
                    else{
                        Button(action: {
                            Task {
                                do {
                                    viewModel.catId = pickerCategoryIndex
                                    viewModel.subCatId = pickerSubcategoryIndex
                                    try await viewModel.saveCloth(uiImage: clothImage)
                                } catch {
                                    print("Error: \(error)")
                                }
                            }
                        }) {
                            Text("Save")
                                .font(.system(size: 12))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 8)
                                .background(Color.green.opacity(0.8))
                                .cornerRadius(8)
                        }
                    }
                    Button(action: {
                        viewModel.clearFields()
                    }) {
                        Text("Clear")
                            .font(.system(size: 12))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 8)
                            .background(Color.red.opacity(0.8))
                            .cornerRadius(8)
                    }
                }
                .padding(.bottom, UIScreen.screenWidth * 0.05)
            }
            .font(Font.custom("HelveticaNeue-Light", size: 12))
            .navigationBarItems(leading: backButton)
            .navigationBarBackButtonHidden(true)
            .padding(.all, UIScreen.screenWidth * 0.02)
            .onAppear {
                viewModel.hashtag = hashtag
                pickerCategoryIndex = viewModel.catId ?? catIdP
                pickerSubcategoryIndex = viewModel.subCatId ?? subCatIdP
            }
        }
        .navigationBarItems(leading: backButton)
        .navigationBarBackButtonHidden(true)
    }
    var backButton: some View {
        return AnyView(
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "chevron.left")
                    .imageScale(.medium)
                    .foregroundColor(Color(red: 153/255, green: 153/255, blue: 153/255))
            }
        )
    }
}

