//
//  SceneManagerDelegate.swift
//  Runout
//


import Foundation

protocol SceneManagerDelegate {
    func presentLevelScene(for world: Int)
    func presentGameScene(for level: Int, in world: Int)
    func presentMenuScene()
}
