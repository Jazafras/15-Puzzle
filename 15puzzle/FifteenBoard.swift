//
//  FifteenBoard.swift
//  15puzzle
//
//  Created by Jasmine D Emerson on 2/9/17.
//  Copyright © 2017 Jasmine D Emerson. All rights reserved.
//

import UIKit

class FifteenBoard: UIView {
    
    var state : [[Int]] = [
        [1, 2, 3, 4],
        [5, 6, 7, 8],
        [9, 10, 11, 12],
        [13, 14, 15, 0] // 0 => empty slot
    ]
    
    func scramble(numTimes n : Int){
        for _ in 0...n {
            let randomRow = Int(arc4random_uniform(4))
            let randomCol = Int(arc4random_uniform(4))
            if canSlideTile(atRow: randomRow, Column: randomCol){
                slideTile(atRow: randomRow, Column: randomCol)
            }
        }
    }
    
    func getTile(atRow r:Int, atColumn c:Int) -> Int {
        return state[r][c]
    }
    
    func getRowAndColumn(forTile tile: Int) -> (row: Int, column: Int)?{
        for r1 in 0 ..< 4 {
            for c1 in 0 ..< 4 {
                if state[r1][c1] == tile {
                    return (r1,c1)
                }
            }
        }
        return (0,0)
    }
    
    func isSolved() -> Bool {
        var tile = 1
        for r in 0...3 {
            for c in 0...3{
                if state[r][c] != tile && (r != 3 && c != 3){
                    return false
                }
                tile += 1
            }
        }
        return true
    }
    
    func canSlideTileUp(atRow r : Int, Column c : Int) -> Bool {
        if r != 0 && state[r-1][c] == 0 {
            return true
        }
        else{
            return false
        }
    }
    
    func canSlideTileDown(atRow r : Int, Column c : Int) -> Bool {
        if r != 3 && state[r+1][c] == 0 {
            return true
        }
        else{
            return false
        }
    }
    
    func canSlideTileLeft(atRow r : Int, Column c : Int) -> Bool {
        if c != 0 && state[r][c-1] == 0 {
            return true
        }
        else{
            return false
        }
    }
    
    func canSlideTileRight(atRow r : Int, Column c : Int) -> Bool {
        if c != 3 && state[r][c+1] == 0 {
            return true
        }
        else{
            return false
        }
    }
    
    func canSlideTile(atRow r : Int, Column c : Int) -> Bool {
        if self.canSlideTileDown(atRow: r, Column: c) || self.canSlideTileUp(atRow: r, Column: c) || self.canSlideTileLeft(atRow: r, Column: c) || self.canSlideTileRight(atRow: r, Column: c){
            return true
        }
        else{
            return false
        }
    }
    
    func slideTile(atRow r : Int, Column c : Int){
        var temp = 0
        if self.canSlideTileDown(atRow: r, Column: c){
            temp = state[r][c]
            state[r+1][c] = temp
            state[r][c] = 0
        }
        else if self.canSlideTileUp(atRow: r, Column: c){
            temp = state[r][c]
            state[r-1][c] = temp
            state[r][c] = 0
        }
        else if self.canSlideTileLeft(atRow: r, Column: c){
            temp = state[r][c]
            state[r][c-1] = temp
            state[r][c] = 0
        }
        else if self.canSlideTileRight(atRow: r, Column: c){
            temp = state[r][c]
            state[r][c+1] = temp
            state[r][c] = 0
        }
    }
    
}
