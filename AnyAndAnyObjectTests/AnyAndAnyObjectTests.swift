//
//  AnyAndAnyObjectTests.swift
//  AnyAndAnyObjectTests
//
//  Created by E5000855 on 27/06/24.
//
import XCTest
@testable import AnyAndAnyObject

final class AnyAndAnyObjectTests: XCTestCase {

    var viewController: ViewController!

    override func setUpWithError() throws {
        viewController = ViewController()
        viewController.loadViewIfNeeded() // Load the view hierarchy
    }

    override func tearDownWithError() throws {
        viewController = nil
    }

    func testTableViewDataSource() throws {
        viewController.setupData()
        let numberOfRows = viewController.tableView.numberOfRows(inSection: 0)
        XCTAssertEqual(numberOfRows, viewController.arr.count, "Number of rows in table view should match number of elements in arr")
    }

    func testTableViewCellContent() throws {
        viewController.setupData()
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = viewController.tableView.dataSource?.tableView(viewController.tableView, cellForRowAt: indexPath)
        XCTAssertNotNil(cell, "Cell should not be nil")
        XCTAssertEqual(cell?.textLabel?.text, "\"Hello World\"", "Cell text should match the content of the first element in arr")
    }

    func testExample() throws {
        // Additional test examples if needed
    }

    func testPerformanceExample() throws {
        // Performance testing example
        self.measure {
            // Code to measure performance
        }
    }

}
