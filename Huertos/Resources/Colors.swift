import Foundation
import SwiftUI
import UIKit

extension Color {
    public static let primaryGreen = Color(hex: "#606C38")
    public static let darkGreen = Color(hex: "#283618")
    public static let cream = Color(hex: "#FEFAE0")
    public static let orange = Color(hex: "#DDA15E")
    public static let brown = Color(hex: "#BC6C2")
}

extension Color {
    init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0

        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0
        

        self.init(red: red, green: green, blue: blue)
    }
}
