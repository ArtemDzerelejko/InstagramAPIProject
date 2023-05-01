//
//  ViewModel.swift
//  projectWithInstagram
//
//  Created by artem on 25.04.2023.
//

import Foundation
import RxSwift
import RxCombine

class UserViewModel: ObservableObject {
    @Published var searchText = ""
    @Published var apiResult: ModelForJsone?
    @Published var isLoading = false
    @Published var isError = false
    
//    func generateApi() {
//        self.isLoading = true
//        APIService.shared.searchPostsByTag(onSuccess: { [weak self] result in
//            guard let strongSelf = self else {return}
//            strongSelf.apiResult = result
//            strongSelf.isLoading = false
//        }, onError: { error in
//            self.isError = true
//            self.isLoading = false
//        })
        func generateApi() {
            self.isLoading = true
            APIService.shared.searchPostsByTag()
                .subscribe(onNext: { [weak self] result in
                    guard let strongSelf = self else {return}
                    strongSelf.apiResult = result
                    strongSelf.isLoading = false
                }, onError: {[weak self] result in
                    guard let strongSelf = self else {return}
                    strongSelf.isError = true
                    strongSelf.isLoading = false
                })
        }
    
    
    func cleanUpText() {
        searchText = ""
    }
}



