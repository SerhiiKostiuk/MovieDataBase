//
//  Font+Extensions.swift
//  MovieDataBase
//
//  Created by Serhii Kostiuk  on 31.01.2024.
//

import Foundation
import SwiftUI

enum MovieDataBaseFont: String {
    case gudeaBold                  = "Gudea-Bold"
    case gudeaItalic                = "Gudea-Italic"
    case gudea                      = "Gudea"
    case montserratRegular          = "Montserrat-Regular"
    case montserratExtraBold        = "Montserrat-ExtraBold"
    case montserratBoldItalic       = "Montserrat-BoldItalic"
    case montserratBlack            = "Montserrat-Black"
    case montserratMedium           = "Montserrat-Medium"
    case montserratBold             = "Montserrat-Bold"
    case montserratLight            = "Montserrat-Light"
    case montserratSemiBold         = "Montserrat-SemiBold"
    case montserratLightItalic      = "Montserrat-LightItalic"
    case montserratExtraLight       = "Montserrat-ExtraLight"
    case montserratExtraLightItalic = "Montserrat-ExtraLightItalic"
    case montserratSemiBoldItalic   = "Montserrat-SemiBoldItalic"
    case montserratThinItalic       = "Montserrat-ThinItalic"
    case montserratThin             = "Montserrat-Thin"
    case montserratBlackItalic      = "Montserrat-BlackItalic"
    case montserratItalic           = "Montserrat-Italic"
    case montserratMediumItalic     = "Montserrat-MediumItalic"
    case montserratExtraBoldItalic  = "Montserrat-ExtraBoldItalic"
}

extension Font {
    
    static var gudeaBold: Font {
        return .custom(MovieDataBaseFont.gudeaBold.rawValue, size: 17)
    }

    static var gudeaItalic: MovieDataBaseFont {
        return .gudeaItalic
    }

    static var gudea: MovieDataBaseFont {
        return .gudea
    }

    static var montserratRegular: MovieDataBaseFont {
        return .montserratRegular
    }

    static var montserratExtraBold: MovieDataBaseFont {
        return .montserratExtraBold
    }

    static var montserratBoldItalic: MovieDataBaseFont {
        return .montserratBoldItalic
    }

    static var montserratBlack: MovieDataBaseFont {
        return .montserratBlack
    }

    static var montserratMedium: MovieDataBaseFont {
        return .montserratMedium
    }

    static var montserratBold: MovieDataBaseFont {
        return .montserratBold
    }

    static var montserratLight: MovieDataBaseFont {
        return .montserratLight
    }

    static var montserratSemiBold: MovieDataBaseFont {
        return .montserratSemiBold
    }

    static var montserratLightItalic: MovieDataBaseFont {
        return .montserratLightItalic
    }

    static var montserratExtraLight: MovieDataBaseFont {
        return .montserratExtraLight
    }

    static var montserratExtraLightItalic: MovieDataBaseFont {
        return .montserratExtraLightItalic
    }

    static var montserratSemiBoldItalic: MovieDataBaseFont {
        return .montserratSemiBoldItalic
    }

    static var montserratThinItalic: MovieDataBaseFont {
        return .montserratThinItalic
    }

    static var montserratThin: MovieDataBaseFont {
        return .montserratThin
    }

    static var montserratBlackItalic: MovieDataBaseFont {
        return .montserratBlackItalic
    }

    static var montserratItalic: MovieDataBaseFont {
        return .montserratItalic
    }

    static var montserratMediumItalic: MovieDataBaseFont {
        return .montserratMediumItalic
    }

    static var montserratExtraBoldItalic: MovieDataBaseFont {
        return .montserratExtraBoldItalic
    }
    
    static func font(_ fontName: MovieDataBaseFont, size: CGFloat) -> Font {
        Font.custom(fontName.rawValue, size: size)
    }
}
