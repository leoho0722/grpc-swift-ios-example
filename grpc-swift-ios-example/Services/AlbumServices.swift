//
//  AlbumServices.swift
//  grpc-swift-ios-example
//
//  Created by Leo Ho on 2023/12/22.
//

import Foundation
import GRPC

struct AlbumServices {
    
    /// Album gRPC Services Client
    private let client: Album_AlbumServiceAsyncClient = {
        let group = PlatformSupport.makeEventLoopGroup(loopCount: 1)
        let configuration = GRPCChannelPool.Configuration.with(target: .host("localhost", port: 50051),
                                                               transportSecurity: .plaintext,
                                                               eventLoopGroup: group)
        let channel = try! GRPCChannelPool.with(configuration: configuration)
        let client = Album_AlbumServiceAsyncClient(channel: channel)
        return client
    }()
    
    /// Create Album with gRPC Services
    /// - Parameters:
    ///   - album: ``Album``
    func createAlbum(album: Album) async throws {
        var request = Album_CreateAlbumRequest()
        request.album.id = album.id
        request.album.title = album.title
        request.album.artist = album.artist
        request.album.releaseDate = album.releaseDate
        let _ = try await client.createAlbum(request)
    }
    
    /// Get Album through id with gRPC Services
    /// - Parameters:
    ///   - id: Specify the id of the ``Album``
    /// - Returns: ``Album``
    func getAlbum(id: String) async throws -> Album {
        var request = Album_GetAlbumRequest()
        request.id = id
        let response = try await client.getAlbum(request)
        return Album(id: response.album.id,
                     title: response.album.title,
                     artist: response.album.artist,
                     releaseDate: response.album.releaseDate)
    }
    
    /// Get All Album with gRPC Services
    /// - Returns: Array of ``Album``
    func getAlbums() async throws -> [Album] {
        let request = Album_GetAlbumsRequest()
        let response = try await client.getAlbums(request)
        var albums: [Album] = []
        response.albums.forEach { album in
            albums.append(Album(id: album.id,
                                title: album.title,
                                artist: album.artist,
                                releaseDate: album.releaseDate))
        }
        return albums
    }
}
