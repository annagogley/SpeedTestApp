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
    //MARK: - Properties
    let urlString : String
    private let constBitToMbit = Double(1048576)
    
    //MARK: - Initializer
    init(urlString: String) {
        self.urlString = urlString
    }
    
    //MARK: - Download speed
    func getDownloadSpeed(_ completionHandler: @escaping (Double) -> Void) {
        guard let url = URL(string: urlString) else {
            print("incorrect URL")
            return
        }
        let destination = DownloadRequest.suggestedDownloadDestination(for: .documentDirectory, in: .userDomainMask)
        //задаем старт отчета
        let start = CFAbsoluteTimeGetCurrent()
        
            AF.download(url, to: destination)
                .responseData { response in
                    //считаем разницу во времени
                    let diff = CFAbsoluteTimeGetCurrent() - start
                    if let totalBytes = response.value?.count {
                        //считаем скорость :
                        // всего байтов приводим к Мб путем деления на костанту,
                        // делим на затраченное время
                        let downloadSpeed = Double(totalBytes) / self.constBitToMbit / Double(diff)
                        // возвращаем скорость
                        completionHandler(downloadSpeed)
                        // удаляем скачанный файл
                        if let destinationURL = response.fileURL {
                            if FileManager.default.fileExists(atPath: destinationURL.path()) {
                                do {
                                    try FileManager.default.removeItem(at: destinationURL)
                                } catch {
                                    print(error.localizedDescription)
                                }
                            }
                        }
                    }
                }
        
    }
    
    //MARK: - Upload speed
    func getUploadSpeed(_ completionHandler: @escaping (Double) -> Void) {
        let fileURL = Bundle.main.url(forResource: "samplePDF", withExtension: "pdf")!
        //задаем старт отчета
        let start = CFAbsoluteTimeGetCurrent()
        
        AF.upload(fileURL, to: "https://httpbin.org/post").responseData { response in
            let diff = CFAbsoluteTimeGetCurrent() - start
            // в данном случае возвращаем время, затраченное на загрузку 10 МБ сэмплового файла на upload url
            completionHandler(Double(diff))
        }
    }
}


