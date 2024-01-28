//
//  KeresesViewModel.swift
//  GitHubSearchAppUIKit
//
//  Created by Sudar Istvan on 2024. 01. 29..
//

import Foundation
import Combine

protocol KeresesViewModelDelegate: AnyObject{
    func didStartSearching()
    func didFinish()
    func didFail(error: Error)
}

class KeresesViewModel: ObservableObject{

    @Published var keresoMezoQuery: String = ""
    @Published var minositoMezoQuery: String = ""
    private(set) var talalatiLista: [Repository] = []
    private var cancellables = Set<AnyCancellable>()
    
    //UI-hoz kondíciók
    @Published var keresesStatusz: KeresesStatusz = .off
    weak var delegate: KeresesViewModelDelegate?
    @Published var feedbackText = ""
    
  
    @MainActor func fetchGitHubRepositories() async throws{
        
        self.delegate?.didStartSearching()
        self.keresesStatusz = .keres
        var standardizedQuery = keresoMezoQuery
        standardizedQuery = standardizedQuery.replacingOccurrences(of: " ", with: "+")
        if !minositoMezoQuery.isEmpty{
            standardizedQuery.append("+language:\(minositoMezoQuery.replacingOccurrences(of: " ", with: "+"))")
        }

        let urlString = "https://api.github.com/search/repositories?q=\(standardizedQuery)"
        
        WebServiceManager.shared.getData(endpoint: urlString, type: Root.self)
            .sink{ completion in
                switch completion{
                case .failure(let err):
                    self.keresesStatusz = .hiba
                    self.delegate?.didFail(error: err)
                    print("Error is \(err.localizedDescription)")
                case .finished:
                    self.keresesStatusz = .vegzett
                    self.delegate?.didFinish()
                }
            } receiveValue: { [weak self] gitHubResponse in
                self?.keresesStatusz = .vegzett
                self?.talalatiLista = gitHubResponse.items
                if (self?.talalatiLista.isEmpty ?? true){
                    self?.feedbackText = "Próbálkozz más kulcsszóval!"
                }
            }.store(in: &cancellables)
    }
}
