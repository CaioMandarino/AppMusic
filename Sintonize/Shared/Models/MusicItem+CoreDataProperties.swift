//
//  MusicItem+CoreDataProperties.swift
//  Sintonize
//
//  Created by Raquel Souza on 04/07/25.
//
//

import Foundation
import CoreData


extension MusicItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MusicItem> {
        return NSFetchRequest<MusicItem>(entityName: "MusicItem")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var imageURL: String?
    @NSManaged public var likes: Int32
    @NSManaged public var musicArtist: String?
    @NSManaged public var musicDuraction: Int16
    @NSManaged public var musicName: String?
    @NSManaged public var musicVoted: Bool
    @NSManaged public var party: Party?

}

extension MusicItem : Identifiable {

}
