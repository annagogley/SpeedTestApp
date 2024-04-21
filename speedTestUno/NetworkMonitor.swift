//
//  NetworkMonitor.swift
//  speedTestUno
//
//  Created by Аня Воронцова on 18.04.2024.
//

import Alamofire
import Foundation
import UIKit

final class NetworkMonitor {
    let urlString : String
    
    init(urlString: String) {
        self.urlString = urlString
    }
    
    func getDownloadSpeed() {
        print(#function)
        guard let url = URL(string: urlString) else {
            print("incorrect URL")
            return
        }
        let queue = DispatchQueue(label: "net", qos: .userInitiated)
        let destination = DownloadRequest.suggestedDownloadDestination(for: .documentDirectory)

        print("starting download \(url.absoluteString) to \(String(describing: destination))")
        AF.download("https://httpbin.org/image/png")
            .downloadProgress { progress in
                print("Download Progress: \(progress.fractionCompleted)")
            }
            .responseData { response in
                if let data = response.value {
                    let image = UIImage(data: data)
                }
            }
    }
}


