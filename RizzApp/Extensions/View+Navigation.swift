import SwiftUI

extension View {
    func navigate<NewView: View>(to view: NewView, when binding: Binding<Bool>) -> some View {
        NavigationView {
            ZStack {
                self
                NavigationLink(
                    destination: view,
                    isActive: binding,
                    label: { EmptyView() }
                )
            }
        }
        .navigationViewStyle(.stack)
    }
} 