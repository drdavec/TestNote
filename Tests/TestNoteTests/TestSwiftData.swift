//
//  SwiftDataTests.swift
//  
//
//  Created by David Carlson on 6/26/23.
//
import TestNote
import SwiftData
import XCTest
@testable import TestNote

class TestSwiftData: XCTestCase {
	
	var modelContext: ModelContext?
	
	override func setUpWithError() throws {
		do {
			let modelContainer = try ModelContainer(
				for: Note.self,
				configurations: ModelConfiguration(isStoredInMemoryOnly: true)
			)
			modelContext = ModelContext(modelContainer)
		} catch {
			fatalError("Failed to create sample data container")
		}
	}
	
	override func tearDownWithError() throws {
		modelContext = nil
	}
	
}
