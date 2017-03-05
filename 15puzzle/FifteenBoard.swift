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
        var r:Int
        var c:Int
        var temp1:Int
        var temp2:Int
        var check = false
        
        while( n > 0){
            r = Int(arc4random_uniform(4))
            c = Int(arc4random_uniform(4))
            if self.canSlideTileDown(atRow: r, Column: c){
                temp1 = state[r][c]
                temp2 = state[r+1][c]
                state[r][c] = temp2
                state[r+1][c] = temp1
                n -= 1
            }
            else if self.canSlideTileUp(atRow: r, Column: c){
                temp1 = state[r][c]
                temp2 = state[r-1][c]
                state[r][c] = temp2
                state[r-1][c] = temp1
                n -= 1
            }
            else if self.canSlideTileLeft(atRow: r, Column: c){
                temp1 = state[r][c]
                temp2 = state[r][c-1]
                state[r][c] = temp2
                state[r][c-1] = temp1
                n -= 1
            }
            else if self.canSlideTileRight(atRow: r, Column: c){
                temp1 = state[r][c]
                temp2 = state[r][c+1]
                state[r][c] = temp2
                state[r][c+1] = temp1
                n -= 1
            }
        }
    }
    
    func getTile(atRow r:Int, atColumn c:Int){
        return state[r][c]
    }
    
    func getRowAndColumn(forTile tile: Int){
        var row:Int
        var col:Int
        for r in 0 ..< 4 {
            for c in 0 ..< 4 {
                if state[r][c] == tile {
                    row = r
                    col = c
                }
            }
        }
        return state[row][col]
    }

    func isSolved(){
        var check = true
        var solution: [[Int]]
        var tile:Int
        
        tile = 1
        
        for r in 0 ..< 4 {
            for c in 0 ..< 4 {
                if r == 3 && c == 3 {
                    solution[r][c] = 0
                }
                else {
                    solution[r][c] = tile
                    tile += 1
                }
            }
        }
        
        for r in 0 ..< 4 {
            for c in 0 ..< 4 {
                if state[r][c] != solution[r][c]{
                    check = false
                }
            }
        }
        return check
    }
    
    func canSlideTileUp(atRow r : Int, Column c : Int){
        if r != 0 && state[r-1][c] == 0 {
            return true
        }
        else{
            return false
        }
    }
    
    func canSlideTileDown(atRow r : Int, Column c : Int){
        if r != 3 && state[r+1][c] == 0 {
            return true
        }
        else{
            return false
        }
    }
    
    func canSlideTileLeft(atRow r : Int, Column c : Int){
        if c != 0 && state[r][c-1] == 0 {
            return true
        }
        else{
            return false
        }
    }
    
    func canSlideTileRight(atRow r : Int, Column c : Int){
        if c != 3 && state[r][c+1] == 0 {
            return true
        }
        else{
            return false
        }
    }
    
    func canSlideTile(atRow r : Int, Column c : Int){
        if self.canSlideTileDown(atRow: r, Column: c) || self.canSlideTileUp(atRow: r, Column: c) || self.canSlideTileLeft(atRow: r, Column: c) || self.canSlideTileRight(atRow: r, Column: c){
           return true
        }
        else{
            return false
        }
    }
    
}
