/**
 * Copyright (c) 2011-2013, kidzhou 周磊 (zhouleib1412@gmail.com)
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.eova.common.render;

import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import com.eova.common.utils.excel.ExcelUtil;
import com.eova.model.MetaField;
import com.eova.model.MetaObject;
import com.jfinal.kit.LogKit;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.render.Render;
import com.jfinal.render.RenderException;

public class XlsRender extends Render {

	private final static String CONTENT_TYPE = "application/msexcel;charset=" + getEncoding();

	private final MetaObject object;
	private final List<MetaField> items;
	private final List<Record> data;

	private final String fileName;

	public XlsRender(List<Record> data, List<MetaField> items, MetaObject object) {
		this.data = data;
		this.items = items;
		this.object = object;

		fileName = object.getView() + ".xls";
	}

	@Override
	public void render() {
		response.reset();
		response.setHeader("Content-disposition", "attachment; filename=" + fileName);
		response.setContentType(CONTENT_TYPE);
		OutputStream os = null;
		try {
			os = response.getOutputStream();
			ExcelUtil.createExcel(os, data, items, object);
		} catch (Exception e) {
			throw new RenderException(e);
		} finally {
			try {
				if (os != null) {
					os.flush();
					os.close();
				}
			} catch (IOException e) {
				LogKit.error(e.getMessage(), e);
			}

		}
	}

}
