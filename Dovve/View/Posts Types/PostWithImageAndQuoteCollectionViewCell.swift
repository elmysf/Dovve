//
//  PostWithImageAndQuoteCollectionViewCell.swift
//  Dovve
//
//  Created by Dheeraj Kumar Sharma on 22/09/20.
//  Copyright © 2020 Dheeraj Kumar Sharma. All rights reserved.
//

import UIKit

class PostWithImageAndQuoteCollectionViewCell: UICollectionViewCell {
   
    var data:SimpleTextedPost?{
        didSet{
            manageData()
        }
    }
    
    var quotedViewHeightContraints:NSLayoutConstraint?
    
    let userProfileImage:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.backgroundColor = .lightGray
        img.layer.cornerRadius = 25
        return img
    }()
    
    let userInfo:UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    let tweet:UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont(name: CustomFonts.appFont, size: 17)
        l.textColor = UIColor.dynamicColor(.textColor)
        l.numberOfLines = 0
        return l
    }()
    
    lazy var collectionView:UICollectionView = {
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsVerticalScrollIndicator = false
        cv.setCollectionViewLayout(layout, animated: false)
        cv.backgroundColor = UIColor.dynamicColor(.appBackground)
        cv.layer.cornerRadius = 15
        cv.layer.borderWidth = 0.7
        cv.delegate = self
        cv.dataSource = self
        cv.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: "ImageCollectionViewCell")
        cv.layer.borderColor = UIColor.dynamicColor(.secondaryBackground).cgColor
        return cv
    }()
    
    lazy var quotedView:CustomQuotedView = {
        let v = CustomQuotedView()
        v.delegate2 = self
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.cornerRadius = 15
        v.layer.borderColor = UIColor.dynamicColor(.secondaryBackground).cgColor
        v.layer.borderWidth = 0.7
        return v
    }()
    
    let stackView:UIStackView = {
        let v = UIStackView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.spacing = 10
        v.distribution = .fillEqually
        v.axis = .horizontal
        return v
    }()
    
    //MARK:- Comment View
    let commentView:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .clear
        return v
    }()
    
    let commentImage:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named:"comment")
        return img
    }()
    
    let commentLabel:UILabel = {
        let l = UILabel()
        l.text = "34"
        l.font = UIFont(name: "HelveticaNeue", size: 15)
        l.textColor = CustomColors.appDarkGray
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    //MARK:- Retweet View
    
    let retweetView:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let retweetImage:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named:"retweet")
        return img
    }()
    
    let retweetLabel:UILabel = {
        let l = UILabel()
        l.text = "34"
        l.font = UIFont(name: "HelveticaNeue", size: 15)
        l.textColor = CustomColors.appDarkGray
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    //MARK:- Like View
    
    let likeView:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let likeImage:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named:"heart")
        return img
    }()
    
    let likeLabel:UILabel = {
        let l = UILabel()
        l.text = "34"
        l.font = UIFont(name: "HelveticaNeue", size: 15)
        l.textColor = CustomColors.appDarkGray
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    //MARK:- Share View
    
    let shareView:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let shareImage:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named:"share")
        return img
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.dynamicColor(.appBackground)
        addSubview(userProfileImage)
        addSubview(userInfo)
        addSubview(tweet)
        addSubview(collectionView)
        addSubview(quotedView)
        addSubview(stackView)
        stackView.addArrangedSubview(commentView)
        commentView.addSubview(commentImage)
        commentView.addSubview(commentLabel)
        
        stackView.addArrangedSubview(retweetView)
        retweetView.addSubview(retweetImage)
        retweetView.addSubview(retweetLabel)
        
        stackView.addArrangedSubview(likeView)
        likeView.addSubview(likeImage)
        likeView.addSubview(likeLabel)
        
        stackView.addArrangedSubview(shareView)
        shareView.addSubview(shareImage)
        
        setUpConstraints()
    }
    
    func setUpConstraints(){
        
        NSLayoutConstraint.activate([
            userProfileImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            userProfileImage.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            userProfileImage.widthAnchor.constraint(equalToConstant: 50),
            userProfileImage.heightAnchor.constraint(equalToConstant: 50),
            
            userInfo.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            userInfo.leadingAnchor.constraint(equalTo: userProfileImage.trailingAnchor , constant: 10),
            userInfo.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            userInfo.heightAnchor.constraint(equalToConstant: 20),
            
            tweet.topAnchor.constraint(equalTo: userInfo.bottomAnchor, constant: 5),
            tweet.leadingAnchor.constraint(equalTo: userProfileImage.trailingAnchor, constant: 10),
            tweet.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            tweet.bottomAnchor.constraint(equalTo: collectionView.topAnchor, constant: -10),
            
            collectionView.leadingAnchor.constraint(equalTo: userProfileImage.trailingAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            collectionView.bottomAnchor.constraint(equalTo: quotedView.topAnchor, constant: -10),
            //Fixed Height of ratio 16:9 of a Width.
            collectionView.heightAnchor.constraint(equalToConstant: (self.frame.width - 100) * (9/16)),
            
            quotedView.leadingAnchor.constraint(equalTo: userProfileImage.trailingAnchor, constant: 10),
            quotedView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            quotedView.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: -10),
            
            stackView.leadingAnchor.constraint(equalTo: userProfileImage.trailingAnchor, constant: 10),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            stackView.heightAnchor.constraint(equalToConstant: 30),
            
            commentImage.leadingAnchor.constraint(equalTo: commentView.leadingAnchor),
            commentImage.centerYAnchor.constraint(equalTo: commentView.centerYAnchor),
            commentImage.widthAnchor.constraint(equalToConstant: 20),
            commentImage.heightAnchor.constraint(equalToConstant: 20),
            
            commentLabel.leadingAnchor.constraint(equalTo: commentImage.trailingAnchor, constant: 6),
            commentLabel.centerYAnchor.constraint(equalTo: commentView.centerYAnchor),
            
            retweetImage.leadingAnchor.constraint(equalTo: retweetView.leadingAnchor),
            retweetImage.centerYAnchor.constraint(equalTo: retweetView.centerYAnchor),
            retweetImage.widthAnchor.constraint(equalToConstant: 20),
            retweetImage.heightAnchor.constraint(equalToConstant: 20),
            
            retweetLabel.leadingAnchor.constraint(equalTo: retweetImage.trailingAnchor, constant: 6),
            retweetLabel.centerYAnchor.constraint(equalTo: retweetView.centerYAnchor),
            
            likeImage.leadingAnchor.constraint(equalTo: likeView.leadingAnchor),
            likeImage.centerYAnchor.constraint(equalTo: likeView.centerYAnchor),
            likeImage.widthAnchor.constraint(equalToConstant: 20),
            likeImage.heightAnchor.constraint(equalToConstant: 20),
            
            likeLabel.leadingAnchor.constraint(equalTo: likeImage.trailingAnchor, constant: 6),
            likeLabel.centerYAnchor.constraint(equalTo: likeView.centerYAnchor),
            
            shareImage.leadingAnchor.constraint(equalTo: shareView.leadingAnchor),
            shareImage.centerYAnchor.constraint(equalTo: shareView.centerYAnchor),
            shareImage.widthAnchor.constraint(equalToConstant: 20),
            shareImage.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
    
    func manageData(){
        guard let data = data else {return}
        userInfo.attributedText = setUserInfoAttributes(data.name, data.screen_name, data.time, data.isVerified)
        tweet.text = data.tweet
        commentLabel.text = data.comments
        retweetLabel.text = data.retweets
        likeLabel.text = data.likes
        
        //Quoted View data
        quotedView.profileImageView.image = UIImage(named: data.quotedStatus.profileImage)
        quotedView.userInfo.attributedText = setUserInfoAttributes(data.quotedStatus.name, data.quotedStatus.screen_name, data.quotedStatus.time, data.quotedStatus.isVerified)
        quotedView.tweet.text = data.quotedStatus.tweet
        
        let font = UIFont(name: CustomFonts.appFont, size: 17)!
        let estimatedH = data.quotedStatus.tweet.height(withWidth: ((self.frame.width - 100) - 30), font: font)
        quotedViewHeightContraints = quotedView.heightAnchor.constraint(equalToConstant: estimatedH + 60)
        quotedViewHeightContraints?.isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PostWithImageAndQuoteCollectionViewCell:UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (data?.media.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
        cell.data = data?.media[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if (data?.media.count) == 1 {
          return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        }
        if (data?.media.count) == 2 || (data?.media.count) == 3 {
          return CGSize(width: ((collectionView.frame.width / 2) - 1), height: collectionView.frame.height)
        }
        if (data?.media.count) == 4{
            return CGSize(width: ((collectionView.frame.width / 2) - 1), height: ((collectionView.frame.height / 2) - 1))
        }
        return CGSize()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
}