//
//  APIService.swift
//  projectWithInstagram
//
//  Created by artem on 25.04.2023.
//

import Foundation
import RxCombine
import RxSwift

class APIService {
    static let shared = APIService()
    private var url_base = "https://graph.instagram.com/me/media?fields=caption,id,modin_type,username,media_url&access_token="
    private let accessToken = "IGQVJWZAmMyRjZANcWNuaVhHeTQyejZAxNkVtWnZAoTndaNmNHSnJaaEtLOVJ0WmVqcHU4a2FGcklVbjdfSU15dGxidnBpUkV6TUdRVUo4ZAHBHX25OWVdYM2N5bGhNMkdFVlBLSzhqRFpn"
    private var urlString = ""
    private let sesion = URLSession(configuration: .default)
    
    private func bildUrl() -> String? {
        urlString = url_base + accessToken
        return urlString
    }
    
//    func searchPostsByTag(onSuccess: @escaping (ModelForJsone?)-> Void, onError: @escaping (String) -> Void) {
//        // MARK: - Здійснюємо виклик API
//        guard let urlStr = bildUrl() else { return }
//        guard let url = URL(string: urlStr) else {
//            onError("Error bilding URL")
//            return
//        }
//        // MARK: - передаємо URL для виклику
//        let task = sesion.dataTask(with: url) {(data, response, error) in
//            DispatchQueue.main.async {
//                if let error = error {
//                    onError(error.localizedDescription)
//                    return
//                }
//                guard let data = data, let response = response as? HTTPURLResponse else {
//                    onError("Invalid data on response")
//                    return
//                }
//
//                do {
//                    print(response.statusCode)
//                    if response.statusCode == 200 {
//                        // MARK: - Перетворюємо результат JSON на екземпляр struct який ми створили в нашій моделі дані перетворюютьсяна структуру ModelForJsone
//                        let items = try JSONDecoder().decode(ModelForJsone.self, from: data)
//                        print(items)
//                        onSuccess(items)
//                    } else {
//                        onError("Response wasn't 200. It was:" + "\n\(response.statusCode)")
//                    }
//                } catch {
//                    onError(error.localizedDescription)
//                }
//            }
//        }
//        task.resume()
//    }
    
    func searchPostsByTag() -> Observable<ModelForJsone> {
        // MARK: - Creating an observable for API call
        return Observable.create { [self] observer in
            guard let urlStr = bildUrl() else {
                observer.onError(NSError(domain: "Error building URL", code: 0, userInfo: nil))
                return Disposables.create()
            }
            guard let url = URL(string: urlStr) else {
                observer.onError(NSError(domain: "Invalid URL", code: 0, userInfo: nil))
                return Disposables.create()
            }
            let task = sesion.dataTask(with: url) { (data, response, error) in
                DispatchQueue.main.async {
                    if let error = error {
                        observer.onError(error)
                        return
                    }
                    guard let data = data, let response = response as? HTTPURLResponse else {
                        observer.onError(NSError(domain: "Invalid response data", code: 0, userInfo: nil))
                        return
                    }
                    do {
                        if response.statusCode == 200 {
                            let items = try JSONDecoder().decode(ModelForJsone.self, from: data)
                            observer.onNext(items)
                            observer.onCompleted()
                        } else {
                            observer.onError(NSError(domain: "Invalid response status code", code: response.statusCode, userInfo: nil))
                        }
                    } catch {
                        observer.onError(error)
                    }
                }
            }
            task.resume()
            return Disposables.create {
                task.cancel()
            }
        }
    }
}

