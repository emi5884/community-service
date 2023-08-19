//
//  UploadController.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/06/12.
//

import UIKit

class UploadController: UIViewController {
    
    // MARK: - Property
    
    private var selectedImages: [UIImage]?
    
    lazy var pageView = PageView(frame: .zero, images: selectedImages ?? [])
    private let categoryView = ButtonsCategoryView(frame: .zero, category: shareCategory)
    
    private lazy var titleTextView: UITextView = {
        let tv = UITextView()
        tv.font = UIFont.boldSystemFont(ofSize: 24)
        tv.textColor = .lightGray
        tv.text = "Title"
        tv.delegate = self
        return tv
    }()
    
    private lazy var captionTextView: UITextView = {
        let tv = UITextView()
        tv.font = UIFont.systemFont(ofSize: 16)
        tv.textColor = .lightGray
        tv.text = "caption..."
        tv.delegate = self
        tv.layer.borderColor = UIColor.lightGray.cgColor
        tv.layer.borderWidth = 1
        tv.layer.cornerRadius = 10
        tv.contentInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        return tv
    }()
    
    // MARK: - lifecycle
    
//    init(selectedImages: [UIImage] = []) {
//        self.selectedImages = selectedImages
//
//        super.init(nibName: nil, bundle: nil)
//    }
    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Action
    
    func configureUI() {
        view.backgroundColor = .white
        navigationController?.navigationBar.backgroundColor = .white
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(didTapCancelButton))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "share", style: .done, target: self, action: #selector(didTapShareButton))
        
        view.addSubview(pageView)
        pageView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                        left: view.leftAnchor,
                        right: view.rightAnchor)
        pageView.setHeight(240)
        
        view.addSubview(categoryView)
        categoryView.anchor(top: pageView.bottomAnchor, left: view.leftAnchor,
                            right: view.rightAnchor, paddingTop: 10)
        categoryView.setHeight(40)
        
        view.addSubview(titleTextView)
        titleTextView.anchor(top: categoryView.bottomAnchor,
                             left: view.leftAnchor,
                             right: view.rightAnchor,
                             paddingTop: 30,
                             paddingLeft: 10,
                             paddingRight: 10)
        titleTextView.setHeight(45)
        
        let bottomBorder = UIView()
        bottomBorder.backgroundColor = .gray
        view.addSubview(bottomBorder)
        bottomBorder.anchor(left: titleTextView.leftAnchor,
                            bottom: titleTextView.bottomAnchor,
                            right: titleTextView.rightAnchor)
        bottomBorder.setHeight(0.5)
        
        view.addSubview(captionTextView)
        captionTextView.anchor(top: titleTextView.bottomAnchor,
                               left: titleTextView.leftAnchor,
                               right: titleTextView.rightAnchor,
                               paddingTop: 20)
        captionTextView.setHeight(200)
    }
    
    @objc func didTapCancelButton() {
        dismiss(animated: true)
    }
    
    @objc func didTapShareButton() {
        
    }
}

// MARK: - UITextViewDelegate

extension UploadController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == .lightGray {
            textView.text = nil
            textView.textColor = .black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = textView == titleTextView ? "Title" : "caption"
            textView.textColor = .lightGray
        }
    }
}
