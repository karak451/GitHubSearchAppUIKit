//
//  ListaElemView.swift
//  GitHubSearchAppUIKit
//
//  Created by Sudar Istvan on 2024. 01. 29..
//

import UIKit

class ListaElemView: UIView {
    
    private lazy var ListaElemStackView: UIStackView = {
       let vw = UIStackView()
        vw.translatesAutoresizingMaskIntoConstraints = false
        vw.axis = .horizontal
        vw.spacing = 8
     //   vw.heightAnchor.constraint(equalToConstant: 100).isActive = true
        vw.distribution = .equalCentering
        
        return vw
    }()
    
    private lazy var balStackView: UIStackView = {
       let vw = UIStackView()
        vw.translatesAutoresizingMaskIntoConstraints = false
        vw.axis = .vertical
        vw.widthAnchor.constraint(equalToConstant: 70).isActive = true
        vw.distribution = .equalCentering
        
        return vw
    }()
    
    
    let csillagKep = UIImage(systemName: "star.fill")?.withRenderingMode(.alwaysTemplate)
    private lazy var csillagKepView = UIImageView(image: csillagKep)
    
    private lazy var csillagszamText: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "1234"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = UIColor(named: "sotetSzurke")
        
        return label
    }()
    
    private lazy var separatorLine: UIStackView = {
       let vw = UIStackView()
        vw.translatesAutoresizingMaskIntoConstraints = false
        vw.axis = .vertical
        vw.widthAnchor.constraint(equalToConstant: 1).isActive = true
        vw.backgroundColor = UIColor(named: "sotetSzurke")
        
        return vw
    }()
    
    private lazy var jobbStackView: UIStackView = {
       let vw = UIStackView()
        vw.translatesAutoresizingMaskIntoConstraints = false
        vw.axis = .vertical
        vw.distribution = .equalSpacing
        
        return vw
    }()
    
    private lazy var repoCimText: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "ObjectiveRecord"
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textColor = UIColor(named: "sotetSzurke")
        
        return label
    }()
    
    private lazy var repoDescText: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Make a symbolic breakpoint at UIViewAlertFo"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor(named: "sotetSzurke")
        
        return label
    }()
    
    private lazy var datumStackView: UIStackView = {
       let vw = UIStackView()
        vw.translatesAutoresizingMaskIntoConstraints = false
        vw.axis = .horizontal
        vw.spacing = 2
        
        return vw
    }()
    
    private lazy var modositvaText: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "legutóbb módosítva: "
        label.font = UIFont.italicSystemFont(ofSize: 14)
        label.textColor = UIColor.gray
        
        return label
    }()
    
    private lazy var modositvaDatumText: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "2024. 01. 30. 20:30"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor(named: "sotetSzurke")
        
        return label
    }()

    override init(frame: CGRect){
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(cim: String, desc: String, datum: String, csillagSzam: Int){
        csillagszamText.text = String(csillagSzam)
        repoCimText.text = cim
        repoDescText.text = desc
        modositvaDatumText.text = datum
    }

}

private extension ListaElemView{
    private func setup(){
          self.backgroundColor = UIColor(named: "vilagosSzurke")
        self.layer.cornerRadius = 10
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(ListaElemStackView)
        
        ListaElemStackView.addSubview(balStackView)
        ListaElemStackView.addSubview(jobbStackView)
        
        
        csillagKepView.frame = CGRect(x: 20, y: 25, width: 25, height: 25)
        csillagKepView.tintColor = .white
        balStackView.addSubview(csillagKepView)
        balStackView.addSubview(csillagszamText)
        balStackView.addSubview(separatorLine)
        
        jobbStackView.addArrangedSubview(repoCimText)
        jobbStackView.addArrangedSubview(repoDescText)
        jobbStackView.addArrangedSubview(datumStackView)
        
        datumStackView.addArrangedSubview(modositvaText)
        datumStackView.addArrangedSubview(modositvaDatumText)
        
        NSLayoutConstraint.activate([
            ListaElemStackView.topAnchor.constraint(equalTo: self.topAnchor),
            ListaElemStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            ListaElemStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            ListaElemStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            balStackView.topAnchor.constraint(equalTo: ListaElemStackView.topAnchor),
            balStackView.leadingAnchor.constraint(equalTo: ListaElemStackView.leadingAnchor),
            balStackView.trailingAnchor.constraint(equalTo: jobbStackView.leadingAnchor),
            balStackView.bottomAnchor.constraint(equalTo: ListaElemStackView.bottomAnchor),
            
            jobbStackView.topAnchor.constraint(equalTo: ListaElemStackView.topAnchor),
            jobbStackView.leadingAnchor.constraint(equalTo: balStackView.trailingAnchor),
            jobbStackView.trailingAnchor.constraint(equalTo: ListaElemStackView.trailingAnchor),
            jobbStackView.bottomAnchor.constraint(equalTo: ListaElemStackView.bottomAnchor),
            
//            csillagKepView.centerXAnchor.constraint(equalTo: balStackView.centerXAnchor),
            csillagKepView.centerYAnchor.constraint(equalTo: balStackView.centerYAnchor),
            csillagszamText.topAnchor.constraint(equalTo: csillagKepView.bottomAnchor, constant: 5),
            csillagszamText.centerXAnchor.constraint(equalTo: csillagKepView.centerXAnchor),
            
            separatorLine.trailingAnchor.constraint(equalTo: balStackView.trailingAnchor),
            separatorLine.topAnchor.constraint(equalTo: balStackView.topAnchor, constant: 3),
            separatorLine.bottomAnchor.constraint(equalTo: balStackView.bottomAnchor, constant: -3),
            
    //        repoCimText.leadingAnchor.constraint(equalTo: jobbStackView.leadingAnchor, constant: 10),
      //      repoCimText.trailingAnchor.constraint(equalTo: jobbStackView.trailingAnchor, constant: -10),
            
  //          repoDescText.leadingAnchor.constraint(equalTo: jobbStackView.leadingAnchor, constant: 10),
            
    //        datumStackView.leadingAnchor.constraint(equalTo: jobbStackView.leadingAnchor, constant: 10),
            
      //      modositvaText.leadingAnchor.constraint(equalTo: datumStackView.leadingAnchor),
        //    modositvaText.topAnchor.constraint(equalTo: datumStackView.topAnchor, constant: 5),
            
          //  modositvaDatumText.leadingAnchor.constraint(equalTo: modositvaText.trailingAnchor),
            //modositvaDatumText.topAnchor.constraint(equalTo: datumStackView.topAnchor, constant: 5),
           
        ])
    }
}
