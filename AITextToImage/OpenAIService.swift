//
//  OpenAIService.swift
//  AITextToImage
//
//  Created by Andrew Wen on 2023-12-18.
//

import Foundation
import Alamofire

class OpenAIService {
    private let endPointURL = ""
    
    func generateImage(prompt: String) async throws -> OpenAIImageResponse {
        let body = OpenAIImageRequestBody(prompt: prompt, size: "512x512")
        let headers: HTTPHeaders = [
            "Authorization" : "Bearer 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"
        ]
        
        return try await AF.request(endPointURL, method: .post, parameters: body, encoder: .json, headers: headers)
            .serializingDecodable(OpenAIImageResponse.self).value
    }
}

struct OpenAIImageResponse: Decodable {
    let data: [OpenAIImageURL]
}

struct OpenAIImageURL: Decodable {
    let url: String
}

struct OpenAIImageRequestBody: Encodable {
    let prompt: String
    let size: String
}
