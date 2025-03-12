
struct GradientButton: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 14)
                .background(isSelected ? Color(red: 17/255, green: 17/255, blue: 17/255) : Color.black)
                .cornerRadius(25)
        }
        .padding(1)
        .background(
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 164/255, green: 141/255, blue: 1.0),
                    Color(red: 1.0, green: 146/255, blue: 193/255)
                ]),
                startPoint: .leading,
                endPoint: .trailing
            )
        )
        .cornerRadius(26)
        .padding(.bottom, 15)
    }
}