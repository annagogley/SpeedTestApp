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
        //задаем старт отчета
        let start = CFAbsoluteTimeGetCurrent()
        
            AF.download(url)
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
                    }
                }
    }
    
    //MARK: - Upload speed
    func getUploadSpeed(_ completionHandler: @escaping (Double) -> Void) {
        guard let url = URL(string: urlString) else {
            print("incorrect URL")
            return
        }
        //задаем старт отчета
        let start = CFAbsoluteTimeGetCurrent()
        
//        AF.upload(<#T##data: Data##Data#>, with: <#T##URLRequestConvertible#>)
    }
}


