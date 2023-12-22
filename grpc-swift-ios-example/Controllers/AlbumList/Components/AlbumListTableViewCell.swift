//
//  AlbumListTableViewCell.swift
//  grpc-swift-ios-example
//
//  Created by Leo Ho on 2023/12/22.
//

import UIKit

class AlbumListTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var lbAlbumName: UILabel!
    @IBOutlet weak var lbAlbumArtist: UILabel!
    @IBOutlet weak var lbAlbumReleaseDate: UILabel!
    
    // MARK: - Properties
    
    static let identifier = "AlbumListTableViewCell"
    
    // MARK: - LifeCycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - UI Settings
    
    func setInit(name: String, artist: String, releaseDate: String) {
        setupLabel(name: name, artist: artist, releaseDate: releaseDate)
    }
    
    fileprivate func setupLabel(name: String, artist: String, releaseDate: String) {
        lbAlbumName.text = name
        lbAlbumArtist.text = artist
        lbAlbumReleaseDate.text = releaseDate
    }
    
    // MARK: - IBAction
    
}

// MARK: - Extensions



// MARK: - Protocol


