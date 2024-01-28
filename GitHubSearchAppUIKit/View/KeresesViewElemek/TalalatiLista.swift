//
//  TalalatiLista.swift
//  GitHubSearchAppUIKit
//
//  Created by Sudar Istvan on 2024. 01. 29..
//

import UIKit

class TalalatiLista: UIView {

    override init(frame: CGRect){
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }

}

private extension TalalatiLista{
    
    func setup(){
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
