import Foundation
import UIKit

extension UIColor {
    public static let primaryGreen = UIColor(hex: "#606C38FF")
    public static let darkGreen = UIColor(hex: "#283618FF")
    public static let lightYellow = UIColor(hex: "#FEFAE0FF")
    public static let orange = UIColor(hex: "#DDA15EFF")
    public static let brown = UIColor(hex: "#BC6C25FF")
}

extension UIColor {
    convenience init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0

        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0
        let alpha = CGFloat(1.0)

        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
