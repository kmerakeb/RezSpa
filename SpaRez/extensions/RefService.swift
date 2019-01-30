//
//  RefService.swift
//  SpaRez
//
//  Created by apple on 7/7/18.
//  Copyright © 2018 merakeb. All rights reserved.
//

import Foundation
import Firebase

let DB_ref = Database.database().reference()

class RefService {
    static let instance = RefService()
    
    private var _ref_base = DB_ref
    private var _ref_users = DB_ref.child("users")
    private var _ref_businesses = DB_ref.child("businesses")
    private var _ref_services = DB_ref.child("services")
    private var _ref_books = DB_ref.child("books")
    private var _ref_feeds = DB_ref.child("feeds")
    
    var REF_BASE: DatabaseReference {
        return _ref_base
    }
    var REF_USERS: DatabaseReference {
        return _ref_users
    }
    
    var REF_BUSINESSES: DatabaseReference {
        return _ref_businesses
    }
    var REF_SERVICES: DatabaseReference {
        return _ref_services
    }
    var REF_BOOKS: DatabaseReference {
        return _ref_books
    }
    var REF_FEEDS: DatabaseReference {
        return _ref_feeds
    }
    
    func createDBUser(uid: String, userData: Dictionary<String, Any>) {
        REF_USERS.child(uid).updateChildValues(userData)
    }
    
    func getAllBusinesses(handler: @escaping (_ businesses: [Business]) ->()) {
        var businessArray = [Business]()
        
        REF_BUSINESSES.observeSingleEvent(of: .value) { (businessSnapShot) in
            guard let businessSnapShot = businessSnapShot.children.allObjects as? [DataSnapshot] else { return }
            for business in businessSnapShot {
                let businessName = business.childSnapshot(forPath: "businessName").value as! String
                let businessCategory = business.childSnapshot(forPath: "businessCategory").value as! String
                let businessStreet = business.childSnapshot(forPath: "businessStreet").value as! String
                let businessCity = business.childSnapshot(forPath: "businessCity").value as! String
                let businessState = business.childSnapshot(forPath: "businessState").value as! String
                let businessPhone = business.childSnapshot(forPath: "businessPhone").value as! String
                let businessLogo = business.childSnapshot(forPath: "businessImage").value as! String?
                let business = Business(businessName: businessName, businessCategory: businessCategory, businessStreet: businessStreet, businessState: businessState, businessCity: businessCity, businessPhone: businessPhone, businessLogo: businessLogo)
                businessArray.append(business)
            }
            handler(businessArray)
        }
    }
    
    
    func getAllServices(handler: @escaping (_ services: [Service]) ->()) {
        var serviceArray = [Service]()
        
        REF_SERVICES.observeSingleEvent(of: .value) { (serviceSnapShot) in
            guard let serviceSnapShot = serviceSnapShot.children.allObjects as? [DataSnapshot] else { return }
            for service in serviceSnapShot {
                let serviceName = service.childSnapshot(forPath: "serviceName").value as! String
                let servicePrice = service.childSnapshot(forPath: "servicePrice").value as! String
                let serviceDuration = service.childSnapshot(forPath: "serviceDuration").value as! String
                let serviceLogo = service.childSnapshot(forPath: "serviceImage").value as! String?
                let service = Service(serviceName: serviceName, serviceDuration: serviceDuration, servicePrice: servicePrice, serviceLogo: serviceLogo)
                serviceArray.append(service)
            }
            handler(serviceArray)
        }
    }
    
    func getUsername(forUID uid: String, handler: @escaping (_ username: String) -> ()) {
        REF_USERS.observeSingleEvent(of: .value) { (userSnapshot) in
            guard let userSnapshot = userSnapshot.children.allObjects as? [DataSnapshot] else { return }
            for user in userSnapshot {
                if user.key == uid {
                    handler(user.childSnapshot(forPath: "email").value as! String)
                }
            }
        }
    }
    
    
    func uploadFeeds(withMessage feed: String, forUID uid: String, sendComplete: @escaping (_ status: Bool) ->()) {
        REF_FEEDS.childByAutoId().updateChildValues(["content": feed, "senderId": uid])
        sendComplete(true)
    }
    
    func getAllFeeds(handler: @escaping (_ feeds: [Feed]) ->()) {
        var feedArray = [Feed]()
        REF_FEEDS.observeSingleEvent(of: .value) { (feedSnapShot) in
            guard let feedSnapShot = feedSnapShot.children.allObjects as? [DataSnapshot] else { return }
            for feed in feedSnapShot {
                let content = feed.childSnapshot(forPath: "content").value as! String
                let senderId = feed.childSnapshot(forPath: "senderId").value as! String
                let feed = Feed(content: content, senderId: senderId)
                feedArray.append(feed)
            }
            handler(feedArray)
        }
    }
    

}
