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
        // Local development only. Production apps must call an authenticated backend
        // that stores the provider credential on the server.
        guard let apiKey = ProcessInfo.processInfo.environment["OPENAI_API_KEY"],
              !apiKey.isEmpty else {
            throw NSError(domain: "OpenAIService", code: 1,
                          userInfo: [NSLocalizedDescriptionKey: "Configure OPENAI_API_KEY for local development."])
        }
        let body = OpenAIImageRequestBody(prompt: prompt, size: "512x512")
        let headers: HTTPHeaders = [
            "Authorization" : "Bearer \(apiKey)"
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
