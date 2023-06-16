//
//  ProfileHeaders.swift
//  PhotographyApp
//
//  Created by Alparslan Cafer on 11.06.2023.
//

import UIKit
import SDWebImage
import FirebaseStorage
import FirebaseDatabase


protocol ProfileHearderDelegate: AnyObject {
    func handleDismissal()
}

class ProfileHeaders: UICollectionReusableView {
    
    //        MARK: - Proporties
    
    
    var user: ProfileUser? {
        didSet {
            configureUI()
        }
    }
    
    
    private let filterBar = ProfileFilteriew()
    
    weak var delegate: ProfileHearderDelegate?
    
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
    
    
    private let fullnameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .lightGray
        return label
    }()
    
    private let bioLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 5
        label.text = "I’m a IOS Developer, not a miracle worker…yet 🧙‍♂️👨‍💻."
        return label
    }()
    
    private let followingLabel: UILabel = {
        let label = UILabel()
        let followTab = UITapGestureRecognizer(target: self, action: #selector(handleFollowingButton))
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(followTab)
        return label
    }()
    
    private let followersLabel: UILabel = {
        let label = UILabel()
        let followTab = UITapGestureRecognizer(target: self, action: #selector(handleFollowersButton))
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(followTab)
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
        
        
        
        let userDetailsStack = UIStackView(arrangedSubviews: [fullnameLabel,
                                                              usernameLabel,
                                                              bioLabel])
        
        userDetailsStack.axis = .vertical
        userDetailsStack.distribution = .fillProportionally
        userDetailsStack.spacing = 4
        
        addSubview(userDetailsStack)
        userDetailsStack.anchor(top: profileImageView.bottomAnchor, left: leftAnchor,
                                right: rightAnchor, paddingTop: 8, paddingLeft: 12, paddingRight: 12)
        
        let followStack = UIStackView(arrangedSubviews: [followersLabel, followingLabel])
        followStack.axis = .horizontal
        followStack.spacing = 8
        followStack.distribution = .fillEqually
        
        addSubview(followStack)
        followStack.anchor(top: userDetailsStack.bottomAnchor, left: leftAnchor,
                           paddingTop: 8, paddingLeft: 12)
        
        
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
        delegate?.handleDismissal()
        
    }
    
    
    @objc func handleFollowButton() {
        
        
    }
    
    @objc func handleFollowingButton() {
        
        
    }
    
    @objc func handleFollowersButton() {
        
        
    }
    
    //    MARK: - Helper
    
    func configureUI() {

        guard let user = user else { return }
        
        
        let viewModel = FollowViewModel(user: user)
        
        followersLabel.attributedText = viewModel.followersString
        followingLabel.attributedText = viewModel.followingString
        
        usernameLabel.text = String("@ \(user.username)")
        fullnameLabel.text = user.fullname
        
        profileImageView.loadUrl(user.profileImage)
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
