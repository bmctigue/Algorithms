//: Playground - noun: a place where people can play

import Foundation
/* Apple Stock
stock_prices_yesterday = [10, 7, 5, 8, 11, 9]
get_max_profit(stock_prices_yesterday)
#returns 6 (buying for $5 and selling for $11)
*/

func printTestResult(test: [Int], result: (Int,Int,Int), passingResult:(Int,Int,Int)) {
    print("input: \(test)")
    print("result: \(result)")
    result == passingResult ? print("pass") : print("fail")
}

func lowHighStocks(stocks: [Int]) -> (Int, Int, Int) {
    let result = findLowHighStocks(stocks: stocks, lowStock: stocks[0], highStock: stocks[0], profit: 0)
    return result
}

func findLowHighStocks(stocks: [Int], lowStock: Int, highStock: Int, profit: Int) -> (Int, Int, Int) {
    var stocks = stocks
    var lowStock = lowStock
    var highStock = highStock
    var profit = profit
    if stocks.count > 1 {
        var tempProfit = 0
        for stock in stocks {
            tempProfit = stock - stocks.first!
            if tempProfit > profit {
                profit = tempProfit
                lowStock = stocks.first!
                highStock = stock
            }
        }
        stocks.remove(at: 0)
        (lowStock,highStock,profit) = findLowHighStocks(stocks: stocks, lowStock: lowStock, highStock: highStock, profit: profit)
    }
    return (lowStock,highStock,profit)
}

//let test = [10, 7, 5, 8, 11, 9]
//let result = lowHighStocks(stocks: test)
//printTestResult(test: test, result: result, passingResult: (5,11,6))

// This method is keeping track of the max profit and associated lowest stock
func testN() -> (Int,Int)? {
    let test = [10,10]
    if test.count < 2 {
        return nil
    }
    var profit = test[1] - test[0]
    var low = test[0]
    var high = test[0]
    for i in test {
        if ((i - low) > profit) {
            profit = i - low
        }
        if i < low {
            low = i
        }
        print("low: \(low)")
        print("profit: \(profit)")
    }
    high = low + profit
    print("high: \(high)")
    if low == high {
        return nil
    }
    return (low,high)
}

if let lowHigh = testN() {
    print("\(lowHigh)")
} else {
    print ("nil")
}
