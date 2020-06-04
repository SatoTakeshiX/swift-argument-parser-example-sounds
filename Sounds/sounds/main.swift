//
//  main.swift
//  Sounds
//
//  Created by satoutakeshi on 2020/06/02.
//  Copyright © 2020 satoutakeshi. All rights reserved.
//

import Foundation
import ArgumentParser

struct Sounder: ParsableCommand {
    static var configuration = CommandConfiguration(
        commandName: "sounds",
        abstract: "Output some animal sounds",
        discussion: """
        Demonstrationg how the Swift Argument Parser works.
        """,
        version: "1.0.0",
        shouldDisplay: true,
        //subcommands: <#T##[ParsableCommand.Type]#>, // non use
        //defaultSubcommand: <#T##ParsableCommand.Type?#>, // non use
        helpNames: [.long, .short]
    )

    func run() throws {
        print("Hello, World!")
    }
}

Sounder.main()


