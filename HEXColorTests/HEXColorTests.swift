//
//  HEXColorTests.swift
//  HEXColorTests
//
//  Created by Yuki Nagai on 10/5/15.
//  Copyright © 2015 P.D.Q. All rights reserved.
//

import XCTest
@testable import HEXColor

class HEXColorTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    /*
    Test cases
    * Minimum: 0x00000000
    * Step:    0x12345678
      * Alpha:   0x123456, alpha = 0.5 (3-digit/6-digit)
    * Maximum: 0xFFFFFFFF
    */
    
    // MARK: - Three-digit
    func testThreeDigitMin() {
        let (red, green, blue, alpha) = UIColor(hex3: 0x000).rgba()
        XCTAssertEqual(red, 0)
        XCTAssertEqual(green, 0)
        XCTAssertEqual(blue, 0)
        XCTAssertEqual(alpha, 0xFF)
    }
    
    func testThreeDigitStep() {
        let (red, green, blue, alpha) = UIColor(hex3: 0x123, alpha: 0.5).rgba()
        XCTAssertEqual(red, 0x11)
        XCTAssertEqual(green, 0x22)
        XCTAssertEqual(blue, 0x33)
        XCTAssertEqual(alpha, 0xFF / 2)
    }
    
    func testThreeDigitMax() {
        let (red, green, blue, alpha) = UIColor(hex3: 0xFFF).rgba()
        XCTAssertEqual(red, 0xFF)
        XCTAssertEqual(green, 0xFF)
        XCTAssertEqual(blue, 0xFF)
        XCTAssertEqual(alpha, 0xFF)
    }
    
    // MARK: - Four-digit
    func testFourDigitMin() {
        let (red, green, blue, alpha) = UIColor(hex4: 0x0000).rgba()
        XCTAssertEqual(red, 0)
        XCTAssertEqual(green, 0)
        XCTAssertEqual(blue, 0)
        XCTAssertEqual(alpha, 0)
    }
    
    func testFourDigitStep() {
        let (red, green, blue, alpha) = UIColor(hex4: 0x1234).rgba()
        XCTAssertEqual(red, 0x11)
        XCTAssertEqual(green, 0x22)
        XCTAssertEqual(blue, 0x33)
        XCTAssertEqual(alpha, 0x44)
    }
    
    func testFourDigitMax() {
        let (red, green, blue, alpha) = UIColor(hex4: 0xFFFF).rgba()
        XCTAssertEqual(red, 0xFF)
        XCTAssertEqual(green, 0xFF)
        XCTAssertEqual(blue, 0xFF)
        XCTAssertEqual(alpha, 0xFF)
    }
    
    // MARK: - Six-digit
    func testSixDigitMin() {
        let (red, green, blue, alpha) = UIColor(hex6: 0x000000).rgba()
        XCTAssertEqual(red, 0)
        XCTAssertEqual(green, 0)
        XCTAssertEqual(blue, 0)
        XCTAssertEqual(alpha, 0xFF)
    }
    
    func testSixDigitStep() {
        let (red, green, blue, alpha) = UIColor(hex6: 0x123456, alpha: 0.5).rgba()
        XCTAssertEqual(red, 0x12)
        XCTAssertEqual(green, 0x34)
        XCTAssertEqual(blue, 0x56)
        XCTAssertEqual(alpha, 0xFF / 2)
    }
    
    func testSixDigitMax() {
        let (red, green, blue, alpha) = UIColor(hex6: 0xFFFFFF).rgba()
        XCTAssertEqual(red, 0xFF)
        XCTAssertEqual(green, 0xFF)
        XCTAssertEqual(blue, 0xFF)
        XCTAssertEqual(alpha, 0xFF)
    }
    
    // MARK: - Eight-digit
    func testEightDigitMin() {
        let (red, green, blue, alpha) = UIColor(hex8: 0x00000000).rgba()
        XCTAssertEqual(red, 0)
        XCTAssertEqual(green, 0)
        XCTAssertEqual(blue, 0)
        XCTAssertEqual(alpha, 0)
    }
    
    func testEightDigitStep() {
        let (red, green, blue, alpha) = UIColor(hex8: 0x12345678).rgba()
        XCTAssertEqual(red, 0x12)
        XCTAssertEqual(green, 0x34)
        XCTAssertEqual(blue, 0x56)
        XCTAssertEqual(alpha, 0x78)
    }
    
    func testEightDigitMax() {
        let (red, green, blue, alpha) = UIColor(hex6: 0xFFFFFFFF).rgba()
        XCTAssertEqual(red, 0xFF)
        XCTAssertEqual(green, 0xFF)
        XCTAssertEqual(blue, 0xFF)
        XCTAssertEqual(alpha, 0xFF)
    }
}

extension UIColor {
    private func rgba() -> (red: UInt8, green: UInt8, blue: UInt8, alpha: UInt8) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        return (toUInt8(red), toUInt8(green), toUInt8(blue), toUInt8(alpha))
    }
}

private func toUInt8(value: CGFloat) -> UInt8 {
    let multiplier = CGFloat(255)
    return UInt8(value * multiplier)
}
