import SwiftUI
import Firebase

struct CreateOutfitView: View {
    @State private var selectedSeason: Seasons = .Spring_Summer
    @State private var descriptionText = ""
    @State private var selectedItem: String = "Üst"
    @State private var subItems: [String] = []
    @State private var isSubcategoryListOpen = true // Added state variable for subcategory list
    @State private var outfitCloths : Outfit = Outfit(id: "", top: "", bottom: "", fullbody: "", shoe: "", bag: "", outwear: "", accessory: "", userId: Auth.auth().currentUser!.uid)
    @ObservedObject var viewModel: CreateOutfitViewModel
    private var userId = Auth.auth().currentUser?.uid
    @Environment(\.presentationMode) var presentationMode
    init(viewModel: CreateOutfitViewModel) {
        self.viewModel = viewModel
    }
    var body: some View {
        VStack {
            //Outfit Images
            VStack(spacing: 1) {
                if !viewModel.outfitImages.isEmpty {
                    HStack {
                        Spacer()
                        VStack {
                            //outwear
                            viewModel.outfitImages[4]
                                .resizable()
                                .frame(width: UIScreen.screenWidth * 0.25)
                                .scaleEffect(0.7)
                                .onTapGesture {
                                    viewModel.outfitImages[4] = Image("empty")
                                    outfitCloths.outwear = ""
                                }
                        }
                        if   viewModel.outfitImages[3] == Image("empty")
                        {
                            VStack {
                                //top
                                viewModel.outfitImages[6]
                                    .resizable()
                                    .frame(width: UIScreen.screenWidth * 0.2, height:UIScreen.screenHeight * 0.15)
                                    .scaleEffect(0.9)
                                    .onTapGesture {
                                        viewModel.outfitImages[6] = Image("empty")
                                        outfitCloths.top = ""
                                    }
                                //bottom
                                viewModel.outfitImages[2]
                                    .resizable()
                                    .frame(width: UIScreen.screenWidth * 0.2, height:UIScreen.screenHeight * 0.15)
                                    .scaleEffect(0.9)
                                    .onTapGesture {
                                        viewModel.outfitImages[2] = Image("empty")
                                        outfitCloths.bottom = ""
                                    }
                            }
                        }
                        else {
                            VStack {
                                //fullbody
                                viewModel.outfitImages[3]
                                    .resizable()
                                    .frame(width: UIScreen.screenWidth * 0.2, height:UIScreen.screenHeight * 0.30)
                                    .scaleEffect(0.8)
                                    .onTapGesture {
                                        viewModel.outfitImages[3] = Image("empty")
                                        outfitCloths.bottom = ""
                                    }
                            }
                        }
                        VStack {
                            //accessory
                            viewModel.outfitImages[0]
                                .resizable()
                                .frame(width: UIScreen.screenWidth * 0.2, height:UIScreen.screenHeight * 0.10)
                                .scaleEffect(0.8)
                                .onTapGesture {
                                    viewModel.outfitImages[0] = Image("empty")
                                    outfitCloths.accessory = ""
                                }
                            //bag
                            viewModel.outfitImages[1]
                                .resizable()
                                .frame(width: UIScreen.screenWidth * 0.2, height:UIScreen.screenHeight * 0.10)
                                .scaleEffect(0.8)
                                .onTapGesture {
                                    viewModel.outfitImages[1] = Image("empty")
                                    outfitCloths.bag = ""
                                }
                            //shoe
                            viewModel.outfitImages[5]
                                .resizable()
                                .frame(width: UIScreen.screenWidth * 0.2, height:UIScreen.screenHeight * 0.10)
                                .scaleEffect(0.8)
                                .onTapGesture {
                                    viewModel.outfitImages[5] = Image("empty")
                                    outfitCloths.bottom = ""
                                    outfitCloths.shoe = ""
                                }
                        }
                        Spacer()
                    }
                    .padding(20)
                    .frame(width: nil , height:UIScreen.screenHeight * 0.30)
                }
                else{
                    Text("Choose a cloth for create outfit.")
                }
            }
            .frame(width: UIScreen.screenWidth ,height: UIScreen.screenHeight * 0.35)
            .background(.white)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 0.5)
                    .shadow(color: Color.gray.opacity(0.4), radius: 4, x: 0, y: 2)
            )
            Spacer()
            // Outfit features options
            HStack {
                Picker(selection: $selectedSeason, label: Text("")) {
                    Text("Spring/Summer").tag(Seasons.Spring_Summer)
                    Text("Fall/Winter").tag(Seasons.Fall_Winter)
                    Text("Resort").tag(Seasons.Resort)
                    Text("Pre-Fall").tag(Seasons.Pre_Fall)
                }
                .pickerStyle(SegmentedPickerStyle())
                .frame(width: UIScreen.screenWidth)
                .clipped()
                .scaleEffect(0.8)
                .font(Font.custom("HelveticaNeue-Light", size: 10))
            }
            HStack {
                Text("Description     :    ")
                    .font(Font.custom("HelveticaNeue-Light", size: 10))
                    .foregroundColor(.black)
                TextField("..... ", text: $descriptionText)
                    .frame(maxWidth: .infinity)
                    .font(Font.custom("HelveticaNeue-Light", size: 10))
                    .multilineTextAlignment(.leading)
                    .lineLimit(1)
                    .foregroundColor(.black)
                    .onChange(of: descriptionText) { newValue in
                        if newValue.count > 40 {
                            descriptionText = String(newValue.prefix(40))
                        }}
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.trailing, UIScreen.screenWidth * 0.1)
            //CLOTHING SELECTION AREA
            Spacer()
            HStack (spacing: 0){
                //Categories  selection table
                HStack(spacing: 0) {
                    VStack {
                        List(0..<viewModel.categories.count, id: \.self) { index in
                            Text(viewModel.categories[index].name)
                                .font(.system(size: 8))
                                .onTapGesture {
                                    viewModel.selectCategory(index: index)
                                }
                        }
                        .listStyle(PlainListStyle())
                    }
                    .padding(0)
                    if viewModel.isSubcategoryListOpen == true {
                        VStack {
                            List(viewModel.subItems, id: \.id) { subItem in
                                Text(subItem.name)
                                    .font(.system(size: 8))
                                    .onTapGesture {
                                        viewModel.selectSubItem(subItem: subItem)
                                    }
                            }
                            .listStyle(PlainListStyle())
                        }
                        .padding(0)
                    }
                }
                .padding(0)
                .frame(width: UIScreen.screenWidth * 0.4)
                //clothing section by choice
                Spacer()
                ScrollView(.vertical) {
                    if viewModel.selectedSubCatId != nil {
                        VStack {
                            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
                                ForEach(viewModel.cloths) { cloth in
                                    if let imageData = cloth.clothImage,
                                       let uiImage = UIImage(data: imageData) {
                                        Image(uiImage: uiImage)
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(height: 100)
                                            .frame(width: UIScreen.screenWidth * 0.15)
                                            .onTapGesture {
                                                let selectedCategoryId = viewModel.selectedCatId
                                                if selectedCategoryId == 0 {
                                                    outfitCloths.accessory = cloth.clothId!
                                                }
                                                else if selectedCategoryId == 1 {outfitCloths.bag = cloth.clothId!}
                                                else if selectedCategoryId == 2 {
                                                    outfitCloths.fullbody = ""
                                                    outfitCloths.bottom = cloth.clothId!
                                                    viewModel.outfitImages[3] = Image("empty")
                                                }
                                                else if selectedCategoryId == 3 {
                                                    outfitCloths.fullbody = cloth.clothId!
                                                    outfitCloths.top = ""
                                                    outfitCloths.bottom = ""
                                                    viewModel.outfitImages[2] = Image("empty")
                                                    viewModel.outfitImages[6] = Image("empty")
                                                }
                                                else if selectedCategoryId == 4 {outfitCloths.outwear = cloth.clothId!}
                                                else if selectedCategoryId == 5 {outfitCloths.shoe = cloth.clothId!}
                                                else if selectedCategoryId == 6 {
                                                    outfitCloths.top = cloth.clothId!
                                                    outfitCloths.fullbody = ""
                                                    viewModel.outfitImages[3] = Image("empty")
                                                }
                                                viewModel.outfitImages[selectedCategoryId] = Image(uiImage: uiImage)
                                            }
                                    }
                                }
                            }
                        }
                        .padding(.top, 20)
                    }
                }
                Spacer()
            }
            //Buttons
            HStack {
                Button(action: {
                    outfitCloths = Outfit(id: "", top: "", bottom: "", fullbody: "", shoe: "", bag: "", outwear: "", accessory: "", userId: Auth.auth().currentUser!.uid)
                    viewModel.outfitImages = [Image("empty"),Image("empty"),Image("empty"),Image("empty"),Image("empty"),Image("empty"),Image("empty")]
                    viewModel.isOutfitSaveButtonEnabled = true
                }   ) {
                    Text("New Outfit")
                        .font(.system(size: 12))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                        .background(Color.blue.opacity(0.8))
                        .cornerRadius(8)
                }
                if viewModel.isOutfitSaveButtonEnabled  == false{
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
                        Task{
                            do{
                                viewModel.outfitCloths = outfitCloths
                                try await viewModel.saveOutfit()
                            }
                            catch{
                                print("Failed to save outfit \(error.localizedDescription)")
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
            }
            .padding(.bottom, UIScreen.screenWidth * 0.05)
        }
        .padding(.all, UIScreen.screenWidth * 0.05)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarTitle("Outfit", displayMode: .inline)
    }
}

