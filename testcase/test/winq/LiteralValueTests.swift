/*
 * Tencent is pleased to support the open source community by making
 * WCDB available.
 *
 * Copyright (C) 2017 THL A29 Limited, a Tencent company.
 * All rights reserved.
 *
 * Licensed under the BSD 3-Clause License (the "License"); you may not use
 * this file except in compliance with the License. You may obtain a copy of
 * the License at
 *
 *       https://opensource.org/licenses/BSD-3-Clause
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import XCTest
import SQLite3Kit

class LiteralValueTests: BaseTestCase {

    struct Int32LiteralValue: ColumnCodable {
        static var columnType: ColumnType {
            return .integer32
        }
        func archivedValue() -> FundamentalValue {
            return FundamentalValue(int32)
        }
        init?(with value: FundamentalValue) {
            self.init(value.int32Value)
        }
        init(_ value: Int32) {
            int32 = value
        }
        var int32: Int32
    }

    struct Int64LiteralValue: ColumnCodable {
        static var columnType: ColumnType {
            return .integer64
        }
        func archivedValue() -> FundamentalValue {
            return FundamentalValue(int64)
        }
        init?(with value: FundamentalValue) {
            self.init(value.int64Value)
        }
        init(_ value: Int64) {
            int64 = value
        }
        var int64: Int64
    }

    struct FloatLiteralValue: ColumnCodable {
        static var columnType: ColumnType {
            return .float
        }
        func archivedValue() -> FundamentalValue {
            return FundamentalValue(double)
        }
        init?(with value: FundamentalValue) {
            self.init(value.doubleValue)
        }
        init(_ value: Double) {
            double = value
        }
        var double: Double
    }

    struct StringLiteralValue: ColumnCodable {
        static var columnType: ColumnType {
            return .float
        }
        func archivedValue() -> FundamentalValue {
            return FundamentalValue(string)
        }
        init?(with value: FundamentalValue) {
            self.init(value.stringValue)
        }
        init(_ value: String) {
            string = value
        }
        var string: String
    }

    struct DataLiteralValue: ColumnCodable {
        static var columnType: ColumnType {
            return .BLOB
        }
        func archivedValue() -> FundamentalValue {
            return FundamentalValue(data)
        }
        init?(with value: FundamentalValue) {
            self.init(value.dataValue)
        }
        init(_ value: Data) {
            data = value
        }
        var data: Data
    }

    func testLiteralValue() {

        let boolLiteralValue: LiteralValue = false
        WINQAssertEqual(boolLiteralValue, "0")

        let intLiteralValue: LiteralValue = 1
        WINQAssertEqual(intLiteralValue, "1")

        let floatLiteralValue: LiteralValue = 0.1
        WINQAssertEqual(floatLiteralValue, "0.1")

        let stringLiteralValue: LiteralValue = "test"
        WINQAssertEqual(stringLiteralValue, "'test'")

        let nullLiteralValue: LiteralValue = nil
        WINQAssertEqual(nullLiteralValue, "NULL")

        WINQAssertEqual(LiteralValue(true), "1")

        WINQAssertEqual(LiteralValue(1), "1")

        WINQAssertEqual(LiteralValue(17626545782784), "17626545782784")

        WINQAssertEqual(LiteralValue(0.1), "0.1")

        WINQAssertEqual(LiteralValue("test"), "'test'")

        WINQAssertEqual(LiteralValue("test".data(using: .ascii)!), "'test'")

        WINQAssertEqual(LiteralValue(nil), "NULL")

        WINQAssertEqual(LiteralValue(Int32LiteralValue(1)), "1")

        WINQAssertEqual(LiteralValue(Int64LiteralValue(17626545782784)), "17626545782784")

        WINQAssertEqual(LiteralValue(FloatLiteralValue(0.1)), "0.1")

        WINQAssertEqual(LiteralValue(StringLiteralValue("test")), "'test'")

        WINQAssertEqual(LiteralValue(DataLiteralValue("test".data(using: .ascii)!)), "'test'")
    }
}
