import SwiftUI

enum DeliveryPreset: Identifiable, CaseIterable {
    case oneMonth, sixMonths, oneYear
    
    var id: Self { self }
    
    var label: String {
        switch self {
        case .oneMonth: return "1 Month"
        case .sixMonths: return "6 Months"
        case .oneYear: return "1 Year"
        }
    }
}

struct ComposeView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var selectedTab : MailTab
    @Binding var showCompose : Bool
    
    var manager: MailManager
    @State private var isAutoChangingDate = false
    @State private var titleText: String = ""
    @State private var messageText: String = ""
    @State private var selectedPreset: DeliveryPreset? = nil
    @State private var selectedDate: Date = Date()
    @State private var showAlert = false
    @State private var goToCongrats = false

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Title")) {
                    ZStack(alignment: .topLeading) {
                        if titleText.isEmpty {
                            Text("Write your title here")
                                .foregroundColor(.gray)
                                .padding(.horizontal, 4)
                                .padding(8)
                        }
                        
                        TextEditor(text: $titleText)
                            .scrollContentBackground(.hidden)
                            .background(Color.clear)
                            .foregroundColor(.primary)
                            .font(.body)
                    }
                    .frame(minHeight: 30)
                }

                Section(header: Text("Message")) {
                    ZStack(alignment: .topLeading) {
                        if messageText.isEmpty {
                            Text("Write your message here")
                                .foregroundColor(.gray)
                                .padding(.horizontal, 4)
                                .padding(8)
                        }
                        
                        TextEditor(text: $messageText)
                            .scrollContentBackground(.hidden)
                            .background(Color.clear)
                            .foregroundColor(.primary)
                            .font(.body)
                    }
                    .frame(minHeight: 200)
                }

                Section(header: Text("Delivery Date")) {
                    Picker("Presets", selection: $selectedPreset) {
                        Text("None").tag(nil as DeliveryPreset?)
                        ForEach(DeliveryPreset.allCases) { preset in
                            Text(preset.label).tag(preset as DeliveryPreset?)
                        }
                    }
                    .pickerStyle(.segmented)
                    .onChange(of: selectedPreset) { oldValue, newValue in
                            if let preset = newValue {
                                isAutoChangingDate = true
                                switch preset {
                                    case .oneMonth:
                                        selectedDate = Calendar.current.date(byAdding: .month, value: 1, to: Date()) ?? Date()
                                    case .sixMonths:
                                        selectedDate = Calendar.current.date(byAdding: .month, value: 6, to: Date()) ?? Date()
                                    case .oneYear:
                                        selectedDate = Calendar.current.date(byAdding: .year, value: 1, to: Date()) ?? Date()
                                }
                            }
                    }

                    DatePicker("Pick a custom date", selection: $selectedDate, displayedComponents: .date)
                        .datePickerStyle(.compact)
                        .onChange(of: selectedDate) { oldValue, newValue in
                            if isAutoChangingDate{
                                isAutoChangingDate = false
                            } else {
                                selectedPreset = nil
                            }
                        }
                }
            }
            
            .navigationTitle("New Letter")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                

                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        let cleanTitle = titleText.trimmingCharacters(in: .whitespacesAndNewlines)
                        let cleanMessage = messageText.trimmingCharacters(in: .whitespacesAndNewlines)
                        
                        if cleanTitle.isEmpty || cleanMessage.isEmpty {
                            showAlert = true
                        } else {
                            
                            manager.sendNewLetter(title: titleText, message: messageText, unlockDate: selectedDate)
                            goToCongrats = true
                            
                        }
                    } label: {
                        Text("Send")
                            .fontWeight(.bold)
                            .foregroundStyle(.blue)
                    }
                }
            }
            .navigationDestination(isPresented: $goToCongrats){
                Congrats(selectedTab: $selectedTab,
                         showCompose: $showCompose)
            }
            .alert("Incomplete Form", isPresented: $showAlert){
                Button("OK", role: .cancel){}
            } message: {
                Text("Please fill in title and message first.")
            }
        }
    }
}


#Preview {
    ComposeView(selectedTab:.constant(.sent), showCompose: .constant(true), manager: MailManager())
}
