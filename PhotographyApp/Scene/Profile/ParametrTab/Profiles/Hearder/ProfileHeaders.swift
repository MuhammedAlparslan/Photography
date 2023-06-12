//
//  ProfileHeaders.swift
//  PhotographyApp
//
//  Created by Alparslan Cafer on 11.06.2023.
//

import UIKit
import FirebaseAuth
import SDWebImage

class ProfileHeaders: UICollectionReusableView {
    
    //    MARK: - Proporties
    
    var user: ProfileUser? {
        didSet { configureUI() }
    }
    
    private let filterBar = ProfileFilteriew()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .purple
        
        view.addSubview(backButton)
        backButton.anchor(top: view.topAnchor, left: view.leftAnchor,
                          paddingTop: 42, paddingLeft: 16)
        backButton.setDimensions(width: 30, height: 30)
        return view
        
    }()
    
    
    private lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "BackButton")?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(handleBackButton), for: .touchUpInside)
        return button
        
    }()
    
    private lazy var profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.backgroundColor = .lightGray
        iv.layer.borderColor = UIColor.white.cgColor
        iv.layer.borderWidth = 4
        return iv
    }()
    
    
    
    private lazy var editProfileFollowButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Follow", for: .normal)
        button.layer.borderColor = UIColor.twitterBlue.cgColor
        button.layer.borderWidth = 1.25
        button.setTitleColor(.twitterBlue, for: .normal)
        button.titleLabel?.font =  UIFont.boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(handleFollowButton), for: .touchUpInside)

        return button
        
    }()
    
    private let fullnameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "Muhammad Alparslan"
        return label
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .lightGray
        label.text = "@ragnar"
        return label
    }()
    
    private let bioLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 5
        label.text = "Nature Reserve - NEOM, Saudi Arabia | The NEOM Nature Reserve region is being designed to deliver protection and restoration of biodiversity across 95% of NEOM."
        return label
    }()
    
    private let followingLabel: UILabel = {
        let label = UILabel()
        label.text = "100 Following"
        return label
    }()
    
    private let followersLabel: UILabel = {
        let label = UILabel()
        label.text = "1004 Followers"
        return label
    }()
    
    private let underLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .twitterBlue
        return view
    }()
    
    
    //    MARK: - LifeCycle
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
       
        filterBar.delegate = self
        
        addSubview(containerView)
        containerView.anchor(top: topAnchor, left: leftAnchor,
                             right: rightAnchor, height: 108)
        
        addSubview(profileImageView)
        profileImageView.anchor(top: containerView.bottomAnchor,
                                left: leftAnchor, paddingTop: -24, paddingLeft: 8 )
        profileImageView.setDimensions(width: 80, height: 80)
        profileImageView.layer.cornerRadius = 80 / 2
        
        addSubview(editProfileFollowButton)
        editProfileFollowButton.anchor(top: containerView.bottomAnchor,
                                       right: rightAnchor, paddingTop: 12, paddingRight: 12)
        
        editProfileFollowButton.setDimensions(width: 100, height: 36)
        editProfileFollowButton.layer.cornerRadius = 36 / 2
        
        let userDetailsStack = UIStackView(arrangedSubviews: [fullnameLabel,
                                                              usernameLabel,
                                                              bioLabel])
        
        userDetailsStack.axis = .vertical
        userDetailsStack.distribution = .fillProportionally
        userDetailsStack.spacing = 4
        
        addSubview(userDetailsStack)
        userDetailsStack.anchor(top: profileImageView.bottomAnchor, left: leftAnchor,
                                right: rightAnchor, paddingTop: 8, paddingLeft: 12, paddingRight: 12)
        
    
        addSubview(filterBar)
        filterBar.anchor(left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, height:  50)
        
        addSubview(underLineView)
        underLineView.anchor(left: leftAnchor, bottom: bottomAnchor, width: frame.width / 3, height: 2)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //    MARK: - Selector
    
    @objc func handleBackButton() {
        
    }
    
    @objc func handleFollowButton() {
       
        
    }
    
    
    //    MARK: - Helper
    
    func configureUI() {
        guard let user = user else { return }
        
        let viewModel = ProfileImageViewModel(user: user)
        
        followersLabel.attributedText = viewModel.followersString
        followingLabel.attributedText = viewModel.followingString
        usernameLabel.text = user.username
        
        profileImageView.sd_setImage(with: user.profileImage)

    }
}
    
   
//MARK: - Extension

extension ProfileHeaders: FilterCellDelegate {
    func filterView(_ view: ProfileFilteriew, didselect indexPath: IndexPath) {
        guard let cell = view.collectionView.cellForItem(at: indexPath) as? FilterCell else { return }
        
        let xPosition = cell.frame.origin.x
        UIView.animate(withDuration: 0.3) {
            self.underLineView.frame.origin.x = xPosition
        }
        
    }
    
    
}