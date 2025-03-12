//
//  GenderView.swift
//  RizzApp
//
//  Created by Гаджиев Рамил Имранович on 12.03.2025.
//

import SwiftUI

struct GenderView: View {
    @State private var selectedGender: String? = nil
    private let genders = ["Male", "Female", "Non-binary"]
    
    var body: some View {
        VStack {
            // Градиентный заголовок "Gender"
            Text("Gender")
                .font(.system(size: 28, weight: .semibold))
                .foregroundColor(.clear)
                .overlay(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color(red: 164/255, green: 141/255, blue: 1.0),
                            Color(red: 1.0, green: 146/255, blue: 193/255)
                        ]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .mask(
                    Text("Gender")
                        .font(.system(size: 28, weight: .semibold))
                )
            
            // Прогресс-бар (5 шагов: первая белая, остальные серые)
            HStack(spacing: 10) {
                ForEach(0..<5, id: \.self) { index in
                    RoundedRectangle(cornerRadius: 3)
                        .fill(index == 0 ? Color.white : Color(red: 68/255, green: 68/255, blue: 68/255))
                        .frame(width: 35, height: 6)
                }
            }
            .padding(.top, 20)
            .padding(.bottom, 30)
            
            // Подзаголовок
            Text("How do you define yourself?")
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.bottom, 30)
            
            // Кнопки выбора пола с градиентной рамкой
            ForEach(genders, id: \.self) { gender in
                GradientButton(title: gender, isSelected: selectedGender == gender) {
                    selectedGender = gender
                }
            }
            
            Spacer()
        }
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
    }
}

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
        .padding(1) // "Толщина" градиентной рамки
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

struct GenderView_Previews: PreviewProvider {
    static var previews: some View {
        GenderView()
    }
}
