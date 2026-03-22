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
CREATE TABLE test_monthname(d date) USING parquet

statement
INSERT INTO test_monthname VALUES (date('2024-01-15')), (date('2024-02-15')), (date('2024-03-15')), (date('2024-04-15')), (date('2024-05-15')), (date('2024-06-15')), (date('2024-07-15')), (date('2024-08-15')), (date('2024-09-15')), (date('2024-10-15')), (date('2024-11-15')), (date('2024-12-15')), (NULL)

-- all 12 months plus NULL from table
query
SELECT monthname(d) FROM test_monthname

-- literal arguments for all 12 months
                             query
SELECT monthname(date('2024-01-01')), monthname(date('2024-02-01')), monthname(date('2024-03-01')), monthname(date('2024-04-01')), monthname(date('2024-05-01')), monthname(date('2024-06-01')), monthname(date('2024-07-01')), monthname(date('2024-08-01')), monthname(date('2024-09-01')), monthname(date('2024-10-01')), monthname(date('2024-11-01')), monthname(date('2024-12-01'))

-- NULL literal
    query
SELECT monthname(NULL)

-- edge cases: leap day and year boundaries
           query
SELECT monthname(date('2024-02-29')), monthname(date('2024-12-31')), monthname(date('2025-01-01'))
