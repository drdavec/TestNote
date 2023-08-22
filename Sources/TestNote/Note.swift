//
//  Note.swift
//  
//
//  Created by David Carlson on 7/30/23.
//

import Foundation
import SwiftData

@Model
public final class Note {
	public var id: UUID
	
	public var createdDate: Date
	
	public var updatedDate: Date
	
	public var title: String?
	
	public var content: String?
	
	public init(title: String? = nil, content: String) {
		self.id = UUID()
		self.createdDate = Date()
		self.updatedDate = Date()
		self.title = title
		self.content = content
	}
}
