//
//  main.swift
//  Sounds
//
//  Created by satoutakeshi on 2020/06/02.
//  Copyright © 2020 satoutakeshi. All rights reserved.
//

import Foundation
import ArgumentParser

struct RuntimeError: Error, CustomStringConvertible {
    var description: String
    init(_ description: String) {
        self.description = description
    }
}

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

    @Flag(default: .cat, help: "specify the kind of animal")
    var animalKind: AnimalKind

    @Option(default: 2,
            help: "the number of sounds")
    var counter: Int

    @Argument(
        parsing: .remaining,
        help: "the names of sounds animal")
    var names: [String]

    func run() throws {
        if verbose {
            print("start sounds")
        }

        if counter < 0 {
            throw(RuntimeError("Counter must be positive."))
        }

        if counter > 10 {
            throw(RuntimeError("Too many counter. Max 10."))
        }

        let sounds: String
        switch animalKind {
            case .cat:
                sounds = "Meow"
            case .dog:
                sounds = "bow-wow"
            case .mouse:
                sounds = "squeak"
        }

        var outputs = ""

        for _ in 0 ..< counter {
            outputs += sounds + " "
        }

        for name in names {
            print("\(name): \(outputs)")
        }
        if verbose {
            print("end sounds")
        }
    }
}

Sounder.main()


