//
//  PageCell.swift
//  MyApp
//
//  Created by Yusuf Akeem on 03/05/2023.
//

import UIKit

class PageCell: UICollectionViewCell  {
    
    var page: Page? {
        didSet{
//          print(page?.imageName)
            guard let unwrappedPage = page  else { return }
            bearImageView.image = UIImage(named: unwrappedPage.imageName)
            
            let attriutedText = NSMutableAttributedString(string: unwrappedPage.headerText, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
            
            attriutedText.append(NSAttributedString(string: "\n\n\n\(unwrappedPage.bodyText)", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13),  NSAttributedString.Key.foregroundColor: UIColor.gray]))
            discriptionTextView.attributedText = attriutedText
            discriptionTextView.textAlignment = .center
        }
    }
    
    private let bearImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "bear_first"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let discriptionTextView: UITextView = {
        let textView = UITextView()
        let attriutedText = NSMutableAttributedString(string: "Join us today in our fun and games!", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
        
        attriutedText.append(NSAttributedString(string: "\n\n\nAre you ready for load and loads of fun? Don't wait any longer! we hope to see you in our store soon.", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13),  NSAttributedString.Key.foregroundColor: UIColor.gray]))
        textView.attributedText = attriutedText
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    private func setupLayout() {
        
        let topImageContainerView = UIView()
        addSubview(topImageContainerView)
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        topImageContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topImageContainerView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        topImageContainerView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        
        
        topImageContainerView.addSubview(bearImageView)
        bearImageView.centerXAnchor.constraint(equalTo:  topImageContainerView.centerXAnchor).isActive = true
        bearImageView.centerYAnchor.constraint(equalTo:  topImageContainerView.centerYAnchor).isActive = true
        bearImageView.heightAnchor.constraint(equalTo:  topImageContainerView.heightAnchor , multiplier: 0.5).isActive = true
        
        
        addSubview(discriptionTextView)
        discriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        discriptionTextView.leftAnchor.constraint(equalTo: leftAnchor, constant: 24).isActive = true
        discriptionTextView.rightAnchor.constraint(equalTo: rightAnchor, constant: -24).isActive = true
        discriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
