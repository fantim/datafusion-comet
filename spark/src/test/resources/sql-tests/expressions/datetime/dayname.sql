-- Licensed to the Apache Software Foundation (ASF) under one
-- or more contributor license agreements.  See the NOTICE file
-- distributed with this work for additional information
-- regarding copyright ownership.  The ASF licenses this file
-- to you under the Apache License, Version 2.0 (the
-- "License"); you may not use this file except in compliance
-- with the License.  You may obtain a copy of the License at
--
--   http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing,
-- software distributed under the License is distributed on an
-- "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
-- KIND, either express or implied.  See the License for the
-- specific language governing permissions and limitations
-- under the License.

-- ConfigMatrix: parquet.enable.dictionary=false,true
-- MinSparkVersion: 4.0

statement
CREATE TABLE test_dayname(d date) USING parquet

statement
INSERT INTO test_dayname VALUES (date('2024-03-11')), (date('2024-03-12')), (date('2024-03-13')), (date('2024-03-14')), (date('2024-03-15')), (date('2024-03-16')), (date('2024-03-17')), (NULL)

-- all 7 days (Mon-Sun) plus NULL from table
query
SELECT dayname(d) FROM test_dayname

-- literal arguments for all 7 days
                           query
SELECT dayname(date('2024-03-11')), dayname(date('2024-03-12')), dayname(date('2024-03-13')), dayname(date('2024-03-14')), dayname(date('2024-03-15')), dayname(date('2024-03-16')), dayname(date('2024-03-17'))

-- NULL literal
    query
SELECT dayname(NULL)

-- edge cases: leap day and year boundaries
           query
SELECT dayname(date('2024-02-29')), dayname(date('2024-12-31')), dayname(date('2025-01-01'))