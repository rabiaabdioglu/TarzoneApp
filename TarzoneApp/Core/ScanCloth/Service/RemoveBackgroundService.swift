//
//  RemoveBackGroundService.swift
//  TarzoneApp
//
//  Created by Rabia Abdioğlu on 24.05.2023.
//

import Foundation

enum RemoveBackgroundError: Error {
    case invalidResponse
    case requestFailed
    // Diğer hata durumları
}

class RemoveBackgroundService {
    private let apiKey = "nAgdszjwaWRjDGSrB5sbzyfM"

    func removeBackground(from imageData: Data, completion: @escaping (Result<Data, RemoveBackgroundError>) -> Void) {
       
        guard let fileUrl = Bundle.main.url(forResource: "file", withExtension: "jpg"),
          let data = try? Data(contentsOf: fileUrl)
        else { return false }

        struct HTTPBinResponse: Decodable { let url: String }

        AF.upload(
          multipartFormData: { builder in
            builder.append(
              data,
              withName: "image_file",
              fileName: "file.jpg",
              mimeType: "image/jpeg"
            )
          },
          to: URL(string: "https://api.remove.bg/v1.0/removebg")!,
          headers: [
            "X-Api-Key": "INSERT_YOUR_API_KEY_HERE"
          ]
        ).responseDecodable(of: HTTPBinResponse.self) { imageResponse in
          guard let imageData = imageResponse.data,
            let image = UIImage(data: imageData)
          else { return }

          self.imageView.image = image
        }
    }
}
