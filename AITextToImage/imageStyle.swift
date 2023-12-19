//
//  ImageStyle.swift
//  AITextToImage
//
//  Created by Andrew Wen on 2023-12-18.
//

import SwiftUI

enum ImageStyle : String, CaseIterable {
    case surrealism
    case realism
    case threeDRender
    case abstract
    case retro
    
    var title: String {
        switch self {
        case .surrealism:
            return "Surrealism"
        case .realism:
            return "Realism"
        case .threeDRender:
            return "3D Render"
        case .abstract:
            return "Abstract"
        case .retro:
            return "Retro"
        }
    }
}
