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

    enum AnimalKind: EnumerableFlag {
        case cat
        case dog
        case mouse
        static func name(for value: Sounder.AnimalKind) -> NameSpecification {
            switch value {
                case .cat:
                    return [.customShort("c"), .long]

                case .dog:
                    return [.customShort("d"), .long]
                case .mouse:
                    return [.customShort("m"), .long]
            }
        }
    }

    @Flag(help: "show detail logs")
    var verbose: Bool

    @Flag(help: "specify the kind of animal")
    var animalKind: AnimalKind?

    

    func run() throws {
        if verbose {
            print("start sounds")
        }

        let sounds: String
        if let animalKind = animalKind {
            switch animalKind {
                case .cat:
                    sounds = "Meow Meow"
                case .dog:
                    sounds = "bow-wow bow-wow"
                case .mouse:
                    sounds = "squeak squeak"
            }
        } else {
            sounds = "Meow Meow"
        }
        print(sounds)

        if verbose {
            print("end sounds")
        }
    }
}

Sounder.main()


