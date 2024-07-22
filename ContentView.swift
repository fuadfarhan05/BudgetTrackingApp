import SwiftUI

struct ContentView: View {
    @State private var items: [String] = []
    @State private var newItem: String = ""
    @State private var selectedItem: String? = nil
    @State private var ratings: [String: Int] = [:] // Dictionary to store ratings for each item
    @State private var showSummary: Bool = false
    @State private var budget: String = "0" // State variable for budget

    var body: some View {
        NavigationView {
            ZStack{
                Color(.white)
                    .ignoresSafeArea()
                VStack {
                    Image("twocentslogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:150, height:150)
                        .border(.green)
                        .cornerRadius(10)
                        .padding(10)
                    
                    VStack {
                        Text("How much would you like to spend?: ")
                            .font(.system(size: 15))
                            .fontWeight(.bold)
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        
                        TextField("Enter budget", text: $budget)
                            .frame(width: 300, height: 75)
                            .font(.system(size:30))
                            .keyboardType(.decimalPad) // Ensures numeric keypad for input
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .foregroundColor(.green)
                        
                        
                        
                    }
                    
                    .padding(.horizontal)
                    Text("We want to get to know you! Enter your purchasing priorites. What do you prioritize?")
                        .padding()
                        .border(.green)
                        .foregroundColor(.blue)
                        .cornerRadius(10)
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                    
                    
                    
                    HStack {
                        TextField("Enter priorities", text: $newItem, onCommit: addItem)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                            .font(.system(size:25))
                        Button(action: addItem) {
                            Text("Add")
                                .fontWeight(.bold)
                                .font(.system(size:15))
                                .padding(5)
                                .border(.purple)
                                .cornerRadius(10)
                        }
                        .padding()
                        .font(.system(size:10))
                        .background(Color.green)
                        .cornerRadius(50)
                    }
                    .padding()
                    
                    List {
                        ForEach(items, id: \.self) { item in
                            ItemRow(item: item, rating: $ratings[item])
                        }
                        .onDelete(perform: deleteItem)
                    }
                    
                    
                    
                        NavigationLink(destination: newfeatureview()) {
                            Text("Check Info")
                                .font(.title2)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.yellow)
                                .foregroundColor(.black)
                                .cornerRadius(10)
                                .padding()
                        }
                    }

                
                    
                .navigationBarItems(trailing: HStack {
                    Text("Budget: $\(budget)") // Display budget in the corner
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                        .padding()
                    EditButton()
                        .font(.system(size:25))
                })
            }
        }
    }
    
    private func addItem() {
        if !newItem.isEmpty {
            items.append(newItem)
            newItem = "" // Clear the text field after adding the item
        }
    }
    
    private func deleteItem(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
}

struct ItemRow: View {
    let item: String
    @State private var isExpanded: Bool = false
    @Binding var rating: Int?

    var body: some View {
        VStack {
            HStack {
                Text(item)
                Spacer()
                if let rating = rating {
                    Text("Rating: \(rating)")
                        .foregroundColor(.gray)
                }
                Button(action: {
                    withAnimation {
                        isExpanded.toggle()
                    }
                }) {
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        .foregroundColor(.blue)
                }
            }
            .padding()
            
            if isExpanded {
                Picker("Rate \(item)", selection: $rating) {
                    Text("1").tag(1 as Int?)
                    Text("2").tag(2 as Int?)
                    Text("3").tag(3 as Int?)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
            }
        }
        .background(Color(UIColor.systemGroupedBackground))
        .cornerRadius(10)
        .padding(.vertical, 5)
    }
}
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
