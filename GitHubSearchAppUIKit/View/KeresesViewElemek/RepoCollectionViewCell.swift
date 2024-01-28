//
//  RepoCollectionViewCell.swift
//  GitHubSearchAppUIKit
//
//  Created by Sudar Istvan on 2024. 01. 29..
//

import UIKit

protocol RepoCollectionViewCellDelegate: AnyObject{
    func didTapReopoListElem()
}

class RepoCollectionViewCell: UICollectionViewCell {
    
    private var vw: ListaElemView?
    weak var delegate: RepoCollectionViewCellDelegate?
    
    var item: Repository? {
        didSet {
            guard let cim = item?.name,
                  let desc = item?.description,
                  let datum = item?.updated_at,
                  let csillagSzam = item?.stargazers_count
            else {return}
            
            vw?.set(cim: cim, desc: desc, datum: datum, csillagSzam: csillagSzam)
            
        }
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension RepoCollectionViewCell{
    func setup(){
       
        guard vw == nil else {return}
        
        vw = ListaElemView()
        
        self.contentView.addSubview(vw!)
        
        NSLayoutConstraint.activate([
            vw!.topAnchor.constraint(equalTo: contentView.topAnchor),
            vw!.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            vw!.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            vw!.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
        ])
    }
}
