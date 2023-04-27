//
//  YoutubeSearchResponse.swift
//  netflix_clone
//
//  Created by Thien on 27/04/2023.
//

import Foundation

struct YoutubeSearchResponse: Codable {
    let items: [VideoElement]
}

struct VideoElement: Codable {
    let id: IdVideoElement?
}

struct IdVideoElement: Codable {
    let kind: String
    let videoId: String?
}


//items =     (
//            {
//        etag = "Jv_tzoWjjGTJGyHzXm9WwYr4GHU";
//        id =             {
//            kind = "youtube#video";
//            videoId = "bz-favOPk4M";
//        };
//        kind = "youtube#searchResult";
//    },
//            {
//        etag = "XeW53C41sh9-XaaBr8DIhjk7DAg";
//        id =             {
//            kind = "youtube#video";
//            videoId = Vikn3isAFos;
//        };
//        kind = "youtube#searchResult";
//    },
//            {
//        etag = "Opigvo-dxvbHEe7wcEcvAZaFZlk";
//        id =             {
//            kind = "youtube#video";
//            videoId = FaFEs5FJ5sI;
//        };
//        kind = "youtube#searchResult";
//    },
//            {
//        etag = ZTSKEjeRZ9msuWBE66fCA97o9p0;
//        id =             {
//            kind = "youtube#video";
//            videoId = 3e0Khr6LouQ;
//        };
//        kind = "youtube#searchResult";
//    },
//            {
//        etag = "CNb2x_10nN3LMFBibOxO7WlNO6s";
//        id =             {
//            kind = "youtube#playlist";
//            playlistId = "PLGhXv0goTAm19kFQxJdc-xtMIFN0PslEC";
//        };
//        kind = "youtube#searchResult";
//    }
//);
//kind = "youtube#searchListResponse";
//nextPageToken = CAUQAA;
//pageInfo =     {
//    resultsPerPage = 5;
//    totalResults = 1000000;
//};
//regionCode = VN;
//}
