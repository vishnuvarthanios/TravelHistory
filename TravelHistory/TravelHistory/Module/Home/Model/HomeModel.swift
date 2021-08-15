//
//  HomeModel.swift
//  TravelHistory
//
//  Created by Vishnuvarthan Deivendiran on 15/08/21.
//

import Foundation
import SwiftyJSON

class LocationRootClass {

    var results : [Result]!
    var status : String!

    init(fromJson json: JSON!){
        if json == nil{
            return
        }
        results = [Result]()
        let resultsArray = json["results"].arrayValue
        for resultsJson in resultsArray{
            let value = Result(fromJson: resultsJson)
            results.append(value)
        }
        status = json["status"].stringValue
    }
}

class Result{

    var businessStatus : String!
    var geometry : Geometry!
    var icon : String!
    var iconBackgroundColor : String!
    var iconMaskBaseUri : String!
    var name : String!
    var openingHours : OpeningHour!
    var photos : [Photo]!
    var placeId : String!
    var priceLevel : Int!
    var rating : Float!
    var reference : String!
    var scope : String!
    var types : [String]!
    var userRatingsTotal : Int!
    var vicinity : String!


    init(fromJson json: JSON!){
        if json == nil{
            return
        }
        businessStatus = json["business_status"].stringValue
        let geometryJson = json["geometry"]
        if geometryJson != JSON.null{
            geometry = Geometry(fromJson: geometryJson)
        }
        icon = json["icon"].stringValue
        iconBackgroundColor = json["icon_background_color"].stringValue
        iconMaskBaseUri = json["icon_mask_base_uri"].stringValue
        name = json["name"].stringValue
        let openingHoursJson = json["opening_hours"]
        if openingHoursJson != JSON.null{
            openingHours = OpeningHour(fromJson: openingHoursJson)
        }
        photos = [Photo]()
        let photosArray = json["photos"].arrayValue
        for photosJson in photosArray{
            let value = Photo(fromJson: photosJson)
            photos.append(value)
        }
        placeId = json["place_id"].stringValue
        priceLevel = json["price_level"].intValue
        rating = json["rating"].floatValue
        reference = json["reference"].stringValue
        scope = json["scope"].stringValue
        types = [String]()
        let typesArray = json["types"].arrayValue
        for typesJson in typesArray{
            types.append(typesJson.stringValue)
        }
        userRatingsTotal = json["user_ratings_total"].intValue
        vicinity = json["vicinity"].stringValue
    }
}

class Photo{

    var height : Int!
    var htmlAttributions : [String]!
    var photoReference : String!
    var width : Int!

    init(fromJson json: JSON!){
        if json == nil{
            return
        }
        height = json["height"].intValue
        htmlAttributions = [String]()
        let htmlAttributionsArray = json["html_attributions"].arrayValue
        for htmlAttributionsJson in htmlAttributionsArray{
            htmlAttributions.append(htmlAttributionsJson.stringValue)
        }
        photoReference = json["photo_reference"].stringValue
        width = json["width"].intValue
    }

}

class OpeningHour{

    var openNow : Bool!

    init(fromJson json: JSON!){
        if json == nil{
            return
        }
        openNow = json["open_now"].boolValue
    }
}

class Location{

    var lat : Float!
    var lng : Float!

    init(fromJson json: JSON!){
        if json == nil{
            return
        }
        lat = json["lat"].floatValue
        lng = json["lng"].floatValue
    }
}

class Geometry{

    var location : Location!

    init(fromJson json: JSON!){
        if json == nil{
            return
        }
        let locationJson = json["location"]
        if locationJson != JSON.null{
            location = Location(fromJson: locationJson)
        }
    }
}
