//
//  AlbumListViewController.swift
//  grpc-swift-ios-example
//
//  Created by Leo Ho on 2023/12/22.
//

import SwiftHelpers
import UIKit

class AlbumListViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var tvAlbum: UITableView!
    
    // MARK: - Properties
    
    private var albumList: [Album] = []
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchAlbums()
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
        title = "Album List"
        setupRightBarButtonItems()
        setupTableView()
    }
    
    fileprivate func setupRightBarButtonItems() {
        let addItem = UIBarButtonItem(image: UIImage(symbols: .plusCircle),
                                      style: .done,
                                      target: self,
                                      action: #selector(addAlbum(sender:)))
        navigationItem.rightBarButtonItems = [addItem]
    }
    
    fileprivate func setupTableView() {
        tvAlbum.register(AlbumListTableViewCell.loadFromNib(),
                         forCellReuseIdentifier: AlbumListTableViewCell.identifier)
        tvAlbum.dataSource = self
        tvAlbum.delegate = self
    }
    
    // MARK: - IBAction
    
    
    
    // MARK: - Functions
    
    @objc func addAlbum(sender: UIBarButtonItem) {
        let nextVC = AddAlbumViewController()
        if let sheetPC = nextVC.sheetPresentationController {
            sheetPC.detents = [.medium()]
            sheetPC.prefersGrabberVisible = true
        }
        present(nextVC, animated: true)
    }
    
    private func fetchAlbums() {
        Task {
            do {
                let services = AlbumServices()
                albumList = try await services.getAlbums()
                await MainActor.run {
                    tvAlbum.reloadData()
                }
            } catch {
                print(error)
            }
        }
    }
}

// MARK: - Extensions

// MARK: UITableViewDataSource

extension AlbumListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albumList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AlbumListTableViewCell.identifier,
                                                       for: indexPath) as? AlbumListTableViewCell else {
            fatalError("AlbumListTableViewCell Load Failed")
        }
        cell.setInit(name: albumList[indexPath.row].title,
                     artist: albumList[indexPath.row].artist,
                     releaseDate: albumList[indexPath.row].releaseDate)
        return cell
    }
}

// MARK: UITableViewDelegate

extension AlbumListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}

// MARK: - Protocol



// MARK: - Previews

@available(iOS 17.0, *)
#Preview {
    AlbumListViewController()
}
