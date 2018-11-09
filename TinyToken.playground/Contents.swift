import Foundation
import XCTest

protocol TokenUser {
    var balance: Double { get set }
    var address: String { get set }
}

protocol Token: class {
    func mint(_ user: TokenUser, _ amount: Double)
    func send(_ sender: TokenUser, _ recipient: TokenUser, _ amount: Double)
    func balance(_ user: TokenUser) -> Double
}

class User: TokenUser {
    var balance: Double
    var address: String
    
    init(_ address: String, _ balance: Double = 0) {
        self.address = address
        self.balance = balance
    }
}

class TinyToken: Token {
    
    func mint(_ user: TokenUser, _ amount: Double) {
        
        guard amount >= 0 else {
            return
        }
        
        var user = user
        user.balance += amount
    }
    
    func send(_ sender: TokenUser, _ recipient: TokenUser, _ amount: Double) {
        
        guard sender.balance >= amount && amount >= 0 else {
            return
        }
        
        var sender = sender
        var recipient = recipient
        
        sender.balance -= amount
        recipient.balance += amount
    }
    
    func balance(_ user: TokenUser) -> Double {
        return user.balance
    }
}

class TinyTokenTests: XCTestCase {
    
    var sender = User("sender")
    var recipient = User("recipient", 50)
    let token = TinyToken()
    
    func testMintZeroAmount() {
        sender.balance = 0
        token.mint(sender, 0)
        XCTAssert(sender.balance == 0)
    }

    func testMintNegativeAmount() {
        sender.balance = 0
        token.mint(sender, -100)
        XCTAssert(sender.balance == 0)
    }

    func testMint() {
        token.mint(sender, 100)
        XCTAssert(sender.balance == 100)
    }

    func testSendZeroAmount() {
        sender.balance = 0
        recipient.balance = 0
        token.send(sender, recipient, 0)
        XCTAssert(sender.balance == 0)
        XCTAssert(recipient.balance == 0)
    }

    func testSendNegativeAmount() {
        sender.balance = 0
        recipient.balance = 0
        token.send(sender, recipient, -100)
        XCTAssert(sender.balance == 0)
        XCTAssert(recipient.balance == 0)
    }

    func testSendLowBalanceAmount() {
        sender.balance = 50
        recipient.balance = 0
        token.send(sender, recipient, 100)
        XCTAssert(sender.balance == 50)
        XCTAssert(recipient.balance == 0)
    }
    
    func testSendAmount() {
        sender.balance = 50
        recipient.balance = 0
        token.send(sender, recipient, 30)
        XCTAssert(sender.balance == 20)
        XCTAssert(recipient.balance == 30)
    }

    func testBalance() {
        sender.balance = 50
        recipient.balance = 100
        let senderBalance = token.balance(sender)
        let recipientBalance = token.balance(recipient)
        XCTAssert(senderBalance == 50)
        XCTAssert(recipientBalance == 100)
    }
}

TinyTokenTests.defaultTestSuite.run()
