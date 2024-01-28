//
//  PersonView.swift
//  GitHubSearchAppUIKit
//
//  Created by Sudar Istvan on 2024. 01. 28..
//

import UIKit

class KeresesView: UIView {
    
    private let kvm: KeresesViewModel
    
    private lazy var keresoMezo: KeresoMezo = {
        let vw = KeresoMezo{ query, query2  in
            if(query2 != nil){
                self.kvm.minositoMezoQuery = query2!
            }
            self.kvm.keresoMezoQuery = query
            Task{
                do{
                    try await self.kvm.fetchGitHubRepositories()
                } catch {
                    print(error)
                }
            }
        }
        return vw
    }()
    
    private lazy var listaElemView: ListaElemView = {
        let vw = ListaElemView()
        return vw
    }()

    
    init(kvm: KeresesViewModel){
        self.kvm = kvm
        super.init(frame: .zero)
        setup()
        
    }
    
    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }

}





private extension KeresesView{
    func setup(){
        //  self.backgroundColor = UIColor.gray.withAlphaComponent(0.7)
        //   self.layer.cornerRadius = 10
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(keresoMezo)
        
        //self.addSubview(listaElemView)
        
        
        NSLayoutConstraint.activate([
            keresoMezo.topAnchor.constraint(equalTo: self.topAnchor),
            keresoMezo.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            keresoMezo.trailingAnchor.constraint(equalTo: self.trailingAnchor),
           // keresoMezo.bottomAnchor.constraint(equalTo: cv.topAnchor),
 //           listaElemView.topAnchor.constraint(equalTo: keresoMezo.bottomAnchor, constant: 10),
   //         listaElemView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
     //       listaElemView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
            
        ])
    }
}
