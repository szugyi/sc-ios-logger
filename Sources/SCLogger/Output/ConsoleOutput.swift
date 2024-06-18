//
//  ConsoleOutput.swift
//  SCLogger
//

import Foundation

public final class ConsoleOutput {

    // MARK: - Types

    public enum Mode {
        /// log messages will be visible only in Xcode
        case print
        /// log messages will be visible in Xcode and Console app
        case nsLog
    }

    // MARK: - Output properties

    public var formatters = [Formatter]()
    public var filters = [Filter]()

    private let mode: Mode
    private let minLogLevel: LogLevel

    // MARK: - Initialization

    public init(minLogLevel: LogLevel, mode: Mode = .print) {
        self.minLogLevel = minLogLevel
        self.mode = mode
    }
}

// MARK: - Output

extension ConsoleOutput: Output {
    public func write(details: LogDetails, finalMessage: String) {
        guard details.level >= minLogLevel else { return }

        switch mode {
        case .print: print(finalMessage)
        case .nsLog: NSLog(finalMessage)
        }
    }
}
