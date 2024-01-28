//
//  ReszletezesViewModel.swift
//  GitHubSearchAppUIKit
//
//  Created by Sudar Istvan on 2024. 01. 29..
//

import Foundation
import Combine

class ReszletezesViewModel: ObservableObject{
  
    @Published var repoURL: String = ""
    @Published var repoReszletes: RepositoryReszletes?
    @Published var owner: Owner?
    private var cancellables = Set<AnyCancellable>()
    
    @Published var betoltesStatusz: KeresesStatusz = .off
    
    @MainActor func fetchRepositoryDetails() async throws{
        let urlString = self.repoURL
        print("url string: \(urlString)")
        WebServiceManager.shared.getData(endpoint: urlString, type: RepositoryReszletes.self)
            .sink{ completion in
                switch completion{
                case .failure(let err):
                    self.betoltesStatusz = .hiba
                    print("Error is \(err.localizedDescription)")
                case .finished: self.betoltesStatusz = .vegzett
                }
            } receiveValue: { [weak self] gitHubResponse in
                self?.betoltesStatusz = .vegzett
                self?.repoReszletes = gitHubResponse
                self?.owner = gitHubResponse.owner
            }.store(in: &cancellables)
    }
}
