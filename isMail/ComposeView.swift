import SwiftUI

struct ComposeView: View {
    @Environment(\.dismiss) private var dismiss

    @State private var titleText: String = ""
    @State private var messageText: String = " "
    @State private var selectedPreset: DeliveryPreset? = nil
    @State private var selectedDate: Date = Date()
    @State private var showDatePicker: Bool = false
    @State private var ShowAlert = false
    @State private var goToCongrats = false

    var body: some View {
        NavigationStack {
            ZStack(alignment: .topLeading) {
                Image("bg")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()

                Color.black.opacity(0.72)
                    .ignoresSafeArea()

                VStack(alignment: .leading, spacing: 26) {
                    topBar

                    VStack(alignment: .leading, spacing: 12) {
                        Text("Title")
                            .font(.system(size: 18, weight: .regular))
                            .foregroundColor(.white)
                        

                        ZStack(alignment: .topLeading) {
                            RoundedRectangle(cornerRadius: 34)
                                .fill(Color.white.opacity(0.72))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 34)
                                        .stroke(Color.white.opacity(0.7), lineWidth: 1)
                                )
                                .frame(height: 130)

                            if titleText.isEmpty {
                                Text("Write title here")
                                    .foregroundColor(.black.opacity(0.45))
                                    .padding(.horizontal, 18)
                                    .padding(.top, 18)
                            }

                            TextEditor(text: $titleText)
                                .scrollContentBackground(.hidden)
                                .background(Color.clear)
                                .foregroundColor(.black)
                                .font(.system(size: 18))
                                .padding(.horizontal, 14)
                                .padding(.vertical, 12)
                                .frame(height: 130)
                        }
                    }

                    VStack(alignment: .leading, spacing: 12) {
                        Text("Message")
                            .font(.system(size: 18, weight: .regular))
                            .foregroundColor(.white)

                        ZStack(alignment: .topLeading) {
                            RoundedRectangle(cornerRadius: 34)
                                .fill(Color.white.opacity(0.72))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 34)
                                        .stroke(Color.white.opacity(0.7), lineWidth: 1)
                                )
                                .frame(height: 230)

                            if messageText.isEmpty {
                                Text("Write your message")
                                    .foregroundColor(.black.opacity(0.45))
                                    .padding(.horizontal, 18)
                                    .padding(.top, 18)
                            }

                            TextEditor(text: $messageText)
                                .scrollContentBackground(.hidden)
                                .background(Color.clear)
                                .foregroundColor(.black)
                                .font(.system(size: 18))
                                .padding(.horizontal, 14)
                                .padding(.vertical, 12)
                                .frame(height: 230)
                        }
                    }

                    VStack(alignment: .leading, spacing: 14) {
                        Text("Delivery Date")
                            .font(.system(size: 18, weight: .regular))
                            .foregroundColor(.white)

                        HStack(spacing: 10) {
                            presetButton(.oneMonth, label: "1 Month")
                            presetButton(.sixMonths, label: "6 Months")
                            presetButton(.oneYear, label: "1 Year")
                        }

                        Button {
                            withAnimation(.easeInOut) {
                                showDatePicker.toggle()
                                selectedPreset = nil
                            }
                        } label: {
                            HStack(spacing: 12) {
                                Image(systemName: "calendar")
                                    .font(.system(size: 22))

                                Text(formattedDateText)
                                    .font(.system(size: 20, weight: .regular))

                                Spacer()
                            }
                            .foregroundColor(.black)
                            .padding(.horizontal, 18)
                            .frame(height: 66)
                            .background(
                                RoundedRectangle(cornerRadius: 33)
                                    .fill(Color.white.opacity(0.72))
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 33)
                                    .stroke(Color.white.opacity(0.7), lineWidth: 1)
                            )
                        }
                        .buttonStyle(.plain)

                        if showDatePicker {
                            VStack(alignment: .leading, spacing: 12) {
                                DatePicker(
                                    "Pick a date",
                                    selection: $selectedDate,
                                    displayedComponents: .date
                                )
                                .datePickerStyle(.graphical)
                                .labelsHidden()
                                .tint(.blue)
                                .environment(\.colorScheme, .light)
                            }
                            .padding(16)
                            .frame(maxWidth: .infinity)
                            .background(
                                RoundedRectangle(cornerRadius: 24)
                                    .fill(Color.white.opacity(0.95))
                            )
                        }
                    }

                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding(.horizontal, 24)
                .padding(.top, 20)
                .padding(.bottom, 28)
            }
            .toolbar(.hidden, for: .navigationBar)
            .navigationDestination(isPresented: $goToCongrats){
                Congrats()
            }.alert("Incomplete Form", isPresented: $ShowAlert){
                Button("OK", role: .cancel){}
            }message: {
                Text("Please fill in title and message first.")
            }
        }
    }

    var topBar: some View {
        HStack {
            Button {
                dismiss()
            } label: {
                Image(systemName: "xmark")
                    .font(.system(size: 22, weight: .medium))
                    .foregroundColor(.white.opacity(0.8))
                    .frame(width: 64, height: 64)
                    .background(Color.white.opacity(0.12))
                    .clipShape(Circle())
            }
            .buttonStyle(.plain)

            Spacer()

            Text("Title")
                .font(.system(size: 24, weight: .semibold))
                .foregroundColor(.white)

            Spacer()

            Button {
                let cleanTitle = titleText.trimmingCharacters(in: .whitespacesAndNewlines)
                let cleanMessage = messageText.trimmingCharacters(in: .whitespacesAndNewlines)
                
                if cleanTitle.isEmpty || cleanMessage.isEmpty{
                    ShowAlert = true
                } else {
                    goToCongrats = true
                }
            } label: {
                Image(systemName: "arrow.up")
                    .font(.system(size: 28, weight: .medium))
                    .foregroundColor(.white)
                    .frame(width: 64, height: 64)
                    .background(Color.blue)
                    .clipShape(Circle())
            }
            .buttonStyle(.plain)
        }
    }

    func presetButton(_ preset: DeliveryPreset, label: String) -> some View {
        Button {
            selectedPreset = preset
            showDatePicker = false

            switch preset {
            case .oneMonth:
                selectedDate = Calendar.current.date(byAdding: .month, value: 1, to: Date()) ?? Date()
            case .sixMonths:
                selectedDate = Calendar.current.date(byAdding: .month, value: 6, to: Date()) ?? Date()
            case .oneYear:
                selectedDate = Calendar.current.date(byAdding: .year, value: 1, to: Date()) ?? Date()
            }
        } label: {
            Text(label)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.black)
                .frame(minWidth: 0, maxWidth: .infinity)
                .frame(height: 42)
                .background(
                    Capsule()
                        .fill(selectedPreset == preset ? Color.white : Color.white.opacity(0.72))
                )
                .overlay(
                    Capsule()
                        .stroke(Color.white.opacity(0.7), lineWidth: 1)
                )
        }
        .buttonStyle(.plain)
    }

    var formattedDateText: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: selectedDate)
    }
}

enum DeliveryPreset {
    case oneMonth
    case sixMonths
    case oneYear
}

#Preview {
    ComposeView()
}
