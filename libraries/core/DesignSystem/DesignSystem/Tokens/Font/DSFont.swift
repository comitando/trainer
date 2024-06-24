import UIKit

public enum DSFont: String, CaseIterable {
    case black = "Poppins-Black"
    case blackItalic = "Poppins-BlackItalic"
    case bold = "Poppins-Bold"
    case extraBold = "Poppins-ExtraBold"
    case extraBoldItalic = "Poppins-ExtraBoldItalic"
    case extraLight = "Poppins-ExtraLight"
    case extraLightItalic = "Poppins-ExtraLightItalic"
    case italic = "Poppins-Italic"
    case light = "Poppins-Light"
    case lightItalic = "Poppins-LightItalic"
    case medium = "Poppins-Medium"
    case mediumItalic = "Poppins-MediumItalic"
    case regular = "Poppins-Regular"
    case semiBold = "Poppins-SemiBold"
    case semiBoldItalic = "Poppins-SemiBoldItalic"
    case thin = "Poppins-Thin"
    case thinItalic = "Poppins-ThinItalic"
    
    static var registeredFonts = false
    
    func registerFonts() {
        if !DSFont.registeredFonts {
            DSFont.registeredFonts = true
            let bundle = Bundle(for: DSAssets.self)
            let fonts = DSFont.allCases.map { bundle.url(forResource: $0.rawValue, withExtension: "ttf") }
            for url in fonts.compactMap({ $0 }) {
                if let dataProvider = CGDataProvider(url: url as CFURL),
                   let font = CGFont(dataProvider) {
                    CTFontManagerRegisterGraphicsFont(font, nil)
                }
            }
        }
    }
}
