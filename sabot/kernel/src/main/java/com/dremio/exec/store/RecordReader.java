/*
 * Copyright (C) 2017-2019 Dremio Corporation
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.dremio.exec.store;

import java.util.List;
import java.util.Map;

import org.apache.arrow.memory.OutOfMemoryException;
import org.apache.arrow.vector.ValueVector;

import com.dremio.common.exceptions.ExecutionSetupException;
import com.dremio.common.expression.SchemaPath;
import com.dremio.common.types.TypeProtos.MinorType;
import com.dremio.common.types.Types;
import com.dremio.common.util.MajorTypeHelper;
import com.dremio.exec.record.BatchSchema;
import com.dremio.exec.record.BatchSchema.SelectionVectorMode;
import com.dremio.sabot.op.scan.OutputMutator;

public interface RecordReader extends AutoCloseable {
  String SPLIT_IDENTITY = "splitsIdentity";
  String SPLIT_INFORMATION = "splits";
  String COL_IDS = "colIds";
  String DATAFILE_PATH = "datafilePath";
  BatchSchema SPLIT_GEN_AND_COL_IDS_SCAN_SCHEMA = BatchSchema.newBuilder()
    .addField(MajorTypeHelper.getFieldForNameAndMajorType(SPLIT_IDENTITY, Types.optional(MinorType.VARBINARY)))
    .addField(MajorTypeHelper.getFieldForNameAndMajorType(SPLIT_INFORMATION, Types.optional(MinorType.VARBINARY)))
    .addField(MajorTypeHelper.getFieldForNameAndMajorType(COL_IDS, Types.optional(MinorType.VARBINARY)))
    .setSelectionVectorMode(SelectionVectorMode.NONE)
    .build();

  BatchSchema MANIFEST_SCAN_TABLE_FUNCTION_SCHEMA = BatchSchema.newBuilder()
    .addField(MajorTypeHelper.getFieldForNameAndMajorType(DATAFILE_PATH, Types.optional(MinorType.VARCHAR)))
    .setSelectionVectorMode(BatchSchema.SelectionVectorMode.NONE)
      .build();

  /**
   * Configure the RecordReader with the provided schema and the record batch that should be written to.
   * @param output
   *          The place where output for a particular scan should be written. The record reader is responsible for
   *          mutating the set of schema values for that particular record.
   * @throws ExecutionSetupException
   */
  void setup(OutputMutator output) throws ExecutionSetupException;

  void allocate(Map<String, ValueVector> vectorMap) throws OutOfMemoryException;

  /**
   * Increments this record reader forward, writing via the provided output
   * mutator into the output batch.
   *
   * @return The number of additional records added to the output.
   */
  int next();

  /**
   * Returns the list of columns that were not boosted.
   *
   * @return the list of columns that were not boosted
   */
  default List<SchemaPath> getColumnsToBoost() {
    return null;
  }

  /**
   * Adds a runtime filter to the record reader
   * @param runtimeFilter
   */
  default void addRuntimeFilter(RuntimeFilter runtimeFilter) {}

  /**
   * @return The path of the file the reader is scanning.
   */
  default String getFilePath() {
    return "";
  }
}
