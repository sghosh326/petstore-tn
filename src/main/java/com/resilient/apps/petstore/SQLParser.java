/**
Copyright 2015 Resilient Networks Systems

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

 */

package com.resilient.apps.petstore;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

/**
 * Utility class for parsing SQL script into individual statements
 *
 * @author samiadranly
 */
public class SQLParser {
    private ArrayList<String> stmtList = new ArrayList<String>(50);

    public SQLParser(InputStream is) throws IOException {
        _loadStmts(is);
    }

    private void _loadStmts(InputStream is) throws IOException {
        StringBuilder builder = new StringBuilder();
        BufferedReader br = new BufferedReader(new InputStreamReader(is));

        String line = br.readLine();

        while (line != null) {
            line = line.trim();

            if (line.endsWith(";")) {
                builder.append(line.substring(0, line.length() - 1));
                stmtList.add(builder.toString());
                builder = new StringBuilder();
            } else {
                builder.append(line);
            }

            line = br.readLine();
        }
        if (builder.toString().length() > 0)
            stmtList.add(builder.toString());
    }

    public List<String> getStatements() {
        return stmtList;
    }
}

