//
//  ViewController.swift
//  GitHubSearchAppUIKit
//
//  Created by Sudar Istvan on 2024. 01. 28..
//

import UIKit

class ViewController: UIViewController {
    
    private let kvm = KeresesViewModel()
    
    private lazy var keresesView: KeresesView = {
        let vw = KeresesView(kvm: kvm)
        return vw
    }()
    
    private lazy var cv: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: UIScreen.main.bounds.width-50, height: 76)
        
        let vw = UICollectionView(frame: .zero, collectionViewLayout: layout)
        vw.register(RepoCollectionViewCell.self, forCellWithReuseIdentifier: "RepoCollectionViewCell")
        vw.dataSource = self
        vw.translatesAutoresizingMaskIntoConstraints = false
        return vw
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        kvm.delegate = self
    }
    

}

extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("datasource, numberOfItemsInSection: \(kvm.talalatiLista.count)")
        return kvm.talalatiLista.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       let item = kvm.talalatiLista[indexPath.item]
        print("datasource, cellForItemAt: \(item)")
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RepoCollectionViewCell", for: indexPath) as! RepoCollectionViewCell
        cell.item = item
        return cell
    }
    
}

extension ViewController: KeresesViewModelDelegate{
    func didStartSearching() {
        print("elkezdte a lekérdezést")
        
    }
    
    func didFinish() {
        cv.reloadData()
        print("végzett a lekérdezéssel, első elem címe: \(kvm.talalatiLista[0].name)")
        
    }
    
    func didFail(error: Error) {
        print("hiba a lekérdezéskor: \(error)")
    }
    
    
}

private extension ViewController{
    func setup(){
        self.view.backgroundColor = .black
        self.view.addSubview(keresesView)
        self.view.addSubview(cv)

        
        NSLayoutConstraint.activate([
            keresesView.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            keresesView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            keresesView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            
            cv.topAnchor.constraint(equalTo: keresesView.bottomAnchor, constant: 15),
            cv.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 15),
            cv.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -15),
            cv.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -15)
        ])
    }
    
    
}
