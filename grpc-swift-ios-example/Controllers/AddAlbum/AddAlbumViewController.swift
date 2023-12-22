//
//  AddAlbumViewController.swift
//  grpc-swift-ios-example
//
//  Created by Leo Ho on 2023/12/22.
//

import UIKit

class AddAlbumViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var txfAlbumName: UITextField!
    @IBOutlet weak var txfAlbumArtist: UITextField!
    @IBOutlet weak var lbReleaseDate: UILabel!
    @IBOutlet weak var dpkReleaseDate: UIDatePicker!
    @IBOutlet weak var btnCreate: UIButton!
    
    // MARK: - Properties
    
    
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    // MARK: - UI Settings
    
    fileprivate func setupUI() {
        setupTextFields()
        setupLabel()
        setupDatePicker()
        setupButton()
    }
    
    fileprivate func setupTextFields() {
        txfAlbumName.placeholder = "Please input album'name..."
        txfAlbumArtist.placeholder = "Please input album's artist..."
    }
    
    fileprivate func setupLabel() {
        lbReleaseDate.text = "Release Date"
    }
    
    fileprivate func setupDatePicker() {
        dpkReleaseDate.maximumDate = Date()
    }
    
    fileprivate func setupButton() {
        btnCreate.setTitle("Create", for: .normal)
    }
    
    // MARK: - IBAction
    
    @IBAction func btnCreateClicked(_ sender: UIButton) {
        guard let albumName = txfAlbumName.text, !albumName.isEmpty else {
            return
        }
        guard let albumArtist = txfAlbumArtist.text, !albumArtist.isEmpty else {
            return
        }
        let releaseDate = dpkReleaseDate.date.formatted(dateFormat: "YYYY-MM-dd")
        print(albumName)
        print(albumArtist)
        print(releaseDate)
        let album = Album(title: albumName,
                          artist: albumArtist,
                          releaseDate: releaseDate)
        create(album: album)
    }
    
    // MARK: - Functions
    
    private func create(album: Album) {
        Task {
            do {
                let services = AlbumServices()
                try await services.createAlbum(album: album)
                dismiss(animated: true)
            } catch {
                print(error)
            }
        }
    }
}

// MARK: - Extensions



// MARK: - Protocol



// MARK: - Previews

@available(iOS 17.0, *)
#Preview {
    AddAlbumViewController()
}
