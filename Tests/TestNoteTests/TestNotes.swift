//
//  TestNotes.swift
//  
//
//  Created by David Carlson on 7/30/23.
//

import TestNote
import SwiftData
import XCTest
@testable import TestNote

class TestNotes: TestSwiftData {
	
	func testCreateNotes() throws {
		guard let context = modelContext else {
			throw TestError.failed("ModelContext not initialized")
		}
		let note1 = Note(content: "This is a sample journal note")
		let note2 = Note(content: "Only one cup of coffee today.")
		let note3 = Note(title: "Sleep Quality", content: "Slept 7 and a half hours last night.")
		context.insert(note1)
		context.insert(note2)
		context.insert(note3)
		try context.save()
		
		let notesDescriptor = FetchDescriptor<Note>()
		let notes = try context.fetch(notesDescriptor)
		XCTAssertEqual(notes.count, 3)
	}
	
	func testNoteUpdate() throws {
		guard let context = modelContext else {
			throw TestError.failed("ModelContext not initialized")
		}
		let note = Note(content: "Went for a bike ride this morning!")
		context.insert(note)
		try context.save()
		
		let initialUpdated = note.updatedDate
		
		let notesDescriptor = FetchDescriptor<Note>()
		let notes = try context.fetch(notesDescriptor)
		let fetchedNote = notes.first!
		fetchedNote.content = "Took 30 mile ride this morning."
		try context.save()
		
		let updatedNotes = try context.fetch(notesDescriptor)
		XCTAssertEqual(updatedNotes.count, 1)
		XCTAssertGreaterThan(updatedNotes.first!.updatedDate, initialUpdated)
	}
}
