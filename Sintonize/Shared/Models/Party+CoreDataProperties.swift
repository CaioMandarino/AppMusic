//
//  Party+CoreDataProperties.swift
//  Sintonize
//
//  Created by Raquel Souza on 02/07/25.
//
//

import Foundation
import CoreData


extension Party {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Party> {
        return NSFetchRequest<Party>(entityName: "Party")
    }

    @NSManaged public var partyName: String?
    @NSManaged public var partyDate: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var musics: NSSet?
    
    public var musicArray: [MusicItem] {
        let musicSet: Set<MusicItem> = musics as? Set<MusicItem> ?? []
        return musicSet.sorted { $0.likes > $1.likes }
    }
    
}




// MARK: Generated accessors for musics
extension Party {

    @objc(addMusicsObject:)
    @NSManaged public func addToMusics(_ value: MusicItem)

    @objc(removeMusicsObject:)
    @NSManaged public func removeFromMusics(_ value: MusicItem)

    @objc(addMusics:)
    @NSManaged public func addToMusics(_ values: NSSet)

    @objc(removeMusics:)
    @NSManaged public func removeFromMusics(_ values: NSSet)

}

extension Party : Identifiable {

}
