/*----------------------------------------------*/
/* util.js
/*----------------------------------------------*/
/**
 * @license
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not
 * use this file except in compliance with the License. You may obtain a copy
 * of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * License for the specific language governing permissions and limitations under
 * the License.
 *
 * Copyright (c) 2011-2013 Jos de Jong, http://jsoneditoronline.org
 *
 * @author  Jos de Jong, <wjosdejong@gmail.com>
 */
// create namespace
var jsoneditor = jsoneditor || {};
jsoneditor.util = {};

// Internet Explorer 8 and older does not support Array.indexOf,
// so we define it here in that case
// http://soledadpenades.com/2007/05/17/arrayindexof-in-internet-explorer/
if (!Array.prototype.indexOf) {
	Array.prototype.indexOf = function (obj) {
		for (var i = 0; i < this.length; i++) {
			if (this[i] == obj) {
				return i;
			}
		}
		return -1;
	}
}

// Internet Explorer 8 and older does not support Array.forEach,
// so we define it here in that case
// https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Global_Objects/Array/forEach
if (!Array.prototype.forEach) {
	Array.prototype.forEach = function (fn, scope) {
		for (var i = 0, len = this.length; i < len; ++i) {
			fn.call(scope || this, this[i], i, this);
		}
	}
}

/**
 * Parse JSON using the parser built-in in the browser.
 * On exception, the jsonString is validated and a detailed error is thrown.
 * @param {String} jsonString
 */
jsoneditor.util.parse = function (jsonString) {
	try {
		return JSON.parse(jsonString);
	} catch (err) {
		// get a detailed error message using validate
		var message = jsoneditor.util.validate(jsonString) || err;
		throw new Error(message);
	}
};

/**
 * Validate a string containing a JSON object
 * This method uses JSONLint to validate the String. If JSONLint is not
 * available, the built-in JSON parser of the browser is used.
 * @param {String} jsonString   String with an (invalid) JSON object
 * @return {String | undefined} Returns undefined when the string is valid JSON,
 *                              returns a string with an error message when
 *                              the data is invalid. This message is HTML
 *                              formatted.
 */
jsoneditor.util.validate = function (jsonString) {
	var message = undefined;

	try {
		if (typeof (jsonlint) != 'undefined') {
			jsonlint.parse(jsonString);
		} else {
			JSON.parse(jsonString);
		}
	} catch (err) {
		message = '<pre class="error">' + err.toString() + '</pre>';
		if (typeof (jsonlint) != 'undefined') {
			message +=
				'<div id="by-jsonlint">由 <a class="error" href="http://zaach.github.com/jsonlint/" target="_blank">' +
				'JSONLint' +
				'</a> 提供验证.</div>';
		}
	}

	return message;
};

/**
 * Retrieve the absolute left value of a DOM element
 * @param {Element} elem    A dom element, for example a div
 * @return {Number} left    The absolute left position of this element
 *                          in the browser page.
 */
jsoneditor.util.getAbsoluteLeft = function (elem) {
	var left = elem.offsetLeft;
	var body = document.body;
	var e = elem.offsetParent;
	while (e != null && elem != body) {
		left += e.offsetLeft;
		left -= e.scrollLeft;
		e = e.offsetParent;
	}
	return left;
};

/**
 * Retrieve the absolute top value of a DOM element
 * @param {Element} elem    A dom element, for example a div
 * @return {Number} top    The absolute top position of this element
 *                          in the browser page.
 */
jsoneditor.util.getAbsoluteTop = function (elem) {
	var top = elem.offsetTop;
	var body = document.body;
	var e = elem.offsetParent;
	while (e != null && e != body) {
		top += e.offsetTop;
		top -= e.scrollTop;
		e = e.offsetParent;
	}
	return top;
};

/**
 * Get the absolute, vertical mouse position from an event.
 * @param {Event} event
 * @return {Number} mouseY
 */
jsoneditor.util.getMouseY = function (event) {
	var mouseY;
	if ('pageY' in event) {
		mouseY = event.pageY;
	} else {
		// for IE8 and older
		mouseY = (event.clientY + document.documentElement.scrollTop);
	}

	return mouseY;
};

/**
 * Get the absolute, horizontal mouse position from an event.
 * @param {Event} event
 * @return {Number} mouseX
 */
jsoneditor.util.getMouseX = function (event) {
	var mouseX;
	if ('pageX' in event) {
		mouseX = event.pageX;
	} else {
		// for IE8 and older
		mouseX = (event.clientX + document.documentElement.scrollLeft);
	}

	return mouseX;
};

/**
 * Get the window height
 * @return {Number} windowHeight
 */
jsoneditor.util.getWindowHeight = function () {
	if ('innerHeight' in window) {
		return window.innerHeight;
	} else {
		// for IE8 and older
		return Math.max(document.body.clientHeight,
		document.documentElement.clientHeight);
	}
};

/**
 * add a className to the given elements style
 * @param {Element} elem
 * @param {String} className
 */
jsoneditor.util.addClassName = function (elem, className) {
	var classes = elem.className.split(' ');
	if (classes.indexOf(className) == -1) {
		classes.push(className); // add the class to the array
		elem.className = classes.join(' ');
	}
};

/**
 * add a className to the given elements style
 * @param {Element} elem
 * @param {String} className
 */
jsoneditor.util.removeClassName = function (elem, className) {
	var classes = elem.className.split(' ');
	var index = classes.indexOf(className);
	if (index != -1) {
		classes.splice(index, 1); // remove the class from the array
		elem.className = classes.join(' ');
	}
};

/**
 * Strip the formatting from the contents of a div
 * the formatting from the div itself is not stripped, only from its childs.
 * @param {Element} divElement
 */
jsoneditor.util.stripFormatting = function (divElement) {
	var childs = divElement.childNodes;
	for (var i = 0, iMax = childs.length; i < iMax; i++) {
		var child = childs[i];

		// remove the style
		if (child.style) {
			// TODO: test if child.attributes does contain style
			child.removeAttribute('style');
		}

		// remove all attributes
		var attributes = child.attributes;
		if (attributes) {
			for (var j = attributes.length - 1; j >= 0; j--) {
				var attribute = attributes[j];
				if (attribute.specified == true) {
					child.removeAttribute(attribute.name);
				}
			}
		}

		// recursively strip childs
		jsoneditor.util.stripFormatting(child);
	}
};

/**
 * Set focus to the end of an editable div
 * code from Nico Burns
 * http://stackoverflow.com/users/140293/nico-burns
 * http://stackoverflow.com/questions/1125292/how-to-move-cursor-to-end-of-contenteditable-entity
 * @param {Element} contentEditableElement   A content editable div
 */
jsoneditor.util.setEndOfContentEditable = function (contentEditableElement) {
	var range, selection;
	if (document.createRange) { //Firefox, Chrome, Opera, Safari, IE 9+
		range = document.createRange(); //Create a range (a range is a like the selection but invisible)
		range.selectNodeContents(contentEditableElement); //Select the entire contents of the element with the range
		range.collapse(false); //collapse the range to the end point. false means collapse to end rather than the start
		selection = window.getSelection(); //get the selection object (allows you to change selection)
		selection.removeAllRanges(); //remove any selections already made
		selection.addRange(range); //make the range you have just created the visible selection
	} else if (document.selection) { //IE 8 and lower
		range = document.body.createTextRange(); //Create a range (a range is a like the selection but invisible)
		range.moveToElementText(contentEditableElement); //Select the entire contents of the element with the range
		range.collapse(false); //collapse the range to the end point. false means collapse to end rather than the start
		range.select(); //Select the range (make it the visible selection
	}
};

/**
 * Select all text of a content editable div.
 * http://stackoverflow.com/a/3806004/1262753
 * @param {Element} contentEditableElement   A content editable div
 */
jsoneditor.util.selectContentEditable = function (contentEditableElement) {
	if (!contentEditableElement || contentEditableElement.nodeName != 'DIV') {
		return;
	}

	var sel, range;
	if (window.getSelection && document.createRange) {
		range = document.createRange();
		range.selectNodeContents(contentEditableElement);
		sel = window.getSelection();
		sel.removeAllRanges();
		sel.addRange(range);
	} else if (document.body.createTextRange) {
		range = document.body.createTextRange();
		range.moveToElementText(contentEditableElement);
		range.select();
	}
};

/**
 * Get text selection
 * http://stackoverflow.com/questions/4687808/contenteditable-selected-text-save-and-restore
 * @return {Range | TextRange | null} range
 */
jsoneditor.util.getSelection = function () {
	if (window.getSelection) {
		var sel = window.getSelection();
		if (sel.getRangeAt && sel.rangeCount) {
			return sel.getRangeAt(0);
		}
	} else if (document.selection && document.selection.createRange) {
		return document.selection.createRange();
	}
	return null;
};

/**
 * Set text selection
 * http://stackoverflow.com/questions/4687808/contenteditable-selected-text-save-and-restore
 * @param {Range | TextRange | null} range
 */
jsoneditor.util.setSelection = function (range) {
	if (range) {
		if (window.getSelection) {
			var sel = window.getSelection();
			sel.removeAllRanges();
			sel.addRange(range);
		} else if (document.selection && range.select) {
			range.select();
		}
	}
};

/**
 * Get selected text range
 * @return {Object} params  object containing parameters:
 *                              {Number}  startOffset
 *                              {Number}  endOffset
 *                              {Element} container  HTML element holding the
 *                                                   selected text element
 *                          Returns null if no text selection is found
 */
jsoneditor.util.getSelectionOffset = function () {
	var range = jsoneditor.util.getSelection();

	if (range && 'startOffset' in range && 'endOffset' in range && range.startContainer && (range.startContainer == range.endContainer)) {
		return {
			startOffset: range.startOffset,
			endOffset: range.endOffset,
			container: range.startContainer.parentNode
		};
	} else {
		// TODO: implement getSelectionOffset for IE8
	}

	return null;
};

/**
 * Set selected text range in given element
 * @param {Object} params   An object containing:
 *                              {Element} container
 *                              {Number} startOffset
 *                              {Number} endOffset
 */
jsoneditor.util.setSelectionOffset = function (params) {
	if (document.createRange && window.getSelection) {
		var selection = window.getSelection();
		if (selection) {
			var range = document.createRange();
			// TODO: do not suppose that the first child of the container is a textnode,
			//       but recursively find the textnodes
			range.setStart(params.container.firstChild, params.startOffset);
			range.setEnd(params.container.firstChild, params.endOffset);

			jsoneditor.util.setSelection(range);
		}
	} else {
		// TODO: implement setSelectionOffset for IE8
	}
};

/**
 * Get the inner text of an HTML element (for example a div element)
 * @param {Element} element
 * @param {Object} [buffer]
 * @return {String} innerText
 */
jsoneditor.util.getInnerText = function (element, buffer) {
	var first = (buffer == undefined);
	if (first) {
		buffer = {
			'text': '',
			'flush': function () {
				var text = this.text;
				this.text = '';
				return text;
			},
			'set': function (text) {
				this.text = text;
			}
		};
	}

	// text node
	if (element.nodeValue) {
		return buffer.flush() + element.nodeValue;
	}

	// divs or other HTML elements
	if (element.hasChildNodes()) {
		var childNodes = element.childNodes;
		var innerText = '';

		for (var i = 0, iMax = childNodes.length; i < iMax; i++) {
			var child = childNodes[i];

			if (child.nodeName == 'DIV' || child.nodeName == 'P') {
				var prevChild = childNodes[i - 1];
				var prevName = prevChild ? prevChild.nodeName : undefined;
				if (prevName && prevName != 'DIV' && prevName != 'P' && prevName != 'BR') {
					innerText += '\n';
					buffer.flush();
				}
				innerText += jsoneditor.util.getInnerText(child, buffer);
				buffer.set('\n');
			} else if (child.nodeName == 'BR') {
				innerText += buffer.flush();
				buffer.set('\n');
			} else {
				innerText += jsoneditor.util.getInnerText(child, buffer);
			}
		}

		return innerText;
	} else {
		if (element.nodeName == 'P' && jsoneditor.util.getInternetExplorerVersion() != -1) {
			// On Internet Explorer, a <p> with hasChildNodes()==false is
			// rendered with a new line. Note that a <p> with
			// hasChildNodes()==true is rendered without a new line
			// Other browsers always ensure there is a <br> inside the <p>,
			// and if not, the <p> does not render a new line
			return buffer.flush();
		}
	}

	// br or unknown
	return '';
};

/**
 * Returns the version of Internet Explorer or a -1
 * (indicating the use of another browser).
 * Source: http://msdn.microsoft.com/en-us/library/ms537509(v=vs.85).aspx
 * @return {Number} Internet Explorer version, or -1 in case of an other browser
 */
jsoneditor.util.getInternetExplorerVersion = function () {
	if (_ieVersion == -1) {
		var rv = -1; // Return value assumes failure.
		if (navigator.appName == 'Microsoft Internet Explorer') {
			var ua = navigator.userAgent;
			var re = new RegExp("MSIE ([0-9]{1,}[\.0-9]{0,})");
			if (re.exec(ua) != null) {
				rv = parseFloat(RegExp.$1);
			}
		}

		_ieVersion = rv;
	}

	return _ieVersion;
};

/**
 * cached internet explorer version
 * @type {Number}
 * @private
 */
var _ieVersion = -1;

/**
 * Add and event listener. Works for all browsers
 * @param {Element}     element    An html element
 * @param {string}      action     The action, for example "click",
 *                                 without the prefix "on"
 * @param {function}    listener   The callback function to be executed
 * @param {boolean}     [useCapture] false by default
 * @return {function}   the created event listener
 */
jsoneditor.util.addEventListener = function (element, action, listener, useCapture) {
	if (element.addEventListener) {
		if (useCapture === undefined) useCapture = false;

		if (action === "mousewheel" && navigator.userAgent.indexOf("Firefox") >= 0) {
			action = "DOMMouseScroll"; // For Firefox
		}

		element.addEventListener(action, listener, useCapture);
		return listener;
	} else {
		// IE browsers
		var f = function () {
			return listener.call(element, window.event);
		};
		element.attachEvent("on" + action, f);
		return f;
	}
};

/**
 * Remove an event listener from an element
 * @param {Element}  element   An html dom element
 * @param {string}   action    The name of the event, for example "mousedown"
 * @param {function} listener  The listener function
 * @param {boolean}  [useCapture]   false by default
 */
jsoneditor.util.removeEventListener = function (element, action, listener, useCapture) {
	if (element.removeEventListener) {
		// non-IE browsers
		if (useCapture === undefined) useCapture = false;

		if (action === "mousewheel" && navigator.userAgent.indexOf("Firefox") >= 0) {
			action = "DOMMouseScroll"; // For Firefox
		}

		element.removeEventListener(action, listener, useCapture);
	} else {
		// IE browsers
		element.detachEvent("on" + action, listener);
	}
};


/**
 * Stop event propagation
 * @param {Event} event
 */
jsoneditor.util.stopPropagation = function (event) {
	if (!event) {
		event = window.event;
	}

	if (event.stopPropagation) {
		event.stopPropagation(); // non-IE browsers
	} else {
		event.cancelBubble = true; // IE browsers
	}
};


/**
 * Cancels the event if it is cancelable, without stopping further propagation of the event.
 * @param {Event} event
 */
jsoneditor.util.preventDefault = function (event) {
	if (!event) {
		event = window.event;
	}

	if (event.preventDefault) {
		event.preventDefault(); // non-IE browsers
	} else {
		event.returnValue = false; // IE browsers
	}
};

/*----------------------------------------------*/
/* splitter.js
/*----------------------------------------------*/
/**
 * A splitter control.
 * Turns an existing HTML element into an horizontal splitter control.
 * @constructor Splitter
 * @param {Object} params   Available parameters:
 *                          {Element} container  HTML container representing
 *                                               the splitter
 *                          {function} [change]  Callback method called when
 *                                               the splitter value has changed.
 *                                               The callback is called with
 *                                               the new value as parameter
 */
function Splitter(params) {
	if (!params || !params.container) {
		throw new Error('params.container undefined in Splitter constructor');
	}

	var me = this;
	jsoneditor.util.addEventListener(params.container, "mousedown", function (event) {
		me.onMouseDown(event);
	});

	this.container = params.container;
	this.onChange = (params.change) ? params.change : function () {};
	this.params = {};
}

/**
 * Handle mouse down event. Start dragging the splitter.
 * @param {Event} event
 * @private
 */
Splitter.prototype.onMouseDown = function (event) {
	var me = this;
	var leftButtonDown = event.which ? (event.which == 1) : (event.button == 1);
	if (!leftButtonDown) {
		return;
	}

	if (!this.params.mousedown) {
		this.params.mousedown = true;
		this.params.mousemove = jsoneditor.util.addEventListener(document, 'mousemove', function (event) {
			me.onMouseMove(event);
		});
		this.params.mouseup = jsoneditor.util.addEventListener(document, 'mouseup', function (event) {
			me.onMouseUp(event);
		});
		this.params.screenX = event.screenX;
		this.params.value = this.getValue();
	}
	jsoneditor.util.preventDefault(event);
};

/**
 * Handle on mouse move event. Used to drag the splitter
 * @param {Event} event
 * @private
 */
Splitter.prototype.onMouseMove = function (event) {
	var width = (window.innerWidth || document.body.offsetWidth || document.documentElement.offsetWidth);

	var diff = event.screenX - this.params.screenX;

	var value = this.params.value + diff / width;
	value = this.setValue(value);

	this.onChange(value);

	jsoneditor.util.preventDefault(event);
};

/**
 * Handle on mouse up event
 * @param {Event} event
 * @private
 */
Splitter.prototype.onMouseUp = function (event) {
	if (this.params.mousedown) {
		jsoneditor.util.removeEventListener(document, 'mousemove', this.params.mousemove);
		jsoneditor.util.removeEventListener(document, 'mouseup', this.params.mouseup);
		this.params.mousemove = undefined;
		this.params.mouseup = undefined;
		this.params.mousedown = false;
	}
	jsoneditor.util.preventDefault(event);
};

/**
 * Set a value for the splitter (UI is not adjusted)
 * @param {Number} value   A number between 0.1 and 0.9
 * @return {Number} value  The stored value
 */
Splitter.prototype.setValue = function (value) {
	value = Number(value);
	if (value < 0.1) {
		value = 0.1;
	}
	if (value > 0.9) {
		value = 0.9;
	}

	this.value = value;

	try {
		localStorage['splitterValue'] = value;
	} catch (e) {
		console.log(e);
	}
	return value;
};

/**
 * Get the splitter value from local storage
 * @return {Number} value   A value between 0.1 and 0.9
 */
Splitter.prototype.getValue = function () {
	var value = this.value;
	if (value == undefined) {
		// read from localStorage once
		try {
			if (localStorage['splitterValue'] != undefined) {
				value = Number(localStorage['splitterValue']); // read
				value = this.setValue(value); // verify and store
			}
		} catch (e) {
			console.log(e);
		}
	}
	if (value == undefined) {
		value = this.setValue(0.5);
	}
	return value;
};

/*----------------------------------------------*/
/* searchbox.js
/*----------------------------------------------*/
/**
 * @license
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not
 * use this file except in compliance with the License. You may obtain a copy
 * of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * License for the specific language governing permissions and limitations under
 * the License.
 *
 * Copyright (c) 2011-2013 Jos de Jong, http://jsoneditoronline.org
 *
 * @author  Jos de Jong, <wjosdejong@gmail.com>
 */

// create namespace
var jsoneditor = jsoneditor || {};

/**
 * @constructor jsoneditor.SearchBox
 * Create a search box in given HTML container
 * @param {jsoneditor.JSONEditor} editor    The JSON Editor to attach to
 * @param {Element} container               HTML container element of where to
 *                                          create the search box
 */
jsoneditor.SearchBox = function (editor, container) {
	var searchBox = this;

	this.editor = editor;
	this.timeout = undefined;
	this.delay = 200; // ms
	this.lastText = undefined;

	this.dom = {};
	this.dom.container = container;

	var table = document.createElement('table');
	this.dom.table = table;
	table.className = 'search';
	container.appendChild(table);
	var tbody = document.createElement('tbody');
	this.dom.tbody = tbody;
	table.appendChild(tbody);
	var tr = document.createElement('tr');
	tbody.appendChild(tr);

	var td = document.createElement('td');
	tr.appendChild(td);
	var results = document.createElement('div');
	this.dom.results = results;
	results.className = 'results';
	td.appendChild(results);

	td = document.createElement('td');
	tr.appendChild(td);
	var divInput = document.createElement('div');
	this.dom.input = divInput;
	divInput.className = 'frame';
	divInput.title = '查找区块和值';
	td.appendChild(divInput);

	// table to contain the text input and search button
	var tableInput = document.createElement('table');
	divInput.appendChild(tableInput);
	var tbodySearch = document.createElement('tbody');
	tableInput.appendChild(tbodySearch);
	tr = document.createElement('tr');
	tbodySearch.appendChild(tr);

	var refreshSearch = document.createElement('button');
	refreshSearch.className = 'refresh';
	td = document.createElement('td');
	td.appendChild(refreshSearch);
	tr.appendChild(td);

	var search = document.createElement('input');
	this.dom.search = search;
	search.oninput = function (event) {
		searchBox._onDelayedSearch(event);
	};
	search.onchange = function (event) { // For IE 8
		searchBox._onSearch(event);
	};
	search.onkeydown = function (event) {
		searchBox._onKeyDown(event);
	};
	search.onkeyup = function (event) {
		searchBox._onKeyUp(event);
	};
	refreshSearch.onclick = function (event) {
		search.select();
	};

	// TODO: ESC in FF restores the last input, is a FF bug, https://bugzilla.mozilla.org/show_bug.cgi?id=598819
	td = document.createElement('td');
	td.appendChild(search);
	tr.appendChild(td);

	var searchNext = document.createElement('button');
	searchNext.title = '下一个 (Enter)';
	searchNext.className = 'next';
	searchNext.onclick = function () {
		searchBox.next();
	};
	td = document.createElement('td');
	td.appendChild(searchNext);
	tr.appendChild(td);

	var searchPrevious = document.createElement('button');
	searchPrevious.title = '上一个 (Shift+Enter)';
	searchPrevious.className = 'previous';
	searchPrevious.onclick = function () {
		searchBox.previous();
	};
	td = document.createElement('td');
	td.appendChild(searchPrevious);
	tr.appendChild(td);

};

/**
 * Go to the next search result
 * @param {boolean} [focus]   If true, focus will be set to the next result
 *                            focus is false by default.
 */
jsoneditor.SearchBox.prototype.next = function (focus) {
	if (this.results != undefined) {
		var index = (this.resultIndex != undefined) ? this.resultIndex + 1 : 0;
		if (index > this.results.length - 1) {
			index = 0;
		}
		this._setActiveResult(index, focus);
	}
};

/**
 * Go to the prevous search result
 * @param {boolean} [focus]   If true, focus will be set to the next result
 *                            focus is false by default.
 */
jsoneditor.SearchBox.prototype.previous = function (focus) {
	if (this.results != undefined) {
		var max = this.results.length - 1;
		var index = (this.resultIndex != undefined) ? this.resultIndex - 1 : max;
		if (index < 0) {
			index = max;
		}
		this._setActiveResult(index, focus);
	}
};

/**
 * Set new value for the current active result
 * @param {Number} index
 * @param {boolean} [focus]   If true, focus will be set to the next result.
 *                            focus is false by default.
 * @private
 */
jsoneditor.SearchBox.prototype._setActiveResult = function (index, focus) {
	// de-activate current active result
	if (this.activeResult) {
		var prevNode = this.activeResult.node;
		var prevElem = this.activeResult.elem;
		if (prevElem == 'field') {
			delete prevNode.searchFieldActive;
		} else {
			delete prevNode.searchValueActive;
		}
		prevNode.updateDom();
	}

	if (!this.results || !this.results[index]) {
		// out of range, set to undefined
		this.resultIndex = undefined;
		this.activeResult = undefined;
		return;
	}

	this.resultIndex = index;

	// set new node active
	var node = this.results[this.resultIndex].node;
	var elem = this.results[this.resultIndex].elem;
	if (elem == 'field') {
		node.searchFieldActive = true;
	} else {
		node.searchValueActive = true;
	}
	this.activeResult = this.results[this.resultIndex];
	node.updateDom();

	// TODO: not so nice that the focus is only set after the animation is finished
	node.scrollTo(function () {
		if (focus) {
			node.focus(elem);
		}
	});
};

/**
 * Cancel any running onDelayedSearch.
 * @private
 */
jsoneditor.SearchBox.prototype._clearDelay = function () {
	if (this.timeout != undefined) {
		clearTimeout(this.timeout);
		delete this.timeout;
	}
};

/**
 * Start a timer to execute a search after a short delay.
 * Used for reducing the number of searches while typing.
 * @param {Event} event
 * @private
 */
jsoneditor.SearchBox.prototype._onDelayedSearch = function (event) {
	// execute the search after a short delay (reduces the number of
	// search actions while typing in the search text box)
	this._clearDelay();
	var searchBox = this;
	this.timeout = setTimeout(function (event) {
		searchBox._onSearch(event);
	},
	this.delay);
};

/**
 * Handle onSearch event
 * @param {Event} event
 * @param {boolean} [forceSearch]  If true, search will be executed again even
 *                                 when the search text is not changed.
 *                                 Default is false.
 * @private
 */
jsoneditor.SearchBox.prototype._onSearch = function (event, forceSearch) {
	this._clearDelay();

	var value = this.dom.search.value;
	var text = (value.length > 0) ? value : undefined;
	if (text != this.lastText || forceSearch) {
		// only search again when changed
		this.lastText = text;
		this.results = this.editor.search(text);
		this._setActiveResult(undefined);

		// display search results
		if (text != undefined) {
			var resultCount = this.results.length;
			switch (resultCount) {
				case 0:
					this.dom.results.innerHTML = '区块/值未找到';
					break;
					//case 1: this.dom.results.innerHTML = '1&nbsp;result'; break;
				default:
					this.dom.results.innerHTML = '找到&nbsp;' + resultCount + '&nbsp;个结果';
					break;
			}
		} else {
			this.dom.results.innerHTML = '';
		}
	}
};

/**
 * Handle onKeyDown event in the input box
 * @param {Event} event
 * @private
 */
jsoneditor.SearchBox.prototype._onKeyDown = function (event) {
	event = event || window.event;
	var keynum = event.which || event.keyCode;
	if (keynum == 27) { // ESC
		this.dom.search.value = ''; // clear search
		this._onSearch(event);
		jsoneditor.util.preventDefault(event);
		jsoneditor.util.stopPropagation(event);
	} else if (keynum == 13) { // Enter
		if (event.ctrlKey) {
			// force to search again
			this._onSearch(event, true);
		} else if (event.shiftKey) {
			// move to the previous search result
			this.previous();
		} else {
			// move to the next search result
			this.next();
		}
		jsoneditor.util.preventDefault(event);
		jsoneditor.util.stopPropagation(event);
	}
};

/**
 * Handle onKeyUp event in the input box
 * @param {Event} event
 * @private
 */
jsoneditor.SearchBox.prototype._onKeyUp = function (event) {
	event = event || window.event;
	var keynum = event.which || event.keyCode;
	if (keynum != 27 && keynum != 13) { // !show and !Enter
		this._onDelayedSearch(event); // For IE 8
	}
};

/*----------------------------------------------*/
/* notify.js
/*----------------------------------------------*/
/**
 * Utility to display notifications and error messages.
 * The messages are displayed on the top center of the web page
 * @constructor Notify
 */
function Notify() {
	this.dom = {};

	// TODO: attach the event as soon as there are one or multiple messages displayed,
	//       remove it as soon as they are all gone
	var me = this;
	jsoneditor.util.addEventListener(document, 'keydown', function (event) {
		me.onKeyDown(event);
	});
}

/**
 * Show a notification
 * @param {String} message
 * @return {Element} messageObject
 */
Notify.prototype.showNotification = function (message) {
	return this.showMessage({
		type: 'notification',
		message: message,
		closeButton: false
	});
};

/**
 * Show an error message
 * @param {Error} error
 * @return {Element} messageObject
 */
Notify.prototype.showError = function (error) {
	return this.showMessage({
		type: 'error',
		message: (error.message || error.toString()),
		closeButton: true
	});
};

/**
 * Show a message
 * @param {Object} params    Available parameters:
 *                           {String} message
 *                           {String} type 'error', 'notification'
 *                           {Boolean} closeButton
 * @return {Element} messageObject
 */
Notify.prototype.showMessage = function (params) {
	var frame = this.dom.frame;
	if (!frame) {
		var width = 500;
		var top = 25; // {JSON.org.cn}
		var windowWidth = document.body.offsetWidth || window.innerWidth;
		frame = document.createElement('div');
		frame.style.position = 'absolute';
		frame.style.left = (windowWidth - width) / 2 + 'px';
		frame.style.width = width + 'px';
		frame.style.top = top + 'px';
		document.body.appendChild(frame);
		this.dom.frame = frame;
	}

	var type = params.type || 'notification';
	var closeable = (params.closeButton !== false);
	var divMessage = document.createElement('div');
	divMessage.className = type;
	divMessage.type = type;
	divMessage.closeable = closeable;
	divMessage.style.position = 'relative';
	frame.appendChild(divMessage);

	var table = document.createElement('table');
	table.style.width = '100%';
	divMessage.appendChild(table);
	var tbody = document.createElement('tbody');
	table.appendChild(tbody);
	var tr = document.createElement('tr');
	tbody.appendChild(tr);

	var tdMessage = document.createElement('td');
	tdMessage.innerHTML = params.message || '';
	tr.appendChild(tdMessage);

	if (closeable) {
		var tdClose = document.createElement('td');
		tdClose.style.textAlign = 'right';
		tdClose.style.verticalAlign = 'top';
		tr.appendChild(tdClose);

		var closeDiv = document.createElement('button');
		closeDiv.innerHTML = '&times;';
		closeDiv.title = 'Close message (ESC)';
		tdClose.appendChild(closeDiv);
		var me = this;
		closeDiv.onclick = function () {
			me.removeMessage(divMessage);
		}
	}

	return divMessage;
};

/**
 * Remove a message from the list with messages
 * @param {Element} [message]   The HTML DOM of a message
 *                              If undefined, the first closeable message will
 *                              closed.
 */
Notify.prototype.removeMessage = function (message) {
	var frame = this.dom.frame;
	if (!message && frame) {
		// find the first closable message in the list with displayed messages
		var child = frame.firstChild;
		while (child && !child.closeable) {
			child = child.nextSibling;
		}
		if (child && child.closeable) {
			message = child;
		}
	}

	if (message && message.parentNode == frame) {
		message.parentNode.removeChild(message);
	}

	if (frame && frame.childNodes.length == 0) {
		frame.parentNode.removeChild(frame);
		delete this.dom.frame;
	}
};

/**
 * Handle key down event.
 * @param {Event} event
 * @private
 */
Notify.prototype.onKeyDown = function (event) {
	event = event || window.event;
	var keynum = event.which || event.keyCode;
	if (keynum == 27) { // ESC
		// remove the oldest open and closeable message
		this.removeMessage();
		jsoneditor.util.preventDefault(event);
		jsoneditor.util.stopPropagation(event);
	}
};

/*----------------------------------------------*/
/* node.js
/*----------------------------------------------*/
/**
 * @license
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not
 * use this file except in compliance with the License. You may obtain a copy
 * of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * License for the specific language governing permissions and limitations under
 * the License.
 *
 * Copyright (c) 2011-2013 Jos de Jong, http://jsoneditoronline.org
 *
 * @author  Jos de Jong, <wjosdejong@gmail.com>
 */

// create namespace
var jsoneditor = jsoneditor || {};

/**
 * @constructor jsoneditor.Node
 * Create a new Node
 * @param {JSONEditor} editor
 * @param {Object} [params] Can contain parameters:
 *                          {string}  field
 *                          {boolean} fieldEditable
 *                          {*}       value
 *                          {String}  type  Can have values 'auto', 'array',
 *                                          'object', or 'string'.
 */
jsoneditor.Node = function (editor, params) {
	this.editor = editor;
	this.dom = {};
	this.expanded = false;

	if (params && (params instanceof Object)) {
		this.setField(params.field, params.fieldEditable);
		this.setValue(params.value, params.type);
	} else {
		this.setField('');
		this.setValue(null);
	}
};

/**
 * Set parent node
 * @param {jsoneditor.Node} parent
 */
jsoneditor.Node.prototype.setParent = function (parent) {
	this.parent = parent;
};

/**
 * Set field
 * @param {String}  field
 * @param {boolean} [fieldEditable]
 */
jsoneditor.Node.prototype.setField = function (field, fieldEditable) {
	this.field = field;
	this.fieldEditable = (fieldEditable == true);
};

/**
 * Get field
 * @return {String}
 */
jsoneditor.Node.prototype.getField = function () {
	if (this.field === undefined) {
		this._getDomField();
	}

	return this.field;
};

/**
 * Set value. Value is a JSON structure or an element String, Boolean, etc.
 * @param {*} value
 * @param {String} [type]  Specify the type of the value. Can be 'auto',
 *                         'array', 'object', or 'string'
 */
jsoneditor.Node.prototype.setValue = function (value, type) {
	var childValue, child;

	// first clear all current childs (if any)
	var childs = this.childs;
	if (childs) {
		while (childs.length) {
			this.removeChild(childs[0]);
		}
	}

	// TODO: remove the DOM of this Node

	this.type = this._getType(value);

	// check if type corresponds with the provided type
	if (type && type != this.type) {
		if (type == 'string' && this.type == 'auto') {
			this.type = type;
		} else {
			throw new Error('Type mismatch: ' +
				'cannot cast value of type "' + this.type +
				' to the specified type "' + type + '"');
		}
	}

	if (this.type == 'array') {
		// array
		this.childs = [];
		for (var i = 0, iMax = value.length; i < iMax; i++) {
			childValue = value[i];
			if (childValue !== undefined && !(childValue instanceof Function)) {
				// ignore undefined and functions
				child = new jsoneditor.Node(this.editor, {
					'value': childValue
				});
				this.appendChild(child);
			}
		}
		this.value = '';
	} else if (this.type == 'object') {
		// object
		this.childs = [];
		for (var childField in value) {
			if (value.hasOwnProperty(childField)) {
				childValue = value[childField];
				if (childValue !== undefined && !(childValue instanceof Function)) {
					// ignore undefined and functions
					child = new jsoneditor.Node(this.editor, {
						'field': childField,
						'value': childValue
					});
					this.appendChild(child);
				}
			}
		}
		this.value = '';
	} else {
		// value
		this.childs = undefined;
		this.value = value;
		/* TODO
         if (typeof(value) == 'string') {
         var escValue = JSON.stringify(value);
         this.value = escValue.substring(1, escValue.length - 1);
         console.log('check', value, this.value);
         }
         else {
         this.value = value;
         }
         */
	}
};

/**
 * Get value. Value is a JSON structure
 * @return {*} value
 */
jsoneditor.Node.prototype.getValue = function () {
	//var childs, i, iMax;

	if (this.type == 'array') {
		var arr = [];
		this.childs.forEach(function (child) {
			arr.push(child.getValue());
		});
		return arr;
	} else if (this.type == 'object') {
		var obj = {};
		this.childs.forEach(function (child) {
			obj[child.getField()] = child.getValue();
		});
		return obj;
	} else {
		if (this.value === undefined) {
			this._getDomValue();
		}

		return this.value;
	}
};

/**
 * Get the nesting level of this node
 * @return {Number} level
 */
jsoneditor.Node.prototype.getLevel = function () {
	return (this.parent ? this.parent.getLevel() + 1 : 0);
};

/**
 * Create a clone of a node
 * The complete state of a clone is copied, including whether it is expanded or
 * not. The DOM elements are not cloned.
 * @return {jsoneditor.Node} clone
 */
jsoneditor.Node.prototype.clone = function () {
	var clone = new jsoneditor.Node(this.editor);
	clone.type = this.type;
	clone.field = this.field;
	clone.fieldInnerText = this.fieldInnerText;
	clone.fieldEditable = this.fieldEditable;
	clone.value = this.value;
	clone.valueInnerText = this.valueInnerText;
	clone.expanded = this.expanded;

	if (this.childs) {
		// an object or array
		var cloneChilds = [];
		this.childs.forEach(function (child) {
			var childClone = child.clone();
			childClone.setParent(clone);
			cloneChilds.push(childClone);
		});
		clone.childs = cloneChilds;
	} else {
		// a value
		clone.childs = undefined;
	}

	return clone;
};

/**
 * Expand this node and optionally its childs.
 * @param {boolean} [recurse] Optional recursion, true by default. When
 *                            true, all childs will be expanded recursively
 */
jsoneditor.Node.prototype.expand = function (recurse) {
	if (!this.childs) {
		return;
	}

	// set this node expanded
	this.expanded = true;
	if (this.dom.expand) {
		this.dom.expand.className = 'expanded';
	}

	this.showChilds();

	if (recurse != false) {
		this.childs.forEach(function (child) {
			child.expand(recurse);
		});
	}
};

/**
 * Collapse this node and optionally its childs.
 * @param {boolean} [recurse] Optional recursion, true by default. When
 *                            true, all childs will be collapsed recursively
 */
jsoneditor.Node.prototype.collapse = function (recurse) {
	if (!this.childs) {
		return;
	}

	this.hideChilds();

	// collapse childs in case of recurse
	if (recurse != false) {
		this.childs.forEach(function (child) {
			child.collapse(recurse);
		});

	}

	// make this node collapsed
	if (this.dom.expand) {
		this.dom.expand.className = 'collapsed';
	}
	this.expanded = false;
};

/**
 * Recursively show all childs when they are expanded
 */
jsoneditor.Node.prototype.showChilds = function () {
	var childs = this.childs;
	if (!childs) {
		return;
	}
	if (!this.expanded) {
		return;
	}

	var tr = this.dom.tr;
	var table = tr ? tr.parentNode : undefined;
	if (table) {
		// show row with append button
		var append = this.getAppend();
		var nextTr = tr.nextSibling;
		if (nextTr) {
			table.insertBefore(append, nextTr);
		} else {
			table.appendChild(append);
		}

		// show childs
		this.childs.forEach(function (child) {
			table.insertBefore(child.getDom(), append);
			child.showChilds();
		});
	}
};

/**
 * Hide the node with all its childs
 */
jsoneditor.Node.prototype.hide = function () {
	var tr = this.dom.tr;
	var table = tr ? tr.parentNode : undefined;
	if (table) {
		table.removeChild(tr);
	}
	this.hideChilds();
};


/**
 * Recursively hide all childs
 */
jsoneditor.Node.prototype.hideChilds = function () {
	var childs = this.childs;
	if (!childs) {
		return;
	}
	if (!this.expanded) {
		return;
	}

	// hide append row
	var append = this.getAppend();
	if (append.parentNode) {
		append.parentNode.removeChild(append);
	}

	// hide childs
	this.childs.forEach(function (child) {
		child.hide();
	});
};


/**
 * Add a new child to the node.
 * Only applicable when Node value is of type array or object
 * @param {jsoneditor.Node} node
 */
jsoneditor.Node.prototype.appendChild = function (node) {
	if (this._hasChilds()) {
		// adjust the link to the parent
		node.setParent(this);
		node.fieldEditable = (this.type == 'object');
		if (this.type == 'array') {
			node.index = this.childs.length;
		}
		this.childs.push(node);

		if (this.expanded) {
			// insert into the DOM, before the appendRow
			var newTr = node.getDom();
			var appendTr = this.getAppend();
			var table = appendTr ? appendTr.parentNode : undefined;
			if (appendTr && table) {
				table.insertBefore(newTr, appendTr);
			}

			node.showChilds();
		}

		this.updateDom({
			'updateIndexes': true
		});
		node.updateDom({
			'recurse': true
		});
	}
};


/**
 * Move a node from its current parent to this node
 * Only applicable when Node value is of type array or object
 * @param {jsoneditor.Node} node
 * @param {jsoneditor.Node} beforeNode
 */
jsoneditor.Node.prototype.moveBefore = function (node, beforeNode) {
	if (this._hasChilds()) {
		// create a temporary row, to prevent the scroll position from jumping
		// when removing the node
		var tbody = (this.dom.tr) ? this.dom.tr.parentNode : undefined;
		if (tbody) {
			var trTemp = document.createElement('tr');
			trTemp.style.height = tbody.clientHeight + 'px';
			tbody.appendChild(trTemp);
		}

		if (node.parent) {
			node.parent.removeChild(node);
		}

		if (beforeNode instanceof jsoneditor.AppendNode) {
			this.appendChild(node);
		} else {
			this.insertBefore(node, beforeNode);
		}

		if (tbody) {
			tbody.removeChild(trTemp);
		}
	}
};

/**
 * Move a node from its current parent to this node
 * Only applicable when Node value is of type array or object.
 * If index is out of range, the node will be appended to the end
 * @param {jsoneditor.Node} node
 * @param {Number} index
 */
jsoneditor.Node.prototype.moveTo = function (node, index) {
	if (node.parent == this) {
		// same parent
		var currentIndex = this.childs.indexOf(node);
		if (currentIndex < index) {
			// compensate the index for removal of the node itself
			index++;
		}
	}

	var beforeNode = this.childs[index] || this.append;
	this.moveBefore(node, beforeNode);
};

/**
 * Insert a new child before a given node
 * Only applicable when Node value is of type array or object
 * @param {jsoneditor.Node} node
 * @param {jsoneditor.Node} beforeNode
 */
jsoneditor.Node.prototype.insertBefore = function (node, beforeNode) {
	if (this._hasChilds()) {
		if (beforeNode == this.append) {
			// append to the child nodes

			// adjust the link to the parent
			node.setParent(this);
			node.fieldEditable = (this.type == 'object');
			this.childs.push(node);
		} else {
			// insert before a child node
			var index = this.childs.indexOf(beforeNode);
			if (index == -1) {
				throw new Error('Node not found');
			}

			// adjust the link to the parent
			node.setParent(this);
			node.fieldEditable = (this.type == 'object');
			this.childs.splice(index, 0, node);
		}

		if (this.expanded) {
			// insert into the DOM
			var newTr = node.getDom();
			var nextTr = beforeNode.getDom();
			var table = nextTr ? nextTr.parentNode : undefined;
			if (nextTr && table) {
				table.insertBefore(newTr, nextTr);
			}

			node.showChilds();
		}

		this.updateDom({
			'updateIndexes': true
		});
		node.updateDom({
			'recurse': true
		});
	}
};

/**
 * Insert a new child before a given node
 * Only applicable when Node value is of type array or object
 * @param {jsoneditor.Node} node
 * @param {jsoneditor.Node} afterNode
 */
jsoneditor.Node.prototype.insertAfter = function (node, afterNode) {
	if (this._hasChilds()) {
		var index = this.childs.indexOf(afterNode);
		var beforeNode = this.childs[index + 1];
		if (beforeNode) {
			this.insertBefore(node, beforeNode);
		} else {
			this.appendChild(node);
		}
	}
};

/**
 * Search in this node
 * The node will be expanded when the text is found one of its childs, else
 * it will be collapsed. Searches are case insensitive.
 * @param {String} text
 * @return {jsoneditor.Node[]} results  Array with nodes containing the search text
 */
jsoneditor.Node.prototype.search = function (text) {
	var results = [];
	var index;
	var search = text ? text.toLowerCase() : undefined;

	// delete old search data
	delete this.searchField;
	delete this.searchValue;

	// search in field
	if (this.field != undefined) {
		var field = String(this.field).toLowerCase();
		index = field.indexOf(search);
		if (index != -1) {
			this.searchField = true;
			results.push({
				'node': this,
				'elem': 'field'
			});
		}

		// update dom
		this._updateDomField();
	}

	// search in value
	if (this._hasChilds()) {
		// array, object

		// search the nodes childs
		if (this.childs) {
			var childResults = [];
			this.childs.forEach(function (child) {
				childResults = childResults.concat(child.search(text));
			});
			results = results.concat(childResults);
		}

		// update dom
		if (search != undefined) {
			var recurse = false;
			if (childResults.length == 0) {
				this.collapse(recurse);
			} else {
				this.expand(recurse);
			}
		}
	} else {
		// string, auto
		if (this.value != undefined) {
			var value = String(this.value).toLowerCase();
			index = value.indexOf(search);
			if (index != -1) {
				this.searchValue = true;
				results.push({
					'node': this,
					'elem': 'value'
				});
			}
		}

		// update dom
		this._updateDomValue();
	}

	return results;
};

/**
 * Move the scroll position such that this node is in the visible area.
 * The node will not get the focus
 * @param {function(boolean)} [callback]
 */
jsoneditor.Node.prototype.scrollTo = function (callback) {
	if (!this.dom.tr || !this.dom.tr.parentNode) {
		// if the node is not visible, expand its parents
		var parent = this.parent;
		var recurse = false;
		while (parent) {
			parent.expand(recurse);
			parent = parent.parent;
		}
	}

	if (this.dom.tr && this.dom.tr.parentNode) {
		this.editor.scrollTo(this.dom.tr.offsetTop, callback);
	}
};


// stores the element name currently having the focus
jsoneditor.Node.focusElement = undefined;

/**
 * Set focus to this node
 * @param {String} [elementName]  The field name of the element to get the
 *                                focus available values: 'drag', 'menu',
 *                                'expand', 'field', 'value' (default)
 */
jsoneditor.Node.prototype.focus = function (elementName) {
	jsoneditor.Node.focusElement = elementName;

	if (this.dom.tr && this.dom.tr.parentNode) {
		var dom = this.dom;

		switch (elementName) {
			case 'drag':
				if (dom.drag) {
					dom.drag.focus();
				} else {
					dom.menu.focus();
				}
				break;

			case 'menu':
				dom.menu.focus();
				break;

			case 'expand':
				if (this._hasChilds()) {
					dom.expand.focus();
				} else if (dom.field && this.fieldEditable) {
					dom.field.focus();
					jsoneditor.util.selectContentEditable(dom.field);
				} else if (dom.value && !this._hasChilds()) {
					dom.value.focus();
					jsoneditor.util.selectContentEditable(dom.value);
				} else {
					dom.menu.focus();
				}
				break;

			case 'field':
				if (dom.field && this.fieldEditable) {
					dom.field.focus();
					jsoneditor.util.selectContentEditable(dom.field);
				} else if (dom.value && !this._hasChilds()) {
					dom.value.focus();
					jsoneditor.util.selectContentEditable(dom.value);
				} else if (this._hasChilds()) {
					dom.expand.focus();
				} else {
					dom.menu.focus();
				}
				break;

			case 'value':
			default:
				if (dom.value && !this._hasChilds()) {
					dom.value.focus();
					jsoneditor.util.selectContentEditable(dom.value);
				} else if (dom.field && this.fieldEditable) {
					dom.field.focus();
					jsoneditor.util.selectContentEditable(dom.field);
				} else if (this._hasChilds()) {
					dom.expand.focus();
				} else {
					dom.menu.focus();
				}
				break;
		}
	}
};

/**
 * Select all text in an editable div after a delay of 0 ms
 * @param {Element} editableDiv
 */
jsoneditor.Node.select = function (editableDiv) {
	setTimeout(function () {
		jsoneditor.util.selectContentEditable(editableDiv);
	}, 0);
};

/**
 * Update the values from the DOM field and value of this node
 */
jsoneditor.Node.prototype.blur = function () {
	// retrieve the actual field and value from the DOM.
	this._getDomValue(false);
	this._getDomField(false);
};

/**
 * Duplicate given child node
 * new structure will be added right before the cloned node
 * @param {jsoneditor.Node} node           the childNode to be duplicated
 * @return {jsoneditor.Node} clone         the clone of the node
 * @private
 */
jsoneditor.Node.prototype._duplicate = function (node) {
	var clone = node.clone();

	/* TODO: adjust the field name (to prevent equal field names)
     if (this.type == 'object') {
     }
     */

	this.insertAfter(clone, node);

	return clone;
};

/**
 * Check if given node is a child. The method will check recursively to find
 * this node.
 * @param {jsoneditor.Node} node
 * @return {boolean} containsNode
 */
jsoneditor.Node.prototype.containsNode = function (node) {
	if (this == node) {
		return true;
	}

	var childs = this.childs;
	if (childs) {
		// TODO: use the js5 Array.some() here?
		for (var i = 0, iMax = childs.length; i < iMax; i++) {
			if (childs[i].containsNode(node)) {
				return true;
			}
		}
	}

	return false;
};

/**
 * Move given node into this node
 * @param {jsoneditor.Node} node           the childNode to be moved
 * @param {jsoneditor.Node} beforeNode     node will be inserted before given
 *                                         node. If no beforeNode is given,
 *                                         the node is appended at the end
 * @private
 */
jsoneditor.Node.prototype._move = function (node, beforeNode) {
	if (node == beforeNode) {
		// nothing to do...
		return;
	}

	// check if this node is not a child of the node to be moved here
	if (node.containsNode(this)) {
		throw new Error('Cannot move a field into a child of itself');
	}

	// remove the original node
	if (node.parent) {
		node.parent.removeChild(node);
	}

	// create a clone of the node
	var clone = node.clone();
	node.clearDom();

	// insert or append the node
	if (beforeNode) {
		this.insertBefore(clone, beforeNode);
	} else {
		this.appendChild(clone);
	}

	/* TODO: adjust the field name (to prevent equal field names)
     if (this.type == 'object') {
     }
     */
};

/**
 * Remove a child from the node.
 * Only applicable when Node value is of type array or object
 * @param {jsoneditor.Node} node   The child node to be removed;
 * @return {jsoneditor.Node | undefined} node  The removed node on success,
 *                                             else undefined
 */
jsoneditor.Node.prototype.removeChild = function (node) {
	if (this.childs) {
		var index = this.childs.indexOf(node);

		if (index != -1) {
			node.hide();

			// delete old search results
			delete node.searchField;
			delete node.searchValue;

			var removedNode = this.childs.splice(index, 1)[0];

			this.updateDom({
				'updateIndexes': true
			});

			return removedNode;
		}
	}

	return undefined;
};

/**
 * Remove a child node node from this node
 * This method is equal to Node.removeChild, except that _remove firex an
 * onChange event.
 * @param {jsoneditor.Node} node
 * @private
 */
jsoneditor.Node.prototype._remove = function (node) {
	this.removeChild(node);
};

/**
 * Change the type of the value of this Node
 * @param {String} newType
 */
jsoneditor.Node.prototype.changeType = function (newType) {
	var oldType = this.type;

	if (oldType == newType) {
		// type is not changed
		return;
	}

	if ((newType == 'string' || newType == 'auto') && (oldType == 'string' || oldType == 'auto')) {
		// this is an easy change
		this.type = newType;
	} else {
		// change from array to object, or from string/auto to object/array
		var table = this.dom.tr ? this.dom.tr.parentNode : undefined;
		var lastTr;
		if (this.expanded) {
			lastTr = this.getAppend();
		} else {
			lastTr = this.getDom();
		}
		var nextTr = (lastTr && lastTr.parentNode) ? lastTr.nextSibling : undefined;

		// hide current field and all its childs
		this.hide();
		this.clearDom();

		// adjust the field and the value
		this.type = newType;

		// adjust childs
		if (newType == 'object') {
			if (!this.childs) {
				this.childs = [];
			}

			this.childs.forEach(function (child, index) {
				child.clearDom();
				delete child.index;
				child.fieldEditable = true;
				if (child.field == undefined) {
					child.field = '';
				}
			});

			if (oldType == 'string' || oldType == 'auto') {
				this.expanded = true;
			}
		} else if (newType == 'array') {
			if (!this.childs) {
				this.childs = [];
			}

			this.childs.forEach(function (child, index) {
				child.clearDom();
				child.fieldEditable = false;
				child.index = index;
			});

			if (oldType == 'string' || oldType == 'auto') {
				this.expanded = true;
			}
		} else {
			this.expanded = false;
		}

		// create new DOM
		if (table) {
			if (nextTr) {
				table.insertBefore(this.getDom(), nextTr);
			} else {
				table.appendChild(this.getDom());
			}
		}
		this.showChilds();
	}

	if (newType == 'auto' || newType == 'string') {
		// cast value to the correct type
		if (newType == 'string') {
			this.value = String(this.value);
		} else {
			this.value = this._stringCast(String(this.value));
		}

		this.focus();
	}

	this.updateDom({
		'updateIndexes': true
	});
};

/**
 * Retrieve value from DOM
 * @param {boolean} [silent]  If true (default), no errors will be thrown in
 *                            case of invalid data
 * @private
 */
jsoneditor.Node.prototype._getDomValue = function (silent) {
	if (this.dom.value && this.type != 'array' && this.type != 'object') {
		this.valueInnerText = jsoneditor.util.getInnerText(this.dom.value);
	}

	if (this.valueInnerText != undefined) {
		try {
			// retrieve the value
			var value;
			if (this.type == 'string') {
				value = this._unescapeHTML(this.valueInnerText);
			} else {
				var str = this._unescapeHTML(this.valueInnerText);
				value = this._stringCast(str);
			}
			if (value !== this.value) {
				var oldValue = this.value;
				this.value = value;
				this.editor._onAction('editValue', {
					'node': this,
					'oldValue': oldValue,
					'newValue': value,
					'oldSelection': this.editor.selection,
					'newSelection': this.editor.getSelection()
				});
			}
		} catch (err) {
			this.value = undefined;
			// TODO: sent an action with the new, invalid value?
			if (silent != true) {
				throw err;
			}
		}
	}
};

/**
 * Update dom value:
 * - the text color of the value, depending on the type of the value
 * - the height of the field, depending on the width
 * - background color in case it is empty
 * @private
 */
jsoneditor.Node.prototype._updateDomValue = function () {
	var domValue = this.dom.value;
	if (domValue) {
		// set text color depending on value type
		var v = this.value;
		var t = (this.type == 'auto') ? typeof (v) : this.type;
		var color = '';
		if (t == 'string') {
			color = 'green';
		} else if (t == 'number') {
			color = 'red';
		} else if (t == 'boolean') {
			color = 'blue';
		} else if (this._hasChilds()) {
			// note: typeof(null)=="object", therefore check this.type instead of t
			color = '';
		} else if (v === null) {
			color = 'purple';
		} else {
			// invalid value
			color = 'black';
		}
		domValue.style.color = color;

		// make backgound color lightgray when empty
		var isEmpty = (String(this.value) == '' && this.type != 'array' && this.type != 'object');
		if (isEmpty) {
			jsoneditor.util.addClassName(domValue, 'empty');
		} else {
			jsoneditor.util.removeClassName(domValue, 'empty');
		}

		// highlight when there is a search result
		if (this.searchValueActive) {
			jsoneditor.util.addClassName(domValue, 'highlight-active');
		} else {
			jsoneditor.util.removeClassName(domValue, 'highlight-active');
		}
		if (this.searchValue) {
			jsoneditor.util.addClassName(domValue, 'highlight');
		} else {
			jsoneditor.util.removeClassName(domValue, 'highlight');
		}

		// strip formatting from the contents of the editable div
		jsoneditor.util.stripFormatting(domValue);
	}
};

/**
 * Update dom field:
 * - the text color of the field, depending on the text
 * - the height of the field, depending on the width
 * - background color in case it is empty
 * @private
 */
jsoneditor.Node.prototype._updateDomField = function () {
	var domField = this.dom.field;
	if (domField) {
		// make backgound color lightgray when empty
		var isEmpty = (String(this.field) == '' && this.parent.type != 'array');
		if (isEmpty) {
			jsoneditor.util.addClassName(domField, 'empty');
		} else {
			jsoneditor.util.removeClassName(domField, 'empty');
		}

		// highlight when there is a search result
		if (this.searchFieldActive) {
			jsoneditor.util.addClassName(domField, 'highlight-active');
		} else {
			jsoneditor.util.removeClassName(domField, 'highlight-active');
		}
		if (this.searchField) {
			jsoneditor.util.addClassName(domField, 'highlight');
		} else {
			jsoneditor.util.removeClassName(domField, 'highlight');
		}

		// strip formatting from the contents of the editable div
		jsoneditor.util.stripFormatting(domField);
	}
};

/**
 * Retrieve field from DOM
 * @param {boolean} [silent]  If true (default), no errors will be thrown in
 *                            case of invalid data
 * @private
 */
jsoneditor.Node.prototype._getDomField = function (silent) {
	if (this.dom.field && this.fieldEditable) {
		this.fieldInnerText = jsoneditor.util.getInnerText(this.dom.field);
	}

	if (this.fieldInnerText != undefined) {
		try {
			var field = this._unescapeHTML(this.fieldInnerText);

			if (field !== this.field) {
				var oldField = this.field;
				this.field = field;
				this.editor._onAction('editField', {
					'node': this,
					'oldValue': oldField,
					'newValue': field,
					'oldSelection': this.editor.selection,
					'newSelection': this.editor.getSelection()
				});
			}
		} catch (err) {
			this.field = undefined;
			// TODO: sent an action here, with the new, invalid value?
			if (silent != true) {
				throw err;
			}
		}
	}
};

/**
 * Clear the dom of the node
 */
jsoneditor.Node.prototype.clearDom = function () {
	// TODO: hide the node first?
	//this.hide();
	// TOOD: recursively clear dom?

	this.dom = {};
};

/**
 * Get the HTML DOM TR element of the node.
 * The dom will be generated when not yet created
 * @return {Element} tr    HTML DOM TR Element
 */
jsoneditor.Node.prototype.getDom = function () {
	var dom = this.dom;
	if (dom.tr) {
		return dom.tr;
	}

	// create row
	dom.tr = document.createElement('tr');
	dom.tr.node = this;

	if (this.editor.mode.editor) {
		// create draggable area
		var tdDrag = document.createElement('td');
		var domDrag = document.createElement('button');
		dom.drag = domDrag;
		domDrag.className = 'dragarea';
		domDrag.title = 'Drag to move this field (Alt+Shift+Arrows)';
		if (domDrag) {
			tdDrag.appendChild(domDrag);
		}
		dom.tr.appendChild(tdDrag);

		// create context menu
		var tdMenu = document.createElement('td');
		var menu = document.createElement('button');
		dom.menu = menu;
		menu.className = 'contextmenu';
		menu.title = '菜单 (Ctrl+M)';
		tdMenu.appendChild(dom.menu);
		dom.tr.appendChild(tdMenu);
	}

	// create tree and field
	var tdField = document.createElement('td');
	dom.tr.appendChild(tdField);
	dom.tree = this._createDomTree();
	tdField.appendChild(dom.tree);

	this.updateDom({
		'updateIndexes': true
	});

	return dom.tr;
};

/**
 * DragStart event, fired on mousedown on the dragarea at the left side of a Node
 * @param {Event} event
 * @private
 */
jsoneditor.Node.prototype._onDragStart = function (event) {
	event = event || window.event;

	var node = this;
	if (!this.mousemove) {
		this.mousemove = jsoneditor.util.addEventListener(document, 'mousemove',

		function (event) {
			node._onDrag(event);
		});
	}

	if (!this.mouseup) {
		this.mouseup = jsoneditor.util.addEventListener(document, 'mouseup',

		function (event) {
			node._onDragEnd(event);
		});
	}

	this.editor.highlighter.lock();
	this.drag = {
		'oldCursor': document.body.style.cursor,
		'startParent': this.parent,
		'startIndex': this.parent.childs.indexOf(this),
		'mouseX': jsoneditor.util.getMouseX(event),
		'level': this.getLevel()
	};
	document.body.style.cursor = 'move';

	jsoneditor.util.preventDefault(event);
};

/**
 * Drag event, fired when moving the mouse while dragging a Node
 * @param {Event} event
 * @private
 */
jsoneditor.Node.prototype._onDrag = function (event) {
	// TODO: this method has grown to large. Split it in a number of methods
	event = event || window.event;
	// TODO: make a separate function to get the absolute mouseY and mouseX
	var mouseY = jsoneditor.util.getMouseY(event);
	var mouseX = jsoneditor.util.getMouseX(event);

	var trThis, trPrev, trNext, trFirst, trLast, trRoot;
	var nodePrev, nodeNext;
	var topThis, topPrev, topFirst, heightThis, bottomNext, heightNext;
	var moved = false;

	// TODO: add an ESC option, which resets to the original position

	// move up/down
	trThis = this.dom.tr;
	topThis = jsoneditor.util.getAbsoluteTop(trThis);
	heightThis = trThis.offsetHeight;
	if (mouseY < topThis) {
		// move up
		trPrev = trThis;
		do {
			trPrev = trPrev.previousSibling;
			nodePrev = jsoneditor.Node.getNodeFromTarget(trPrev);
			topPrev = trPrev ? jsoneditor.util.getAbsoluteTop(trPrev) : 0;
		}
		while (trPrev && mouseY < topPrev);

		if (nodePrev && !nodePrev.parent) {
			nodePrev = undefined;
		}

		if (!nodePrev) {
			// move to the first node
			trRoot = trThis.parentNode.firstChild;
			trPrev = trRoot ? trRoot.nextSibling : undefined;
			nodePrev = jsoneditor.Node.getNodeFromTarget(trPrev);
			if (nodePrev == this) {
				nodePrev = undefined;
			}
		}

		if (nodePrev) {
			// check if mouseY is really inside the found node
			trPrev = nodePrev.dom.tr;
			topPrev = trPrev ? jsoneditor.util.getAbsoluteTop(trPrev) : 0;
			if (mouseY > topPrev + heightThis) {
				nodePrev = undefined;
			}
		}

		if (nodePrev) {
			nodePrev.parent.moveBefore(this, nodePrev);
			moved = true;
		}
	} else {
		// move down
		trLast = (this.expanded && this.append) ? this.append.getDom() : this.dom.tr;
		trFirst = trLast ? trLast.nextSibling : undefined;
		if (trFirst) {
			topFirst = jsoneditor.util.getAbsoluteTop(trFirst);
			trNext = trFirst;
			do {
				nodeNext = jsoneditor.Node.getNodeFromTarget(trNext);
				if (trNext) {
					bottomNext = trNext.nextSibling ? jsoneditor.util.getAbsoluteTop(trNext.nextSibling) : 0;
					heightNext = trNext ? (bottomNext - topFirst) : 0;

					if (nodeNext.parent.childs.length == 1 && nodeNext.parent.childs[0] == this) {
						// We are about to remove the last child of this parent,
						// which will make the parents appendNode visible.
						topThis += 24 - 1;
						// TODO: dangerous to suppose the height of the appendNode a constant of 24-1 px.
					}
				}

				trNext = trNext.nextSibling;
			}
			while (trNext && mouseY > topThis + heightNext);

			if (nodeNext && nodeNext.parent) {
				// calculate the desired level
				var diffX = (mouseX - this.drag.mouseX);
				var diffLevel = Math.round(diffX / 24 / 2);
				var level = this.drag.level + diffLevel; // desired level
				var levelNext = nodeNext.getLevel(); // level to be

				// find the best fitting level (move upwards over the append nodes)
				trPrev = nodeNext.dom.tr.previousSibling;
				while (levelNext < level && trPrev) {
					nodePrev = jsoneditor.Node.getNodeFromTarget(trPrev);
					if (nodePrev == this || nodePrev._isChildOf(this)) {
						// neglect itself and its childs
					} else if (nodePrev instanceof jsoneditor.AppendNode) {
						var childs = nodePrev.parent.childs;
						if (childs.length > 1 || (childs.length == 1 && childs[0] != this)) {
							// non-visible append node of a list of childs
							// consisting of not only this node (else the
							// append node will change into a visible "empty"
							// text when removing this node).
							nodeNext = jsoneditor.Node.getNodeFromTarget(trPrev);
							levelNext = nodeNext.getLevel();
						} else {
							break;
						}
					} else {
						break;
					}

					trPrev = trPrev.previousSibling;
				}

				// move the node when its position is changed
				if (trLast.nextSibling != nodeNext.dom.tr) {
					nodeNext.parent.moveBefore(this, nodeNext);
					moved = true;
				}
			}
		}
	}

	if (moved) {
		// update the dragging parameters when moved
		this.drag.mouseX = mouseX;
		this.drag.level = this.getLevel();
	}

	// auto scroll when hovering around the top of the editor
	this.editor.startAutoScroll(mouseY);

	jsoneditor.util.preventDefault(event);
};

/**
 * Drag event, fired on mouseup after having dragged a node
 * @param {Event} event
 * @private
 */
jsoneditor.Node.prototype._onDragEnd = function (event) {
	event = event || window.event;

	var params = {
		'node': this,
		'startParent': this.drag.startParent,
		'startIndex': this.drag.startIndex,
		'endParent': this.parent,
		'endIndex': this.parent.childs.indexOf(this)
	};
	if ((params.startParent != params.endParent) || (params.startIndex != params.endIndex)) {
		// only register this action if the node is actually moved to another place
		this.editor._onAction('moveNode', params);
	}

	document.body.style.cursor = this.drag.oldCursor;
	this.editor.highlighter.unlock();
	delete this.drag;

	if (this.mousemove) {
		jsoneditor.util.removeEventListener(document, 'mousemove', this.mousemove);
		delete this.mousemove;
	}
	if (this.mouseup) {
		jsoneditor.util.removeEventListener(document, 'mouseup', this.mouseup);
		delete this.mouseup;
	}

	// Stop any running auto scroll
	this.editor.stopAutoScroll();

	jsoneditor.util.preventDefault(event);
};

/**
 * Test if this node is a child of an other node
 * @param {jsoneditor.Node} node
 * @return {boolean} isChild
 * @private
 */
jsoneditor.Node.prototype._isChildOf = function (node) {
	var n = this.parent;
	while (n) {
		if (n == node) {
			return true;
		}
		n = n.parent;
	}

	return false;
};

/**
 * Create an editable field
 * @return {Element} domField
 * @private
 */
jsoneditor.Node.prototype._createDomField = function () {
	return document.createElement('div');
};

/**
 * Set highlighting for this node and all its childs.
 * Only applied to the currently visible (expanded childs)
 * @param {boolean} highlight
 */
jsoneditor.Node.prototype.setHighlight = function (highlight) {
	if (this.dom.tr) {
		this.dom.tr.className = (highlight ? 'highlight' : '');

		if (this.append) {
			this.append.setHighlight(highlight);
		}

		if (this.childs) {
			this.childs.forEach(function (child) {
				child.setHighlight(highlight);
			});
		}
	}
};

/**
 * Update the value of the node. Only primitive types are allowed, no Object
 * or Array is allowed.
 * @param {String | Number | Boolean | null} value
 */
jsoneditor.Node.prototype.updateValue = function (value) {
	this.value = value;
	this.updateDom();
};

/**
 * Update the field of the node.
 * @param {String} field
 */
jsoneditor.Node.prototype.updateField = function (field) {
	this.field = field;
	this.updateDom();
};

/**
 * Update the HTML DOM, optionally recursing through the childs
 * @param {Object} [options] Available parameters:
 *                          {boolean} [recurse]         If true, the
 *                          DOM of the childs will be updated recursively.
 *                          False by default.
 *                          {boolean} [updateIndexes]   If true, the childs
 *                          indexes of the node will be updated too. False by
 *                          default.
 */
jsoneditor.Node.prototype.updateDom = function (options) {
	// update level indentation
	var domTree = this.dom.tree;
	if (domTree) {
		domTree.style.marginLeft = this.getLevel() * 24 + 'px';
	}

	// update field
	var domField = this.dom.field;
	if (domField) {
		if (this.fieldEditable == true) {
			// parent is an object
			domField.contentEditable = this.editor.mode.editor;
			domField.spellcheck = false;
			domField.className = 'field';
		} else {
			// parent is an array this is the root node
			domField.className = 'readonly';
		}

		var field;
		if (this.index != undefined) {
			field = this.index;
		} else if (this.field != undefined) {
			field = this.field;
		} else if (this._hasChilds()) {
			field = this.type;
		} else {
			field = '';
		}
		domField.innerHTML = this._escapeHTML(field);
	}

	// update value
	var domValue = this.dom.value;
	if (domValue) {
		var count = this.childs ? this.childs.length : 0;
		if (this.type == 'array') {
			domValue.innerHTML = '[' + count + ']';
			domValue.title = this.type + ' containing ' + count + ' items';
		} else if (this.type == 'object') {
			domValue.innerHTML = '{' + count + '}';
			domValue.title = this.type + ' containing ' + count + ' items';
		} else {
			domValue.innerHTML = this._escapeHTML(this.value);
			delete domValue.title;
		}
	}

	// update field and value
	this._updateDomField();
	this._updateDomValue();

	// update childs indexes
	if (options && options.updateIndexes == true) {
		// updateIndexes is true or undefined
		this._updateDomIndexes();
	}

	if (options && options.recurse == true) {
		// recurse is true or undefined. update childs recursively
		if (this.childs) {
			this.childs.forEach(function (child) {
				child.updateDom(options);
			});
		}
	}

	// update row with append button
	if (this.append) {
		this.append.updateDom();
	}
};

/**
 * Update the DOM of the childs of a node: update indexes and undefined field
 * names.
 * Only applicable when structure is an array or object
 * @private
 */
jsoneditor.Node.prototype._updateDomIndexes = function () {
	var domValue = this.dom.value;
	var childs = this.childs;
	if (domValue && childs) {
		if (this.type == 'array') {
			childs.forEach(function (child, index) {
				child.index = index;
				var childField = child.dom.field;
				if (childField) {
					childField.innerHTML = index;
				}
			});
		} else if (this.type == 'object') {
			childs.forEach(function (child) {
				if (child.index != undefined) {
					delete child.index;

					if (child.field == undefined) {
						child.field = '';
					}
				}
			});
		}
	}
};

/**
 * Create an editable value
 * @private
 */
jsoneditor.Node.prototype._createDomValue = function () {
	var domValue;

	if (this.type == 'array') {
		domValue = document.createElement('div');
		domValue.className = 'readonly';
		domValue.innerHTML = '[...]';
	} else if (this.type == 'object') {
		domValue = document.createElement('div');
		domValue.className = 'readonly';
		domValue.innerHTML = '{...}';
	} else if (this.type == 'string') {
		domValue = document.createElement('div');
		domValue.contentEditable = !this.editor.mode.viewer;
		domValue.spellcheck = false;
		domValue.className = 'value';
		domValue.innerHTML = this._escapeHTML(this.value);
	} else {
		domValue = document.createElement('div');
		domValue.contentEditable = !this.editor.mode.viewer;
		domValue.spellcheck = false;
		domValue.className = 'value';
		domValue.innerHTML = this._escapeHTML(this.value);
	}

	// TODO: in FF spel/check of editable divs is done via the body. quite ugly
	// document.body.spellcheck = false;

	return domValue;
};

/**
 * Create an expand/collapse button
 * @return {Element} expand
 * @private
 */
jsoneditor.Node.prototype._createDomExpandButton = function () {
	// create expand button
	var expand = document.createElement('button');
	if (this._hasChilds()) {
		expand.className = this.expanded ? 'expanded' : 'collapsed';
		expand.title =
			'"单击" 展开/折叠(Ctrl+E). \n' +
			'Ctrl+"单击" 打开/折叠 所有子节点.';
	} else {
		expand.className = 'invisible';
		expand.title = '';
	}

	return expand;
};


/**
 * Create a DOM tree element, containing the expand/collapse button
 * @return {Element} domTree
 * @private
 */
jsoneditor.Node.prototype._createDomTree = function () {
	var dom = this.dom;
	var domTree = document.createElement('table');
	var tbody = document.createElement('tbody');
	domTree.style.borderCollapse = 'collapse'; // TODO: put in css
	domTree.appendChild(tbody);
	var tr = document.createElement('tr');
	tbody.appendChild(tr);

	// create expand button
	var tdExpand = document.createElement('td');
	tdExpand.className = 'tree';
	tr.appendChild(tdExpand);
	dom.expand = this._createDomExpandButton();
	tdExpand.appendChild(dom.expand);
	dom.tdExpand = tdExpand;

	// create the field
	var tdField = document.createElement('td');
	tdField.className = 'tree';
	tr.appendChild(tdField);
	dom.field = this._createDomField();
	tdField.appendChild(dom.field);
	dom.tdField = tdField;

	// create a separator
	var tdSeparator = document.createElement('td');
	tdSeparator.className = 'tree';
	tr.appendChild(tdSeparator);
	if (this.type != 'object' && this.type != 'array') {
		tdSeparator.appendChild(document.createTextNode(':'));
		tdSeparator.className = 'separator';
	}
	dom.tdSeparator = tdSeparator;

	// create the value
	var tdValue = document.createElement('td');
	tdValue.className = 'tree';
	tr.appendChild(tdValue);
	dom.value = this._createDomValue();
	tdValue.appendChild(dom.value);
	dom.tdValue = tdValue;

	return domTree;
};

/**
 * Handle an event. The event is catched centrally by the editor
 * @param {Event} event
 */
jsoneditor.Node.prototype.onEvent = function (event) {
	var type = event.type;
	var target = event.target || event.srcElement;
	var dom = this.dom;
	var node = this;
	var expandable = this._hasChilds();

	// check if mouse is on menu or on dragarea.
	// If so, highlight current row and its childs
	if (target == dom.drag || target == dom.menu) {
		if (type == 'mouseover') {
			this.editor.highlighter.highlight(this);
		} else if (type == 'mouseout') {
			this.editor.highlighter.unhighlight();
		}
	}

	// drag events
	if (type == 'mousedown' && target == dom.drag) {
		this._onDragStart(event);
	}

	// context menu events
	if (type == 'click' && target == dom.menu) {
		var highlighter = node.editor.highlighter;
		highlighter.highlight(node);
		highlighter.lock();
		jsoneditor.util.addClassName(dom.menu, 'selected');
		this.showContextMenu(dom.menu, function () {
			jsoneditor.util.removeClassName(dom.menu, 'selected');
			highlighter.unlock();
			highlighter.unhighlight();
		});
	}

	// expand events
	var domExpand = dom.expand;
	if (type == 'click' && target == dom.expand) {
		if (expandable) {
			var recurse = event.ctrlKey; // with ctrl-key, expand/collapse all
			this._onExpand(recurse);
		}
	}

	// value events
	var domValue = dom.value;
	if (target == domValue) {
		switch (type) {
			case 'focus':
				jsoneditor.JSONEditor.focusNode = this;
				break;

			case 'blur':
			case 'change':
				this._getDomValue(true);
				this._updateDomValue();
				if (this.value) {
					domValue.innerHTML = this._escapeHTML(this.value);
				}
				break;

			case 'input':
				this._getDomValue(true);
				this._updateDomValue();
				break;

			case 'keydown':
			case 'mousedown':
				this.editor.selection = this.editor.getSelection();
				break;

			case 'keyup':
				this._getDomValue(true);
				this._updateDomValue();
				break;

			case 'cut':
			case 'paste':
				setTimeout(function () {
					node._getDomValue(true);
					node._updateDomValue();
				}, 1);
				break;
		}
	}

	// field events
	var domField = dom.field;
	if (target == domField) {
		switch (type) {
			case 'focus':
				jsoneditor.JSONEditor.focusNode = this;
				break;

			case 'blur':
			case 'change':
				this._getDomField(true);
				this._updateDomField();
				if (this.field) {
					domField.innerHTML = this._escapeHTML(this.field);
				}
				break;

			case 'input':
				this._getDomField(true);
				this._updateDomField();
				break;

			case 'keydown':
			case 'mousedown':
				this.editor.selection = this.editor.getSelection();
				break;

			case 'keyup':
				this._getDomField(true);
				this._updateDomField();
				break;

			case 'cut':
			case 'paste':
				setTimeout(function () {
					node._getDomField(true);
					node._updateDomField();
				}, 1);
				break;
		}
	}

	// focus
	// when clicked in whitespace left or right from the field or value, set focus
	var domTree = dom.tree;
	if (target == domTree.parentNode) {
		switch (type) {
			case 'click':
				var left = (event.offsetX != undefined) ? (event.offsetX < (this.getLevel() + 1) * 24) : (jsoneditor.util.getMouseX(event) < jsoneditor.util.getAbsoluteLeft(dom.tdSeparator)); // for FF
				if (left || expandable) {
					// node is expandable when it is an object or array
					if (domField) {
						jsoneditor.util.setEndOfContentEditable(domField);
						domField.focus();
					}
				} else {
					if (domValue) {
						jsoneditor.util.setEndOfContentEditable(domValue);
						domValue.focus();
					}
				}
				break;
		}
	}
	if ((target == dom.tdExpand && !expandable) || target == dom.tdField || target == dom.tdSeparator) {
		switch (type) {
			case 'click':
				if (domField) {
					jsoneditor.util.setEndOfContentEditable(domField);
					domField.focus();
				}
				break;
		}
	}

	if (type == 'keydown') {
		this.onKeyDown(event);
	}
};

/**
 * Key down event handler
 * @param {Event} event
 */
jsoneditor.Node.prototype.onKeyDown = function (event) {
	var keynum = event.which || event.keyCode;
	var target = event.target || event.srcElement;
	var ctrlKey = event.ctrlKey;
	var shiftKey = event.shiftKey;
	var altKey = event.altKey;
	var handled = false;
	var prevNode, nextNode, nextDom, nextDom2;

	// console.log(ctrlKey, keynum, event.charCode); // TODO: cleanup
	if (keynum == 68) { // D
		if (ctrlKey) { // Ctrl+D
			this._onDuplicate();
			handled = true;
		}
	} else if (keynum == 69) { // E
		if (ctrlKey) { // Ctrl+E and Ctrl+Shift+E
			this._onExpand(shiftKey); // recurse = shiftKey
			target.focus(); // TODO: should restore focus in case of recursing expand (which takes DOM offline)
			handled = true;
		}
	} else if (keynum == 77) { // M
		if (ctrlKey) { // Ctrl+M
			this.showContextMenu(target);
			handled = true;
		}
	} else if (keynum == 46) { // Del
		if (ctrlKey) { // Ctrl+Del
			this._onRemove();
			handled = true;
		}
	} else if (keynum == 45) { // Ins
		if (ctrlKey && !shiftKey) { // Ctrl+Ins
			this._onInsertBefore();
			handled = true;
		} else if (ctrlKey && shiftKey) { // Ctrl+Shift+Ins
			this._onInsertAfter();
			handled = true;
		}
	} else if (keynum == 35) { // End
		if (altKey) { // Alt+End
			// find the last node
			var lastNode = this._lastNode();
			if (lastNode) {
				lastNode.focus(jsoneditor.Node.focusElement || this._getElementName(target));
			}
			handled = true;
		}
	} else if (keynum == 36) { // Home
		if (altKey) { // Alt+Home
			// find the first node
			var firstNode = this._firstNode();
			if (firstNode) {
				firstNode.focus(jsoneditor.Node.focusElement || this._getElementName(target));
			}
			handled = true;
		}
	} else if (keynum == 37) { // Arrow Left
		if (altKey && !shiftKey) { // Alt + Arrow Left
			// move to left element
			var prevElement = this._previousElement(target);
			if (prevElement) {
				this.focus(this._getElementName(prevElement));
			}
			handled = true;
		} else if (altKey && shiftKey) { // Alt + Shift Arrow left
			if (this.expanded) {
				var appendDom = this.getAppend();
				nextDom = appendDom ? appendDom.nextSibling : undefined;
			} else {
				var dom = this.getDom();
				nextDom = dom.nextSibling;
			}
			if (nextDom) {
				nextNode = jsoneditor.Node.getNodeFromTarget(nextDom);
				nextDom2 = nextDom.nextSibling;
				nextNode2 = jsoneditor.Node.getNodeFromTarget(nextDom2);
				if (nextNode && nextNode instanceof jsoneditor.AppendNode && !(this.parent.childs.length == 1) && nextNode2 && nextNode2.parent) {
					nextNode2.parent.moveBefore(this, nextNode2);
					this.focus(jsoneditor.Node.focusElement || this._getElementName(target));
				}
			}
		}
	} else if (keynum == 38) { // Arrow Up
		if (altKey && !shiftKey) { // Alt + Arrow Up
			// find the previous node
			prevNode = this._previousNode();
			if (prevNode) {
				prevNode.focus(jsoneditor.Node.focusElement || this._getElementName(target));
			}
			handled = true;
		} else if (altKey && shiftKey) { // Alt + Shift + Arrow Up
			// find the previous node
			prevNode = this._previousNode();
			if (prevNode && prevNode.parent) {
				prevNode.parent.moveBefore(this, prevNode);
				this.focus(jsoneditor.Node.focusElement || this._getElementName(target));
			}
			handled = true;
		}
	} else if (keynum == 39) { // Arrow Right
		if (altKey && !shiftKey) { // Alt + Arrow Right
			// move to right element
			var nextElement = this._nextElement(target);
			if (nextElement) {
				this.focus(this._getElementName(nextElement));
			}
			handled = true;
		} else if (altKey && shiftKey) { // Alt + Shift Arrow Right
			dom = this.getDom();
			var prevDom = dom.previousSibling;
			if (prevDom) {
				prevNode = jsoneditor.Node.getNodeFromTarget(prevDom);
				if (prevNode && prevNode.parent && (prevNode instanceof jsoneditor.AppendNode) && !prevNode.isVisible()) {
					prevNode.parent.moveBefore(this, prevNode);
					this.focus(jsoneditor.Node.focusElement || this._getElementName(target));
				}
			}
		}
	} else if (keynum == 40) { // Arrow Down
		if (altKey && !shiftKey) { // Alt + Arrow Down
			// find the next node
			nextNode = this._nextNode();
			if (nextNode) {
				nextNode.focus(jsoneditor.Node.focusElement || this._getElementName(target));
			}
			handled = true;
		} else if (altKey && shiftKey) { // Alt + Shift + Arrow Down
			// find the 2nd next node and move before that one
			if (this.expanded) {
				nextNode = this.append ? this.append._nextNode() : undefined;
			} else {
				nextNode = this._nextNode();
			}
			nextDom = nextNode ? nextNode.getDom() : undefined;
			if (this.parent.childs.length == 1) {
				nextDom2 = nextDom;
			} else {
				nextDom2 = nextDom ? nextDom.nextSibling : undefined;
			}
			var nextNode2 = jsoneditor.Node.getNodeFromTarget(nextDom2);
			if (nextNode2 && nextNode2.parent) {
				nextNode2.parent.moveBefore(this, nextNode2);
				this.focus(jsoneditor.Node.focusElement || this._getElementName(target));
			}
			handled = true;
		}
	}

	if (handled) {
		jsoneditor.util.preventDefault(event);
		jsoneditor.util.stopPropagation(event);
	}
};

/**
 * Handle the expand event, when clicked on the expand button
 * @param {boolean} recurse   If true, child nodes will be expanded too
 * @private
 */
jsoneditor.Node.prototype._onExpand = function (recurse) {
	if (recurse) {
		// Take the table offline
		var table = this.dom.tr.parentNode; // TODO: not nice to access the main table like this
		var frame = table.parentNode;
		var scrollTop = frame.scrollTop;
		frame.removeChild(table);
	}

	if (this.expanded) {
		this.collapse(recurse);
	} else {
		this.expand(recurse);
	}

	if (recurse) {
		// Put the table online again
		frame.appendChild(table);
		frame.scrollTop = scrollTop;
	}
};

/**
 * Remove this node
 * @private
 */
jsoneditor.Node.prototype._onRemove = function () {
	this.editor.highlighter.unhighlight();
	var childs = this.parent.childs;
	var index = childs.indexOf(this);

	// adjust the focus
	var oldSelection = this.editor.getSelection();
	if (childs[index + 1]) {
		childs[index + 1].focus();
	} else if (childs[index - 1]) {
		childs[index - 1].focus();
	} else {
		this.parent.focus();
	}
	var newSelection = this.editor.getSelection();

	// remove the node
	this.parent._remove(this);

	// store history action
	this.editor._onAction('removeNode', {
		'node': this,
		'parent': this.parent,
		'index': index,
		'oldSelection': oldSelection,
		'newSelection': newSelection
	});
};

/**
 * Duplicate this node
 * @private
 */
jsoneditor.Node.prototype._onDuplicate = function () {
	var oldSelection = this.editor.getSelection();
	var clone = this.parent._duplicate(this);
	clone.focus();
	var newSelection = this.editor.getSelection();

	this.editor._onAction('duplicateNode', {
		'node': this,
		'clone': clone,
		'parent': this.parent,
		'oldSelection': oldSelection,
		'newSelection': newSelection
	});
};

/**
 * Handle insert before event
 * @param {String} [field]
 * @param {*} [value]
 * @param {String} [type]   Can be 'auto', 'array', 'object', or 'string'
 * @private
 */
jsoneditor.Node.prototype._onInsertBefore = function (field, value, type) {
	var oldSelection = this.editor.getSelection();

	var newNode = new jsoneditor.Node(this.editor, {
		'field': (field != undefined) ? field : '',
		'value': (value != undefined) ? value : '',
		'type': type
	});
	newNode.expand(true);
	this.parent.insertBefore(newNode, this);
	this.editor.highlighter.unhighlight();
	newNode.focus('field');
	var newSelection = this.editor.getSelection();

	this.editor._onAction('insertBeforeNode', {
		'node': newNode,
		'beforeNode': this,
		'parent': this.parent,
		'oldSelection': oldSelection,
		'newSelection': newSelection
	});
};

/**
 * Handle insert after event
 * @param {String} [field]
 * @param {*} [value]
 * @param {String} [type]   Can be 'auto', 'array', 'object', or 'string'
 * @private
 */
jsoneditor.Node.prototype._onInsertAfter = function (field, value, type) {
	var oldSelection = this.editor.getSelection();

	var newNode = new jsoneditor.Node(this.editor, {
		'field': (field != undefined) ? field : '',
		'value': (value != undefined) ? value : '',
		'type': type
	});
	newNode.expand(true);
	this.parent.insertAfter(newNode, this);
	this.editor.highlighter.unhighlight();
	newNode.focus('field');
	var newSelection = this.editor.getSelection();

	this.editor._onAction('insertAfterNode', {
		'node': newNode,
		'afterNode': this,
		'parent': this.parent,
		'oldSelection': oldSelection,
		'newSelection': newSelection
	});
};

/**
 * Handle append event
 * @param {String} [field]
 * @param {*} [value]
 * @param {String} [type]   Can be 'auto', 'array', 'object', or 'string'
 * @private
 */
jsoneditor.Node.prototype._onAppend = function (field, value, type) {
	var oldSelection = this.editor.getSelection();

	var newNode = new jsoneditor.Node(this.editor, {
		'field': (field != undefined) ? field : '',
		'value': (value != undefined) ? value : '',
		'type': type
	});
	newNode.expand(true);
	this.parent.appendChild(newNode);
	this.editor.highlighter.unhighlight();
	newNode.focus('field');
	var newSelection = this.editor.getSelection();

	this.editor._onAction('appendNode', {
		'node': newNode,
		'parent': this.parent,
		'oldSelection': oldSelection,
		'newSelection': newSelection
	});
};

/**
 * Change the type of the node's value
 * @param {String} newType
 * @private
 */
jsoneditor.Node.prototype._onChangeType = function (newType) {
	var oldType = this.type;
	if (newType != oldType) {
		var oldSelection = this.editor.getSelection();
		this.changeType(newType);
		var newSelection = this.editor.getSelection();

		this.editor._onAction('changeType', {
			'node': this,
			'oldType': oldType,
			'newType': newType,
			'oldSelection': oldSelection,
			'newSelection': newSelection
		});
	}
};

/**
 * Sort the childs of the node. Only applicable when the node has type 'object'
 * or 'array'.
 * @param {String} direction   Sorting direction. Available values: "asc", "desc"
 * @private
 */
jsoneditor.Node.prototype._onSort = function (direction) {
	if (this._hasChilds()) {
		var order = (direction == 'desc') ? -1 : 1;
		var prop = (this.type == 'array') ? 'value' : 'field';
		this.hideChilds();

		var oldChilds = this.childs;
		var oldSort = this.sort;

		// copy the array (the old one will be kept for an undo action
		this.childs = this.childs.concat();

		// sort the arrays
		this.childs.sort(function (a, b) {
			if (a[prop] > b[prop]) return order;
			if (a[prop] < b[prop]) return -order;
			return 0;
		});
		this.sort = (order == 1) ? 'asc' : 'desc';

		this.editor._onAction('sort', {
			'node': this,
			'oldChilds': oldChilds,
			'oldSort': oldSort,
			'newChilds': this.childs,
			'newSort': this.sort
		});

		this.showChilds();
	}
};

/**
 * Create a table row with an append button.
 * @return {HTMLElement | undefined} buttonAppend or undefined when inapplicable
 */
jsoneditor.Node.prototype.getAppend = function () {
	if (!this.append) {
		this.append = new jsoneditor.AppendNode(this.editor);
		this.append.setParent(this);
	}
	return this.append.getDom();
};

/**
 * Find the node from an event target
 * @param {Node} target
 * @return {jsoneditor.Node | undefined} node  or undefined when not found
 * @static
 */
jsoneditor.Node.getNodeFromTarget = function (target) {
	while (target) {
		if (target.node) {
			return target.node;
		}
		target = target.parentNode;
	}

	return undefined;
};

/**
 * Get the previously rendered node
 * @return {jsoneditor.Node | null} previousNode
 * @private
 */
jsoneditor.Node.prototype._previousNode = function () {
	var prevNode = null;
	var dom = this.getDom();
	if (dom && dom.parentNode) {
		// find the previous field
		var prevDom = dom;
		do {
			prevDom = prevDom.previousSibling;
			prevNode = jsoneditor.Node.getNodeFromTarget(prevDom);
		}
		while (prevDom && (prevNode instanceof jsoneditor.AppendNode && !prevNode.isVisible()));
	}
	return prevNode;
};

/**
 * Get the next rendered node
 * @return {jsoneditor.Node | null} nextNode
 * @private
 */
jsoneditor.Node.prototype._nextNode = function () {
	var nextNode = null;
	var dom = this.getDom();
	if (dom && dom.parentNode) {
		// find the previous field
		var nextDom = dom;
		do {
			nextDom = nextDom.nextSibling;
			nextNode = jsoneditor.Node.getNodeFromTarget(nextDom);
		}
		while (nextDom && (nextNode instanceof jsoneditor.AppendNode && !nextNode.isVisible()));
	}

	return nextNode;
};

/**
 * Get the first rendered node
 * @return {jsoneditor.Node | null} firstNode
 * @private
 */
jsoneditor.Node.prototype._firstNode = function () {
	var firstNode = null;
	var dom = this.getDom();
	if (dom && dom.parentNode) {
		var firstDom = dom.parentNode.firstChild;
		firstNode = jsoneditor.Node.getNodeFromTarget(firstDom);
	}

	return firstNode;
};

/**
 * Get the last rendered node
 * @return {jsoneditor.Node | null} lastNode
 * @private
 */
jsoneditor.Node.prototype._lastNode = function () {
	var lastNode = null;
	var dom = this.getDom();
	if (dom && dom.parentNode) {
		var lastDom = dom.parentNode.lastChild;
		lastNode = jsoneditor.Node.getNodeFromTarget(lastDom);
		while (lastDom && (lastNode instanceof jsoneditor.AppendNode && !lastNode.isVisible())) {
			lastDom = lastDom.previousSibling;
			lastNode = jsoneditor.Node.getNodeFromTarget(lastDom);
		}
	}
	return lastNode;
};

/**
 * Get the next element which can have focus.
 * @param {Element} elem
 * @return {Element | null} nextElem
 * @private
 */
jsoneditor.Node.prototype._previousElement = function (elem) {
	var dom = this.dom;
	// noinspection FallthroughInSwitchStatementJS
	switch (elem) {
		case dom.value:
			if (this.fieldEditable) {
				return dom.field;
			}
			// intentional fall through
		case dom.field:
			if (this._hasChilds()) {
				return dom.expand;
			}
			// intentional fall through
		case dom.expand:
			return dom.menu;
		case dom.menu:
			if (dom.drag) {
				return dom.drag;
			}
			// intentional fall through
		default:
			return null;
	}
};

/**
 * Get the next element which can have focus.
 * @param {Element} elem
 * @return {Element | null} nextElem
 * @private
 */
jsoneditor.Node.prototype._nextElement = function (elem) {
	var dom = this.dom;
	// noinspection FallthroughInSwitchStatementJS
	switch (elem) {
		case dom.drag:
			return dom.menu;
		case dom.menu:
			if (this._hasChilds()) {
				return dom.expand;
			}
			// intentional fall through
		case dom.expand:
			if (this.fieldEditable) {
				return dom.field;
			}
			// intentional fall through
		case dom.field:
			if (!this._hasChilds()) {
				return dom.value;
			}
		default:
			return null;
	}
};

/**
 * Get the dom name of given element. returns null if not found.
 * For example when element == dom.field, "field" is returned.
 * @param {Element} element
 * @return {String | null} elementName  Available elements with name: 'drag',
 *                                      'menu', 'expand', 'field', 'value'
 * @private
 */
jsoneditor.Node.prototype._getElementName = function (element) {
	var dom = this.dom;
	for (var name in dom) {
		if (dom.hasOwnProperty(name)) {
			if (dom[name] == element) {
				return name;
			}
		}
	}
	return null;
};

/**
 * Test if this node has childs. This is the case when the node is an object
 * or array.
 * @return {boolean} hasChilds
 * @private
 */
jsoneditor.Node.prototype._hasChilds = function () {
	return this.type == 'array' || this.type == 'object';
};

// titles with explanation for the different types
jsoneditor.Node.TYPE_TITLES = {
	'auto': '"auto" 类型: 节点类型将自动从值中获取, 可以是: string, number, boolean, 或者 null.',
	'object': '"object" 类型: 对象包含了一些无序的键/值对.',
	'array': '"array" 类型: 一个包含了有序值集合的数组.',
	'string': '"string" 类型: 节点类型不从值中自动获取, 但永远返回 string.'
};

/**
 * Show a contextmenu for this node
 * @param {HTMLElement} anchor   Anchor element to attache the context menu to.
 * @param {function} [onClose]   Callback method called when the context menu
 *                               is being closed.
 */
jsoneditor.Node.prototype.showContextMenu = function (anchor, onClose) {
	var node = this;
	var titles = jsoneditor.Node.TYPE_TITLES;
	var items = [];

	items.push({
		'text': '类型',
		'title': '改变节点类型',
		'className': 'type-' + this.type,
		'submenu': [{
			'text': '自动',
			'className': 'type-auto' + (this.type == 'auto' ? ' selected' : ''),
			'title': titles.auto,
			'click': function () {
				node._onChangeType('auto');
			}
		}, {
			'text': '数组',
			'className': 'type-array' + (this.type == 'array' ? ' selected' : ''),
			'title': titles.array,
			'click': function () {
				node._onChangeType('array');
			}
		}, {
			'text': '对象',
			'className': 'type-object' + (this.type == 'object' ? ' selected' : ''),
			'title': titles.object,
			'click': function () {
				node._onChangeType('object');
			}
		}, {
			'text': '字符串',
			'className': 'type-string' + (this.type == 'string' ? ' selected' : ''),
			'title': titles.string,
			'click': function () {
				node._onChangeType('string');
			}
		}]
	});

	if (this._hasChilds()) {
		var direction = ((this.sort == 'asc') ? 'desc' : 'asc');
		items.push({
			'text': '排序',
			'title': '排序当前 ' + this.type,
			'className': 'sort-' + direction,
			'click': function () {
				node._onSort(direction);
			},
			'submenu': [{
				'text': '顺序',
				'className': 'sort-asc',
				'title': '将 ' + this.type + ' 下的子节点按照顺序进行排序',
				'click': function () {
					node._onSort('asc');
				}
			}, {
				'text': '倒序',
				'className': 'sort-desc',
				'title': '将 ' + this.type + ' 下的子节点按照倒序进行排序',
				'click': function () {
					node._onSort('desc');
				}
			}]
		});
	}

	if (this.parent && this.parent._hasChilds()) {
		// create a separator
		items.push({
			'type': 'separator'
		});

		// create append button (for last child node only)
		var childs = node.parent.childs;
		if (node == childs[childs.length - 1]) {
			items.push({
				'text': '追加',
				'title': '在该节点后追加一个 \'auto\' 类型的节点 (Ctrl+Shift+Ins)',
				'submenuTitle': '选择需要追加的节点类型.',
				'className': 'append',
				'click': function () {
					node._onAppend('', '', 'auto');
				},
				'submenu': [{
					'text': 'Auto',
					'className': 'type-auto',
					'title': titles.auto,
					'click': function () {
						node._onAppend('', '', 'auto');
					}
				}, {
					'text': 'Array',
					'className': 'type-array',
					'title': titles.array,
					'click': function () {
						node._onAppend('', []);
					}
				}, {
					'text': 'Object',
					'className': 'type-object',
					'title': titles.object,
					'click': function () {
						node._onAppend('', {});
					}
				}, {
					'text': 'String',
					'className': 'type-string',
					'title': titles.string,
					'click': function () {
						node._onAppend('', '', 'string');
					}
				}]
			});
		}

		// create insert button
		items.push({
			'text': '插入',
			'title': '在该节点前插入一个 \'auto\' 类型的节点 (Ctrl+Ins)',
			'submenuTitle': '选择需要插入的节点类型',
			'className': 'insert',
			'click': function () {
				node._onInsertBefore('', '', 'auto');
			},
			'submenu': [{
				'text': 'Auto',
				'className': 'type-auto',
				'title': titles.auto,
				'click': function () {
					node._onInsertBefore('', '', 'auto');
				}
			}, {
				'text': 'Array',
				'className': 'type-array',
				'title': titles.array,
				'click': function () {
					node._onInsertBefore('', []);
				}
			}, {
				'text': 'Object',
				'className': 'type-object',
				'title': titles.object,
				'click': function () {
					node._onInsertBefore('', {});
				}
			}, {
				'text': 'String',
				'className': 'type-string',
				'title': titles.string,
				'click': function () {
					// TODO: settings type string does not work, will become auto
					node._onInsertBefore('', '', 'string');
				}
			}]
		});

		// create duplicate button
		items.push({
			'text': '复制',
			'title': '复制节点 (Ctrl+D)',
			'className': 'duplicate',
			'click': function () {
				node._onDuplicate();
			}
		});

		// create remove button
		items.push({
			'text': '删除',
			'title': '删除节点 (Ctrl+Del)',
			'className': 'remove',
			'click': function () {
				node._onRemove();
			}
		});
	}

	var menu = new jsoneditor.ContextMenu(items, {
		close: onClose
	});
	menu.show(anchor);
};

/**
 * get the type of a value
 * @param {*} value
 * @return {String} type   Can be 'object', 'array', 'string', 'auto'
 * @private
 */
jsoneditor.Node.prototype._getType = function (value) {
	if (value instanceof Array) {
		return 'array';
	}
	if (value instanceof Object) {
		return 'object';
	}
	if (typeof (value) == 'string' && typeof (this._stringCast(value)) != 'string') {
		return 'string';
	}

	return 'auto';
};

/**
 * cast contents of a string to the correct type. This can be a string,
 * a number, a boolean, etc
 * @param {String} str
 * @return {*} castedStr
 * @private
 */
jsoneditor.Node.prototype._stringCast = function (str) {
	var lower = str.toLowerCase(),
		num = Number(str), // will nicely fail with '123ab'
		numFloat = parseFloat(str); // will nicely fail with '  '

	if (str == '') {
		return '';
	} else if (lower == 'null') {
		return null;
	} else if (lower == 'true') {
		return true;
	} else if (lower == 'false') {
		return false;
	} else if (!isNaN(num) && !isNaN(numFloat)) {
		return num;
	} else {
		return str;
	}
};

/**
 * escape a text, such that it can be displayed safely in an HTML element
 * @param {String} text
 * @return {String} escapedText
 * @private
 */
jsoneditor.Node.prototype._escapeHTML = function (text) {
	var htmlEscaped = String(text)
		.replace(/</g, '&lt;')
		.replace(/>/g, '&gt;')
		.replace(/  /g, ' &nbsp;') // replace double space with an nbsp and space
	.replace(/^ /, '&nbsp;') // space at start
	.replace(/ $/, '&nbsp;'); // space at end

	var json = JSON.stringify(htmlEscaped);
	return json.substring(1, json.length - 1);
};

/**
 * unescape a string.
 * @param {String} escapedText
 * @return {String} text
 * @private
 */
jsoneditor.Node.prototype._unescapeHTML = function (escapedText) {
	var json = '"' + this._escapeJSON(escapedText) + '"';
	var htmlEscaped = jsoneditor.util.parse(json);
	return htmlEscaped.replace(/&lt;/g, '<')
		.replace(/&gt;/g, '>')
		.replace(/&nbsp;/g, ' ');
};

/**
 * escape a text to make it a valid JSON string. The method will:
 *   - replace unescaped double quotes with '\"'
 *   - replace unescaped backslash with '\\'
 *   - replace returns with '\n'
 * @param {String} text
 * @return {String} escapedText
 * @private
 */
jsoneditor.Node.prototype._escapeJSON = function (text) {
	// TODO: replace with some smart regex (only when a new solution is faster!)
	var escaped = '';
	var i = 0,
		iMax = text.length;
	while (i < iMax) {
		var c = text.charAt(i);
		if (c == '\n') {
			escaped += '\\n';
		} else if (c == '\\') {
			escaped += c;
			i++;

			c = text.charAt(i);
			if ('"\\/bfnrtu'.indexOf(c) == -1) {
				escaped += '\\'; // no valid escape character
			}
			escaped += c;
		} else if (c == '"') {
			escaped += '\\"';
		} else {
			escaped += c;
		}
		i++;
	}

	return escaped;
};

/*----------------------------------------------*/
/* jsonlint.js
/*----------------------------------------------*/
/* Jison generated parser */
var jsonlint = (function () {
	var parser = {
		trace: function trace() {},
		yy: {},
		symbols_: {
			"error": 2,
			"JSONString": 3,
			"STRING": 4,
			"JSONNumber": 5,
			"NUMBER": 6,
			"JSONNullLiteral": 7,
			"NULL": 8,
			"JSONBooleanLiteral": 9,
			"TRUE": 10,
			"FALSE": 11,
			"JSONText": 12,
			"JSONValue": 13,
			"EOF": 14,
			"JSONObject": 15,
			"JSONArray": 16,
			"{": 17,
			"}": 18,
			"JSONMemberList": 19,
			"JSONMember": 20,
			":": 21,
			",": 22,
			"[": 23,
			"]": 24,
			"JSONElementList": 25,
			"$accept": 0,
			"$end": 1
		},
		terminals_: {
			2: "error",
			4: "STRING",
			6: "NUMBER",
			8: "NULL",
			10: "TRUE",
			11: "FALSE",
			14: "EOF",
			17: "{",
			18: "}",
			21: ":",
			22: ",",
			23: "[",
			24: "]"
		},
		productions_: [0, [3, 1],
			[5, 1],
			[7, 1],
			[9, 1],
			[9, 1],
			[12, 2],
			[13, 1],
			[13, 1],
			[13, 1],
			[13, 1],
			[13, 1],
			[13, 1],
			[15, 2],
			[15, 3],
			[20, 3],
			[19, 1],
			[19, 3],
			[16, 2],
			[16, 3],
			[25, 1],
			[25, 3]
		],
		performAction: function anonymous(yytext, yyleng, yylineno, yy, yystate, $$, _$) {

			var $0 = $$.length - 1;
			switch (yystate) {
				case 1:
					// replace escaped characters with actual character
					this.$ = yytext.replace(/\\(\\|")/g, "$" + "1")
						.replace(/\\n/g, '\n')
						.replace(/\\r/g, '\r')
						.replace(/\\t/g, '\t')
						.replace(/\\v/g, '\v')
						.replace(/\\f/g, '\f')
						.replace(/\\b/g, '\b');

					break;
				case 2:
					this.$ = Number(yytext);
					break;
				case 3:
					this.$ = null;
					break;
				case 4:
					this.$ = true;
					break;
				case 5:
					this.$ = false;
					break;
				case 6:
					return this.$ = $$[$0 - 1];
					break;
				case 13:
					this.$ = {};
					break;
				case 14:
					this.$ = $$[$0 - 1];
					break;
				case 15:
					this.$ = [$$[$0 - 2], $$[$0]];
					break;
				case 16:
					this.$ = {};
					this.$[$$[$0][0]] = $$[$0][1];
					break;
				case 17:
					this.$ = $$[$0 - 2];
					$$[$0 - 2][$$[$0][0]] = $$[$0][1];
					break;
				case 18:
					this.$ = [];
					break;
				case 19:
					this.$ = $$[$0 - 1];
					break;
				case 20:
					this.$ = [$$[$0]];
					break;
				case 21:
					this.$ = $$[$0 - 2];
					$$[$0 - 2].push($$[$0]);
					break;
			}
		},
		table: [{
			3: 5,
			4: [1, 12],
			5: 6,
			6: [1, 13],
			7: 3,
			8: [1, 9],
			9: 4,
			10: [1, 10],
			11: [1, 11],
			12: 1,
			13: 2,
			15: 7,
			16: 8,
			17: [1, 14],
			23: [1, 15]
		}, {
			1: [3]
		}, {
			14: [1, 16]
		}, {
			14: [2, 7],
			18: [2, 7],
			22: [2, 7],
			24: [2, 7]
		}, {
			14: [2, 8],
			18: [2, 8],
			22: [2, 8],
			24: [2, 8]
		}, {
			14: [2, 9],
			18: [2, 9],
			22: [2, 9],
			24: [2, 9]
		}, {
			14: [2, 10],
			18: [2, 10],
			22: [2, 10],
			24: [2, 10]
		}, {
			14: [2, 11],
			18: [2, 11],
			22: [2, 11],
			24: [2, 11]
		}, {
			14: [2, 12],
			18: [2, 12],
			22: [2, 12],
			24: [2, 12]
		}, {
			14: [2, 3],
			18: [2, 3],
			22: [2, 3],
			24: [2, 3]
		}, {
			14: [2, 4],
			18: [2, 4],
			22: [2, 4],
			24: [2, 4]
		}, {
			14: [2, 5],
			18: [2, 5],
			22: [2, 5],
			24: [2, 5]
		}, {
			14: [2, 1],
			18: [2, 1],
			21: [2, 1],
			22: [2, 1],
			24: [2, 1]
		}, {
			14: [2, 2],
			18: [2, 2],
			22: [2, 2],
			24: [2, 2]
		}, {
			3: 20,
			4: [1, 12],
			18: [1, 17],
			19: 18,
			20: 19
		}, {
			3: 5,
			4: [1, 12],
			5: 6,
			6: [1, 13],
			7: 3,
			8: [1, 9],
			9: 4,
			10: [1, 10],
			11: [1, 11],
			13: 23,
			15: 7,
			16: 8,
			17: [1, 14],
			23: [1, 15],
			24: [1, 21],
			25: 22
		}, {
			1: [2, 6]
		}, {
			14: [2, 13],
			18: [2, 13],
			22: [2, 13],
			24: [2, 13]
		}, {
			18: [1, 24],
			22: [1, 25]
		}, {
			18: [2, 16],
			22: [2, 16]
		}, {
			21: [1, 26]
		}, {
			14: [2, 18],
			18: [2, 18],
			22: [2, 18],
			24: [2, 18]
		}, {
			22: [1, 28],
			24: [1, 27]
		}, {
			22: [2, 20],
			24: [2, 20]
		}, {
			14: [2, 14],
			18: [2, 14],
			22: [2, 14],
			24: [2, 14]
		}, {
			3: 20,
			4: [1, 12],
			20: 29
		}, {
			3: 5,
			4: [1, 12],
			5: 6,
			6: [1, 13],
			7: 3,
			8: [1, 9],
			9: 4,
			10: [1, 10],
			11: [1, 11],
			13: 30,
			15: 7,
			16: 8,
			17: [1, 14],
			23: [1, 15]
		}, {
			14: [2, 19],
			18: [2, 19],
			22: [2, 19],
			24: [2, 19]
		}, {
			3: 5,
			4: [1, 12],
			5: 6,
			6: [1, 13],
			7: 3,
			8: [1, 9],
			9: 4,
			10: [1, 10],
			11: [1, 11],
			13: 31,
			15: 7,
			16: 8,
			17: [1, 14],
			23: [1, 15]
		}, {
			18: [2, 17],
			22: [2, 17]
		}, {
			18: [2, 15],
			22: [2, 15]
		}, {
			22: [2, 21],
			24: [2, 21]
		}],
		defaultActions: {
			16: [2, 6]
		},
		parseError: function parseError(str, hash) {
			throw new Error(str);
		},
		parse: function parse(input) {
			var self = this,
				stack = [0],
				vstack = [null], // semantic value stack
				lstack = [], // location stack
				table = this.table,
				yytext = '',
				yylineno = 0,
				yyleng = 0,
				recovering = 0,
				TERROR = 2,
				EOF = 1;

			//this.reductionCount = this.shiftCount = 0;

			this.lexer.setInput(input);
			this.lexer.yy = this.yy;
			this.yy.lexer = this.lexer;
			if (typeof this.lexer.yylloc == 'undefined') this.lexer.yylloc = {};
			var yyloc = this.lexer.yylloc;
			lstack.push(yyloc);

			if (typeof this.yy.parseError === 'function') this.parseError = this.yy.parseError;

			function popStack(n) {
				stack.length = stack.length - 2 * n;
				vstack.length = vstack.length - n;
				lstack.length = lstack.length - n;
			}

			function lex() {
				var token;
				token = self.lexer.lex() || 1; // $end = 1
				// if token isn't its numeric value, convert
				if (typeof token !== 'number') {
					token = self.symbols_[token] || token;
				}
				return token;
			}

			var symbol, preErrorSymbol, state, action, a, r, yyval = {}, p, len, newState, expected;
			while (true) {
				// retreive state number from top of stack
				state = stack[stack.length - 1];

				// use default actions if available
				if (this.defaultActions[state]) {
					action = this.defaultActions[state];
				} else {
					if (symbol == null) symbol = lex();
					// read action for current state and first input
					action = table[state] && table[state][symbol];
				}

				// handle parse error
				_handle_error: if (typeof action === 'undefined' || !action.length || !action[0]) {

					if (!recovering) {
						// Report error
						expected = [];
						for (p in table[state]) if (this.terminals_[p] && p > 2) {
							expected.push("'" + this.terminals_[p] + "'");
						}
						var errStr = '';
						if (this.lexer.showPosition) {
							errStr = 'Parse error on line ' + (yylineno + 1) + ":\n" + this.lexer.showPosition() + "\nExpecting " + expected.join(', ') + ", got '" + this.terminals_[symbol] + "'";
						} else {
							errStr = 'Parse error on line ' + (yylineno + 1) + ": Unexpected " + (symbol == 1 /*EOF*/ ? "end of input" : ("'" + (this.terminals_[symbol] || symbol) + "'"));
						}
						this.parseError(errStr, {
							text: this.lexer.match,
							token: this.terminals_[symbol] || symbol,
							line: this.lexer.yylineno,
							loc: yyloc,
							expected: expected
						});
					}

					// just recovered from another error
					if (recovering == 3) {
						if (symbol == EOF) {
							throw new Error(errStr || 'Parsing halted.');
						}

						// discard current lookahead and grab another
						yyleng = this.lexer.yyleng;
						yytext = this.lexer.yytext;
						yylineno = this.lexer.yylineno;
						yyloc = this.lexer.yylloc;
						symbol = lex();
					}

					// try to recover from error
					while (1) {
						// check for error recovery rule in this state
						if ((TERROR.toString()) in table[state]) {
							break;
						}
						if (state == 0) {
							throw new Error(errStr || 'Parsing halted.');
						}
						popStack(1);
						state = stack[stack.length - 1];
					}

					preErrorSymbol = symbol; // save the lookahead token
					symbol = TERROR; // insert generic error symbol as new lookahead
					state = stack[stack.length - 1];
					action = table[state] && table[state][TERROR];
					recovering = 3; // allow 3 real symbols to be shifted before reporting a new error
				}

				// this shouldn't happen, unless resolve defaults are off
				if (action[0] instanceof Array && action.length > 1) {
					throw new Error('Parse Error: multiple actions possible at state: ' + state + ', token: ' + symbol);
				}

				switch (action[0]) {

					case 1:
						// shift
						//this.shiftCount++;

						stack.push(symbol);
						vstack.push(this.lexer.yytext);
						lstack.push(this.lexer.yylloc);
						stack.push(action[1]); // push state
						symbol = null;
						if (!preErrorSymbol) { // normal execution/no error
							yyleng = this.lexer.yyleng;
							yytext = this.lexer.yytext;
							yylineno = this.lexer.yylineno;
							yyloc = this.lexer.yylloc;
							if (recovering > 0) recovering--;
						} else { // error just occurred, resume old lookahead f/ before error
							symbol = preErrorSymbol;
							preErrorSymbol = null;
						}
						break;

					case 2:
						// reduce
						//this.reductionCount++;

						len = this.productions_[action[1]][1];

						// perform semantic action
						yyval.$ = vstack[vstack.length - len]; // default to $$ = $1
						// default location, uses first token for firsts, last for lasts
						yyval._$ = {
							first_line: lstack[lstack.length - (len || 1)].first_line,
							last_line: lstack[lstack.length - 1].last_line,
							first_column: lstack[lstack.length - (len || 1)].first_column,
							last_column: lstack[lstack.length - 1].last_column
						};
						r = this.performAction.call(yyval, yytext, yyleng, yylineno, this.yy, action[1], vstack, lstack);

						if (typeof r !== 'undefined') {
							return r;
						}

						// pop off stack
						if (len) {
							stack = stack.slice(0, -1 * len * 2);
							vstack = vstack.slice(0, -1 * len);
							lstack = lstack.slice(0, -1 * len);
						}

						stack.push(this.productions_[action[1]][0]); // push nonterminal (reduce)
						vstack.push(yyval.$);
						lstack.push(yyval._$);
						// goto new state = table[STATE][NONTERMINAL]
						newState = table[stack[stack.length - 2]][stack[stack.length - 1]];
						stack.push(newState);
						break;

					case 3:
						// accept
						return true;
				}

			}

			return true;
		}
	};
	/* Jison generated lexer */
	var lexer = (function () {
		var lexer = ({
			EOF: 1,
			parseError: function parseError(str, hash) {
				if (this.yy.parseError) {
					this.yy.parseError(str, hash);
				} else {
					throw new Error(str);
				}
			},
			setInput: function (input) {
				this._input = input;
				this._more = this._less = this.done = false;
				this.yylineno = this.yyleng = 0;
				this.yytext = this.matched = this.match = '';
				this.conditionStack = ['INITIAL'];
				this.yylloc = {
					first_line: 1,
					first_column: 0,
					last_line: 1,
					last_column: 0
				};
				return this;
			},
			input: function () {
				var ch = this._input[0];
				this.yytext += ch;
				this.yyleng++;
				this.match += ch;
				this.matched += ch;
				var lines = ch.match(/\n/);
				if (lines) this.yylineno++;
				this._input = this._input.slice(1);
				return ch;
			},
			unput: function (ch) {
				this._input = ch + this._input;
				return this;
			},
			more: function () {
				this._more = true;
				return this;
			},
			less: function (n) {
				this._input = this.match.slice(n) + this._input;
			},
			pastInput: function () {
				var past = this.matched.substr(0, this.matched.length - this.match.length);
				return (past.length > 20 ? '...' : '') + past.substr(-20).replace(/\n/g, "");
			},
			upcomingInput: function () {
				var next = this.match;
				if (next.length < 20) {
					next += this._input.substr(0, 20 - next.length);
				}
				return (next.substr(0, 20) + (next.length > 20 ? '...' : '')).replace(/\n/g, "");
			},
			showPosition: function () {
				var pre = this.pastInput();
				var c = new Array(pre.length + 1).join("-");
				return pre + this.upcomingInput() + "\n" + c + "^";
			},
			next: function () {
				if (this.done) {
					return this.EOF;
				}
				if (!this._input) this.done = true;

				var token,
				match,
				tempMatch,
				index,
				col,
				lines;
				if (!this._more) {
					this.yytext = '';
					this.match = '';
				}
				var rules = this._currentRules();
				for (var i = 0; i < rules.length; i++) {
					tempMatch = this._input.match(this.rules[rules[i]]);
					if (tempMatch && (!match || tempMatch[0].length > match[0].length)) {
						match = tempMatch;
						index = i;
						if (!this.options.flex) break;
					}
				}
				if (match) {
					lines = match[0].match(/\n.*/g);
					if (lines) this.yylineno += lines.length;
					this.yylloc = {
						first_line: this.yylloc.last_line,
						last_line: this.yylineno + 1,
						first_column: this.yylloc.last_column,
						last_column: lines ? lines[lines.length - 1].length - 1 : this.yylloc.last_column + match[0].length
					}
					this.yytext += match[0];
					this.match += match[0];
					this.yyleng = this.yytext.length;
					this._more = false;
					this._input = this._input.slice(match[0].length);
					this.matched += match[0];
					token = this.performAction.call(this, this.yy, this, rules[index], this.conditionStack[this.conditionStack.length - 1]);
					if (this.done && this._input) this.done = false;
					if (token) return token;
					else return;
				}
				if (this._input === "") {
					return this.EOF;
				} else {
					this.parseError('Lexical error on line ' + (this.yylineno + 1) + '. Unrecognized text.\n' + this.showPosition(), {
						text: "",
						token: null,
						line: this.yylineno
					});
				}
			},
			lex: function lex() {
				var r = this.next();
				if (typeof r !== 'undefined') {
					return r;
				} else {
					return this.lex();
				}
			},
			begin: function begin(condition) {
				this.conditionStack.push(condition);
			},
			popState: function popState() {
				return this.conditionStack.pop();
			},
			_currentRules: function _currentRules() {
				return this.conditions[this.conditionStack[this.conditionStack.length - 1]].rules;
			},
			topState: function () {
				return this.conditionStack[this.conditionStack.length - 2];
			},
			pushState: function begin(condition) {
				this.begin(condition);
			}
		});
		lexer.options = {};
		lexer.performAction = function anonymous(yy, yy_, $avoiding_name_collisions, YY_START) {

			var YYSTATE = YY_START
			switch ($avoiding_name_collisions) {
				case 0:
					/* skip whitespace */
					break;
				case 1:
					return 6
					break;
				case 2:
					yy_.yytext = yy_.yytext.substr(1, yy_.yyleng - 2);
					return 4
					break;
				case 3:
					return 17
					break;
				case 4:
					return 18
					break;
				case 5:
					return 23
					break;
				case 6:
					return 24
					break;
				case 7:
					return 22
					break;
				case 8:
					return 21
					break;
				case 9:
					return 10
					break;
				case 10:
					return 11
					break;
				case 11:
					return 8
					break;
				case 12:
					return 14
					break;
				case 13:
					return 'INVALID'
					break;
			}
		};
		lexer.rules = [/^(?:\s+)/, /^(?:(-?([0-9]|[1-9][0-9]+))(\.[0-9]+)?([eE][-+]?[0-9]+)?\b)/, /^(?:"(?:\\[\\"bfnrt/]|\\u[a-fA-F0-9]{4}|[^\\\0-\x09\x0a-\x1f"])*")/, /^(?:\{)/, /^(?:\})/, /^(?:\[)/, /^(?:\])/, /^(?:,)/, /^(?::)/, /^(?:true\b)/, /^(?:false\b)/, /^(?:null\b)/, /^(?:$)/, /^(?:.)/];
		lexer.conditions = {
			"INITIAL": {
				"rules": [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13],
				"inclusive": true
			}
		};


		;
		return lexer;
	})()
	parser.lexer = lexer;
	return parser;
})();
if (typeof require !== 'undefined' && typeof exports !== 'undefined') {
	exports.parser = jsonlint;
	exports.parse = function () {
		return jsonlint.parse.apply(jsonlint, arguments);
	}
	exports.main = function commonjsMain(args) {
		if (!args[1]) throw new Error('Usage: ' + args[0] + ' FILE');
		if (typeof process !== 'undefined') {
			var source = require('fs').readFileSync(require('path').join(process.cwd(), args[1]), "utf8");
		} else {
			var cwd = require("file").path(require("file").cwd());
			var source = cwd.join(args[1]).read({
				charset: "utf-8"
			});
		}
		return exports.parser.parse(source);
	}
	if (typeof module !== 'undefined' && require.main === module) {
		exports.main(typeof process !== 'undefined' ? process.argv.slice(1) : require("system").args);
	}
}
/*----------------------------------------------*/
/* jsonformatter.js
/*----------------------------------------------*/
/**
 * @license
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not
 * use this file except in compliance with the License. You may obtain a copy
 * of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * License for the specific language governing permissions and limitations under
 * the License.
 *
 * Copyright (c) 2011-2013 Jos de Jong, http://jsoneditoronline.org
 *
 * @author  Jos de Jong, <wjosdejong@gmail.com>
 */

// create namespace
var jsoneditor = jsoneditor || {};

/**
 * Create a JSONFormatter and attach it to given container
 * @constructor jsoneditor.JSONFormatter
 * @param {Element} container
 * @param {Object} [options]         Object with options. available options:
 *                                   {Number} indentation  Number of indentation
 *                                                         spaces. 4 by default.
 *                                   {function} change     Callback method
 *                                                         triggered on change
 * @param {JSON | String} [json]     initial contents of the formatter
 */
jsoneditor.JSONFormatter = function (container, options, json) {
	if (!(this instanceof jsoneditor.JSONFormatter)) {
		throw new Error('请用 new 对象的方法调用 JSONFormatter 的构造函数.');
	}

	// check availability of JSON parser (not available in IE7 and older)
	if (typeof (JSON) == 'undefined') {
		throw new Error('您当前使用的浏览器不支持 JSON. \n\n' +
			'请下载安装最新版本的浏览器, 本站推荐Google Chrome.\n' +
			'(PS: 当前主流浏览器都支持JSON).');
	}

	this.container = container;
	this.indentation = 4; // number of spaces

	this.width = container.clientWidth;
	this.height = container.clientHeight;

	this.frame = document.createElement('div');
	this.frame.className = 'jsoneditor';
	this.frame.onclick = function (event) {
		// prevent default submit action when JSONFormatter is located inside a form
		jsoneditor.util.preventDefault(event);
	};

	// create menu
	this.menu = document.createElement('div');
	this.menu.className = 'menu';
	this.frame.appendChild(this.menu);

	// create format button
	var buttonFormat = document.createElement('button');
	//buttonFormat.innerHTML = 'Format';
	buttonFormat.className = 'format';
	buttonFormat.title = '格式化JSON数据';
	//buttonFormat.className = 'jsoneditor-button';
	this.menu.appendChild(buttonFormat);

	// create compact button
	var buttonCompact = document.createElement('button');
	//buttonCompact.innerHTML = 'Compact';
	buttonCompact.className = 'compact';
	buttonCompact.title = '压缩JSON数据, 清除所有空白字符';
	//buttonCompact.className = 'jsoneditor-button';
	this.menu.appendChild(buttonCompact);

	this.content = document.createElement('div');
	this.content.className = 'outer';
	this.frame.appendChild(this.content);

	this.textarea = document.createElement('textarea');
	this.textarea.className = 'content';
	this.textarea.spellcheck = false;
	this.content.appendChild(this.textarea);

	var textarea = this.textarea;

	// read the options
	if (options) {
		if (options.change) {
			// register on change event
			if (this.textarea.oninput === null) {
				this.textarea.oninput = function () {
					options.change();
				}
			} else {
				// oninput is undefined. For IE8-
				this.textarea.onchange = function () {
					options.change();
				}
			}
		}
		if (options.indentation) {
			this.indentation = Number(options.indentation);
		}
	}

	var me = this;
	buttonFormat.onclick = function () {
		try {
			var json = jsoneditor.util.parse(textarea.value);
			textarea.value = JSON.stringify(json, null, me.indentation);
		} catch (err) {
			me.onError(err);
		}
	};
	buttonCompact.onclick = function () {
		try {
			var json = jsoneditor.util.parse(textarea.value);
			textarea.value = JSON.stringify(json);
		} catch (err) {
			me.onError(err);
		}
	};

	this.container.appendChild(this.frame);

	// load initial json object or string
	if (typeof (json) == 'string') {
		this.setText(json);
	} else {
		this.set(json);
	}
};

/**
 * This method is executed on error.
 * It can be overwritten for each instance of the JSONFormatter
 * @param {String} err
 */
jsoneditor.JSONFormatter.prototype.onError = function (err) {
	// action should be implemented for the instance
};

/**
 * Set json data in the formatter
 * @param {Object} json
 */
jsoneditor.JSONFormatter.prototype.set = function (json) {
	this.textarea.value = JSON.stringify(json, null, this.indentation);
};

/**
 * Get json data from the formatter
 * @return {Object} json
 */
jsoneditor.JSONFormatter.prototype.get = function () {
	return jsoneditor.util.parse(this.textarea.value);
};

/**
 * Get the text contents of the JSONFormatter
 * @return {String} text
 */
jsoneditor.JSONFormatter.prototype.getText = function () {
	return this.textarea.value;
};

/**
 * Set the text contents of the JSONFormatter
 * @param {String} text
 */
jsoneditor.JSONFormatter.prototype.setText = function (text) {
	this.textarea.value = text;
};

/*----------------------------------------------*/
/* jsoneditor.js
/*----------------------------------------------*/
/**
 * @license
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not
 * use this file except in compliance with the License. You may obtain a copy
 * of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * License for the specific language governing permissions and limitations under
 * the License.
 *
 * Copyright (c) 2011-2013 Jos de Jong, http://jsoneditoronline.org
 *
 * @author  Jos de Jong, <wjosdejong@gmail.com>
 */

// create namespace
var jsoneditor = jsoneditor || {};

/**
 * jsoneditor.JSONEditor
 * @param {Element} container    Container element
 * @param {Object}  [options]    Object with options. available options:
 *                               {String} mode      Editor mode. Available values:
 *                                                  'editor' (default), 'viewer',
 *                                                  and 'form'.
 *                               {Boolean} search   Enable search box.
 *                                                  True by default
 *                               {Boolean} history  Enable history (undo/redo).
 *                                                  True by default
 *                               {function} change  Callback method, triggered
 *                                                  on change of contents
 *                               {String} name      Field name for the root node.
 * @param {Object | undefined} json JSON object
 */
jsoneditor.JSONEditor = function (container, options, json) {
	if (!(this instanceof jsoneditor.JSONEditor)) {
		throw new Error('请用 new 对象的方法调用 JSONEditor 的构造函数.');
	}

	// check availability of JSON parser (not available in IE7 and older)
	if (typeof (JSON) == 'undefined') {
		throw new Error('您当前使用的浏览器不支持 JSON. \n\n' +
			'请下载安装最新版本的浏览器, 本站推荐Google Chrome.\n' +
			'(PS: 当前主流浏览器都支持JSON).');
	}

	if (!container) {
		throw new Error('没有提供容器元素.');
	}
	this.container = container;
	this.dom = {};
	this.highlighter = new jsoneditor.Highlighter();
	this.selection = undefined; // will hold the last input selection

	this._setOptions(options);

	if (this.options.history && !this.mode.viewer) {
		this.history = new jsoneditor.History(this);
	}

	this._createFrame();
	this._createTable();

	this.set(json || {});
};

/**
 * Initialize and set default options
 * @param {Object}  [options]    Object with options. available options:
 *                               {String} mode      Editor mode. Available values:
 *                                                  'editor' (default), 'viewer',
 *                                                  and 'form'.
 *                               {Boolean} search   Enable search box.
 *                                                  True by default.
 *                               {Boolean} history  Enable history (undo/redo).
 *                                                  True by default.
 *                               {function} change  Callback method, triggered
 *                                                  on change of contents.
 *                               {String} name      Field name for the root node.
 * @private
 */
jsoneditor.JSONEditor.prototype._setOptions = function (options) {
	this.options = {
		search: true,
		history: true,
		mode: 'editor',
		name: undefined // field name of root node
	};

	// copy all options
	if (options) {
		for (var prop in options) {
			if (options.hasOwnProperty(prop)) {
				this.options[prop] = options[prop];
			}
		}

		// check for deprecated options
		if (options['enableSearch']) {
			// deprecated since version 1.6.0, 2012-11-03
			this.options.search = options['enableSearch'];
			console.log('WARNING: Option "enableSearch" is deprecated. Use "search" instead.');
		}
		if (options['enableHistory']) {
			// deprecated since version 1.6.0, 2012-11-03
			this.options.history = options['enableHistory'];
			console.log('WARNING: Option "enableHistory" is deprecated. Use "history" instead.');
		}
	}

	// interpret the mode options
	this.mode = {
		editor: (this.options.mode != 'viewer' && this.options.mode != 'form'),
		viewer: (this.options.mode == 'viewer'),
		form: (this.options.mode == 'form')
	};
};

// node currently being edited
jsoneditor.JSONEditor.focusNode = undefined;

/**
 * Set JSON object in editor
 * @param {Object | undefined} json      JSON data
 * @param {String}             [name]    Optional field name for the root node.
 *                                       Can also be set using setName(name).
 */
jsoneditor.JSONEditor.prototype.set = function (json, name) {
	// adjust field name for root node
	if (name) {
		this.options.name = name;
	}

	// verify if json is valid JSON, ignore when a function
	if (json instanceof Function || (json === undefined)) {
		this.clear();
	} else {
		this.content.removeChild(this.table); // Take the table offline

		// replace the root node
		var params = {
			'field': this.options.name,
			'value': json
		};
		var node = new jsoneditor.Node(this, params);
		this._setRoot(node);

		// expand
		var recurse = false;
		this.node.expand(recurse);

		this.content.appendChild(this.table); // Put the table online again
	}

	// TODO: maintain history, store last state and previous document
	if (this.history) {
		this.history.clear();
	}
};

/**
 * Get JSON object from editor
 * @return {Object | undefined} json
 */
jsoneditor.JSONEditor.prototype.get = function () {
	// remove focus from currently edited node
	if (jsoneditor.JSONEditor.focusNode) {
		jsoneditor.JSONEditor.focusNode.blur();
	}

	if (this.node) {
		return this.node.getValue();
	} else {
		return undefined;
	}
};

/**
 * Set a field name for the root node.
 * @param {String | undefined} name
 */
jsoneditor.JSONEditor.prototype.setName = function (name) {
	this.options.name = name;
	if (this.node) {
		this.node.updateField(this.options.name);
	}
};

/**
 * Get the field name for the root node.
 * @return {String | undefined} name
 */
jsoneditor.JSONEditor.prototype.getName = function () {
	return this.options.name;
};

/**
 * Remove the root node from the editor
 */
jsoneditor.JSONEditor.prototype.clear = function () {
	if (this.node) {
		this.node.collapse();
		this.tbody.removeChild(this.node.getDom());
		delete this.node;
	}
};

/**
 * Set the root node for the json editor
 * @param {jsoneditor.Node} node
 * @private
 */
jsoneditor.JSONEditor.prototype._setRoot = function (node) {
	this.clear();

	this.node = node;

	// append to the dom
	this.tbody.appendChild(node.getDom());
};

/**
 * Search text in all nodes
 * The nodes will be expanded when the text is found one of its childs,
 * else it will be collapsed. Searches are case insensitive.
 * @param {String} text
 * @return {Object[]} results  Array with nodes containing the search results
 *                             The result objects contains fields:
 *                             - {jsoneditor.Node} node,
 *                             - {String} elem  the dom element name where
 *                                              the result is found ('field' or
 *                                              'value')
 */
jsoneditor.JSONEditor.prototype.search = function (text) {
	var results;
	if (this.node) {
		this.content.removeChild(this.table); // Take the table offline
		results = this.node.search(text);
		this.content.appendChild(this.table); // Put the table online again
	} else {
		results = [];
	}

	return results;
};

/**
 * Expand all nodes
 */
jsoneditor.JSONEditor.prototype.expandAll = function () {
	if (this.node) {
		this.content.removeChild(this.table); // Take the table offline
		this.node.expand();
		this.content.appendChild(this.table); // Put the table online again
	}
};

/**
 * Collapse all nodes
 */
jsoneditor.JSONEditor.prototype.collapseAll = function () {
	if (this.node) {
		this.content.removeChild(this.table); // Take the table offline
		this.node.collapse();
		this.content.appendChild(this.table); // Put the table online again
	}
};

/**
 * The method onChange is called whenever a field or value is changed, created,
 * deleted, duplicated, etc.
 * @param {String} action  Change action. Available values: "editField",
 *                         "editValue", "changeType", "appendNode",
 *                         "removeNode", "duplicateNode", "moveNode", "expand",
 *                         "collapse".
 * @param {Object} params  Object containing parameters describing the change.
 *                         The parameters in params depend on the action (for
 *                         example for "editValue" the Node, old value, and new
 *                         value are provided). params contains all information
 *                         needed to undo or redo the action.
 * @private
 */
jsoneditor.JSONEditor.prototype._onAction = function (action, params) {
	// add an action to the history
	if (this.history) {
		this.history.add(action, params);
	}

	// trigger the onChange callback
	if (this.options.change) {
		try {
			this.options.change();
		} catch (err) {
			console.log('Error in change callback: ', err);
		}
	}
};

/**
 * Start autoscrolling when given mouse position is above the top of the
 * editor contents, or below the bottom.
 * @param {Number} mouseY  Absolute mouse position in pixels
 */
jsoneditor.JSONEditor.prototype.startAutoScroll = function (mouseY) {
	var me = this;
	var content = this.content;
	var top = jsoneditor.util.getAbsoluteTop(content);
	var height = content.clientHeight;
	var bottom = top + height;
	var margin = 24;
	var interval = 50; // ms

	if ((mouseY < top + margin) && content.scrollTop > 0) {
		this.autoScrollStep = ((top + margin) - mouseY) / 3;
	} else if (mouseY > bottom - margin && height + content.scrollTop < content.scrollHeight) {
		this.autoScrollStep = ((bottom - margin) - mouseY) / 3;
	} else {
		this.autoScrollStep = undefined;
	}

	if (this.autoScrollStep) {
		if (!this.autoScrollTimer) {
			this.autoScrollTimer = setInterval(function () {
				if (me.autoScrollStep) {
					content.scrollTop -= me.autoScrollStep;
				} else {
					me.stopAutoScroll();
				}
			}, interval);
		}
	} else {
		this.stopAutoScroll();
	}
};

/**
 * Stop auto scrolling. Only applicable when scrolling
 */
jsoneditor.JSONEditor.prototype.stopAutoScroll = function () {
	if (this.autoScrollTimer) {
		clearTimeout(this.autoScrollTimer);
		delete this.autoScrollTimer;
	}
	if (this.autoScrollStep) {
		delete this.autoScrollStep;
	}
};


/**
 * Set the focus to an element in the JSONEditor, set text selection, and
 * set scroll position.
 * @param {Object} selection  An object containing fields:
 *                            {Element | undefined} dom     The dom element
 *                                                          which has focus
 *                            {Range | TextRange} range     A text selection
 *                            {Number} scrollTop            Scroll position
 */
jsoneditor.JSONEditor.prototype.setSelection = function (selection) {
	if (!selection) {
		return;
	}

	if ('scrollTop' in selection && this.content) {
		// TODO: animated scroll
		this.content.scrollTop = selection.scrollTop;
	}
	if (selection.range) {
		jsoneditor.util.setSelectionOffset(selection.range);
	}
	if (selection.dom) {
		selection.dom.focus();
	}
};

/**
 * Get the current focus
 * @return {Object} selection An object containing fields:
 *                            {Element | undefined} dom     The dom element
 *                                                          which has focus
 *                            {Range | TextRange} range     A text selection
 *                            {Number} scrollTop            Scroll position
 */
jsoneditor.JSONEditor.prototype.getSelection = function () {
	return {
		dom: jsoneditor.JSONEditor.domFocus,
		scrollTop: this.content ? this.content.scrollTop : 0,
		range: jsoneditor.util.getSelectionOffset()
	};
};

/**
 * Adjust the scroll position such that given top position is shown at 1/4
 * of the window height.
 * @param {Number} top
 * @param {function(boolean)} [callback]   Callback, executed when animation is
 *                                         finished. The callback returns true
 *                                         when animation is finished, or false
 *                                         when not.
 */
jsoneditor.JSONEditor.prototype.scrollTo = function (top, callback) {
	var content = this.content;
	if (content) {
		var editor = this;
		// cancel any running animation
		if (editor.animateTimeout) {
			clearTimeout(editor.animateTimeout);
			delete editor.animateTimeout;
		}
		if (editor.animateCallback) {
			editor.animateCallback(false);
			delete editor.animateCallback;
		}

		// calculate final scroll position
		var height = content.clientHeight;
		var bottom = content.scrollHeight - height;
		var finalScrollTop = Math.min(Math.max(top - height / 4, 0), bottom);

		// animate towards the new scroll position
		var animate = function () {
			var scrollTop = content.scrollTop;
			var diff = (finalScrollTop - scrollTop);
			if (Math.abs(diff) > 3) {
				content.scrollTop += diff / 3;
				editor.animateCallback = callback;
				editor.animateTimeout = setTimeout(animate, 50);
			} else {
				// finished
				if (callback) {
					callback(true);
				}
				content.scrollTop = finalScrollTop;
				delete editor.animateTimeout;
				delete editor.animateCallback;
			}
		};
		animate();
	} else {
		if (callback) {
			callback(false);
		}
	}
};

/**
 * Create main frame
 * @private
 */
jsoneditor.JSONEditor.prototype._createFrame = function () {
	// create the frame
	this.container.innerHTML = '';
	this.frame = document.createElement('div');
	this.frame.className = 'jsoneditor';
	this.container.appendChild(this.frame);

	// create one global event listener to handle all events from all nodes
	var editor = this;
	var onEvent = function (event) {
		editor._onEvent(event);
	};
	this.frame.onclick = function (event) {
		onEvent(event);

		// prevent default submit action when JSONEditor is located inside a form
		jsoneditor.util.preventDefault(event);
	};
	this.frame.oninput = onEvent;
	this.frame.onchange = onEvent;
	this.frame.onkeydown = onEvent;
	this.frame.onkeyup = onEvent;
	this.frame.oncut = onEvent;
	this.frame.onpaste = onEvent;
	this.frame.onmousedown = onEvent;
	this.frame.onmouseup = onEvent;
	this.frame.onmouseover = onEvent;
	this.frame.onmouseout = onEvent;
	// Note: focus and blur events do not propagate, therefore they defined
	// using an eventListener with useCapture=true
	// see http://www.quirksmode.org/blog/archives/2008/04/delegating_the.html
	jsoneditor.util.addEventListener(this.frame, 'focus', onEvent, true);
	jsoneditor.util.addEventListener(this.frame, 'blur', onEvent, true);
	this.frame.onfocusin = onEvent; // for IE
	this.frame.onfocusout = onEvent; // for IE

	// create menu
	this.menu = document.createElement('div');
	this.menu.className = 'menu';
	this.frame.appendChild(this.menu);

	// create expand all button
	var expandAll = document.createElement('button');
	expandAll.className = 'expand-all';
	expandAll.title = '展开';
	expandAll.onclick = function () {
		editor.expandAll();
	};
	this.menu.appendChild(expandAll);

	// create expand all button
	var collapseAll = document.createElement('button');
	collapseAll.title = '折叠';
	collapseAll.className = 'collapse-all';
	collapseAll.onclick = function () {
		editor.collapseAll();
	};
	this.menu.appendChild(collapseAll);

	// create undo/redo buttons
	if (this.history) {
		// create separator
		var separator = document.createElement('span');
		separator.innerHTML = '&nbsp;';
		this.menu.appendChild(separator);

		// create undo button
		var undo = document.createElement('button');
		undo.className = 'undo';
		undo.title = '撤销 (Ctrl+Z)';
		undo.onclick = function () {
			editor._onUndo();
		};
		this.menu.appendChild(undo);
		this.dom.undo = undo;

		// create redo button
		var redo = document.createElement('button');
		redo.className = 'redo';
		redo.title = '重做 (Ctrl+Shift+Z)';
		redo.onclick = function () {
			editor._onRedo();
		};
		this.menu.appendChild(redo);
		this.dom.redo = redo;

		// register handler for onchange of history
		this.history.onChange = function () {
			undo.disabled = !editor.history.canUndo();
			redo.disabled = !editor.history.canRedo();
		};
		this.history.onChange();
	}

	// create search box
	if (this.options.search) {
		this.searchBox = new jsoneditor.SearchBox(this, this.menu);
	}
};

/**
 * Perform an undo action
 * @private
 */
jsoneditor.JSONEditor.prototype._onUndo = function () {
	if (this.history) {
		// undo last action
		this.history.undo();

		// trigger change callback
		if (this.options.change) {
			this.options.change();
		}
	}
};

/**
 * Perform a redo action
 * @private
 */
jsoneditor.JSONEditor.prototype._onRedo = function () {
	if (this.history) {
		// redo last action
		this.history.redo();

		// trigger change callback
		if (this.options.change) {
			this.options.change();
		}
	}
};

/**
 * Event handler
 * @param event
 * @private
 */
jsoneditor.JSONEditor.prototype._onEvent = function (event) {
	event = event || window.event;
	var target = event.target || event.srcElement;

	if (event.type == 'keydown') {
		this._onKeyDown(event);
	}

	if (event.type == 'focus') {
		jsoneditor.JSONEditor.domFocus = target;
	}

	var node = jsoneditor.Node.getNodeFromTarget(target);
	if (node) {
		node.onEvent(event);
	}
};

/**
 * Event handler for keydown. Handles shortcut keys
 * @param {Event} event
 * @private
 */
jsoneditor.JSONEditor.prototype._onKeyDown = function (event) {
	var keynum = event.which || event.keyCode;
	var ctrlKey = event.ctrlKey;
	var shiftKey = event.shiftKey;
	var handled = false;

	if (keynum == 9) { // Tab or Shift+Tab
		// FIXME: selecting all text on tab key does not work on IE8 (-> put selectContentEditable() in keyup too?)
		//jsoneditor.Node.select(jsoneditor.JSONEditor.domFocus);
		setTimeout(function () {
			// select all text when moving focus to an editable div
			jsoneditor.util.selectContentEditable(jsoneditor.JSONEditor.domFocus);
		}, 0);
	}

	if (this.searchBox) {
		if (ctrlKey && keynum == 70) { // Ctrl+F
			this.searchBox.dom.search.focus();
			this.searchBox.dom.search.select();
			handled = true;
		} else if (keynum == 114 || (ctrlKey && keynum == 71)) { // F3 or Ctrl+G
			var focus = true;
			if (!shiftKey) {
				// select next search result (F3 or Ctrl+G)
				this.searchBox.next(focus);
			} else {
				// select previous search result (Shift+F3 or Ctrl+Shift+G)
				this.searchBox.previous(focus);
			}

			handled = true;
		}
	}

	if (this.history) {
		if (ctrlKey && !shiftKey && keynum == 90) { // Ctrl+Z
			// undo
			this._onUndo();
			handled = true;
		} else if (ctrlKey && shiftKey && keynum == 90) { // Ctrl+Shift+Z
			// redo
			this._onRedo();
			handled = true;
		}
	}

	if (handled) {
		jsoneditor.util.preventDefault(event);
		jsoneditor.util.stopPropagation(event);
	}
};

/**
 * Create main table
 * @private
 */
jsoneditor.JSONEditor.prototype._createTable = function () {
	var contentOuter = document.createElement('div');
	contentOuter.className = 'outer';
	this.contentOuter = contentOuter;

	this.content = document.createElement('div');
	this.content.className = 'content';
	contentOuter.appendChild(this.content);

	this.table = document.createElement('table');
	this.table.className = 'content';
	this.content.appendChild(this.table);

	// IE8 does not handle overflow='auto' correctly.
	// Therefore, set overflow to 'scroll'
	var ieVersion = jsoneditor.util.getInternetExplorerVersion();
	if (ieVersion == 8) {
		this.content.style.overflow = 'scroll';
	}

	// create colgroup where the first two columns don't have a fixed
	// width, and the edit columns do have a fixed width
	var col;
	this.colgroupContent = document.createElement('colgroup');
	col = document.createElement('col');
	col.width = "24px";
	this.colgroupContent.appendChild(col);
	col = document.createElement('col');
	col.width = "24px";
	this.colgroupContent.appendChild(col);
	col = document.createElement('col');
	this.colgroupContent.appendChild(col);
	this.table.appendChild(this.colgroupContent);

	this.tbody = document.createElement('tbody');
	this.table.appendChild(this.tbody);

	this.frame.appendChild(contentOuter);
};

/*----------------------------------------------*/
/* history.js
/*----------------------------------------------*/
/**
 * @license
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not
 * use this file except in compliance with the License. You may obtain a copy
 * of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * License for the specific language governing permissions and limitations under
 * the License.
 *
 * Copyright (c) 2011-2013 Jos de Jong, http://jsoneditoronline.org
 *
 * @author  Jos de Jong, <wjosdejong@gmail.com>
 */

// create namespace
var jsoneditor = jsoneditor || {};

/**
 * @constructor jsoneditor.History
 * Store action history, enables undo and redo
 * @param {jsoneditor.JSONEditor} editor
 */
jsoneditor.History = function (editor) {
	this.editor = editor;
	this.clear();

	// map with all supported actions
	this.actions = {
		'editField': {
			'undo': function (params) {
				params.node.updateField(params.oldValue);
			},
			'redo': function (params) {
				params.node.updateField(params.newValue);
			}
		},
		'editValue': {
			'undo': function (params) {
				params.node.updateValue(params.oldValue);
			},
			'redo': function (params) {
				params.node.updateValue(params.newValue);
			}
		},
		'appendNode': {
			'undo': function (params) {
				params.parent.removeChild(params.node);
			},
			'redo': function (params) {
				params.parent.appendChild(params.node);
			}
		},
		'insertBeforeNode': {
			'undo': function (params) {
				params.parent.removeChild(params.node);
			},
			'redo': function (params) {
				params.parent.insertBefore(params.node, params.beforeNode);
			}
		},
		'insertAfterNode': {
			'undo': function (params) {
				params.parent.removeChild(params.node);
			},
			'redo': function (params) {
				params.parent.insertAfter(params.node, params.afterNode);
			}
		},
		'removeNode': {
			'undo': function (params) {
				var parent = params.parent;
				var beforeNode = parent.childs[params.index] || parent.append;
				parent.insertBefore(params.node, beforeNode);
			},
			'redo': function (params) {
				params.parent.removeChild(params.node);
			}
		},
		'duplicateNode': {
			'undo': function (params) {
				params.parent.removeChild(params.clone);
			},
			'redo': function (params) {
				params.parent.insertAfter(params.clone, params.node);
			}
		},
		'changeType': {
			'undo': function (params) {
				params.node.changeType(params.oldType);
			},
			'redo': function (params) {
				params.node.changeType(params.newType);
			}
		},
		'moveNode': {
			'undo': function (params) {
				params.startParent.moveTo(params.node, params.startIndex);
			},
			'redo': function (params) {
				params.endParent.moveTo(params.node, params.endIndex);
			}
		},
		'sort': {
			'undo': function (params) {
				var node = params.node;
				node.hideChilds();
				node.sort = params.oldSort;
				node.childs = params.oldChilds;
				node.showChilds();
			},
			'redo': function (params) {
				var node = params.node;
				node.hideChilds();
				node.sort = params.newSort;
				node.childs = params.newChilds;
				node.showChilds();
			}
		}

		// TODO: restore the original caret position and selection with each undo
		// TODO: implement history for actions "expand", "collapse", "scroll", "setDocument"
	};
};

/**
 * The method onChange is executed when the History is changed, and can
 * be overloaded.
 */
jsoneditor.History.prototype.onChange = function () {};

/**
 * Add a new action to the history
 * @param {String} action  The executed action. Available actions: "editField",
 *                         "editValue", "changeType", "appendNode",
 *                         "removeNode", "duplicateNode", "moveNode"
 * @param {Object} params  Object containing parameters describing the change.
 *                         The parameters in params depend on the action (for
 *                         example for "editValue" the Node, old value, and new
 *                         value are provided). params contains all information
 *                         needed to undo or redo the action.
 */
jsoneditor.History.prototype.add = function (action, params) {
	this.index++;
	this.history[this.index] = {
		'action': action,
		'params': params,
		'timestamp': new Date()
	};

	// remove redo actions which are invalid now
	if (this.index < this.history.length - 1) {
		this.history.splice(this.index + 1, this.history.length - this.index - 1);
	}

	// fire onchange event
	this.onChange();
};

/**
 * Clear history
 */
jsoneditor.History.prototype.clear = function () {
	this.history = [];
	this.index = -1;

	// fire onchange event
	this.onChange();
};

/**
 * Check if there is an action available for undo
 * @return {Boolean} canUndo
 */
jsoneditor.History.prototype.canUndo = function () {
	return (this.index >= 0);
};

/**
 * Check if there is an action available for redo
 * @return {Boolean} canRedo
 */
jsoneditor.History.prototype.canRedo = function () {
	return (this.index < this.history.length - 1);
};

/**
 * Undo the last action
 */
jsoneditor.History.prototype.undo = function () {
	if (this.canUndo()) {
		var obj = this.history[this.index];
		if (obj) {
			var action = this.actions[obj.action];
			if (action && action.undo) {
				action.undo(obj.params);
				if (obj.params.oldSelection) {
					this.editor.setSelection(obj.params.oldSelection);
				}
			} else {
				console.log('Error: unknown action "' + obj.action + '"');
			}
		}
		this.index--;

		// fire onchange event
		this.onChange();
	}
};

/**
 * Redo the last action
 */
jsoneditor.History.prototype.redo = function () {
	if (this.canRedo()) {
		this.index++;

		var obj = this.history[this.index];
		if (obj) {
			var action = this.actions[obj.action];
			if (action && action.redo) {
				action.redo(obj.params);
				if (obj.params.newSelection) {
					this.editor.setSelection(obj.params.newSelection);
				}
			} else {
				console.log('Error: unknown action "' + obj.action + '"');
			}
		}

		// fire onchange event
		this.onChange();
	}
};

/*----------------------------------------------*/
/* highlighter.js
/*----------------------------------------------*/
/**
 * @license
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not
 * use this file except in compliance with the License. You may obtain a copy
 * of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * License for the specific language governing permissions and limitations under
 * the License.
 *
 * Copyright (c) 2011-2013 Jos de Jong, http://jsoneditoronline.org
 *
 * @author  Jos de Jong, <wjosdejong@gmail.com>
 */

// create namespace
var jsoneditor = jsoneditor || {};

/**
 * The highlighter can highlight/unhighlight a node, and
 * animate the visibility of a context menu.
 * @constructor jsoneditor.Highlighter
 */
jsoneditor.Highlighter = function () {
	this.locked = false;
};

/**
 * Hightlight given node and its childs
 * @param {jsoneditor.Node} node
 */
jsoneditor.Highlighter.prototype.highlight = function (node) {
	if (this.locked) {
		return;
	}

	if (this.node != node) {
		// unhighlight current node
		if (this.node) {
			this.node.setHighlight(false);
		}

		// highlight new node
		this.node = node;
		this.node.setHighlight(true);
	}

	// cancel any current timeout
	this._cancelUnhighlight();
};

/**
 * Unhighlight currently highlighted node.
 * Will be done after a delay
 */
jsoneditor.Highlighter.prototype.unhighlight = function () {
	if (this.locked) {
		return;
	}

	var me = this;
	if (this.node) {
		this._cancelUnhighlight();

		// do the unhighlighting after a small delay, to prevent re-highlighting
		// the same node when moving from the drag-icon to the contextmenu-icon
		// or vice versa.
		this.unhighlightTimer = setTimeout(function () {
			me.node.setHighlight(false);
			me.node = undefined;
			me.unhighlightTimer = undefined;
		}, 0);
	}
};

/**
 * Cancel an unhighlight action (if before the timeout of the unhighlight action)
 * @private
 */
jsoneditor.Highlighter.prototype._cancelUnhighlight = function () {
	if (this.unhighlightTimer) {
		clearTimeout(this.unhighlightTimer);
		this.unhighlightTimer = undefined;
	}
};

/**
 * Lock highlighting or unhighlighting nodes.
 * methods highlight and unhighlight do not work while locked.
 */
jsoneditor.Highlighter.prototype.lock = function () {
	this.locked = true;
};

/**
 * Unlock highlighting or unhighlighting nodes
 */
jsoneditor.Highlighter.prototype.unlock = function () {
	this.locked = false;
};

/*----------------------------------------------*/
/* contextmenu.js
/*----------------------------------------------*/
/**
 * @license
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not
 * use this file except in compliance with the License. You may obtain a copy
 * of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * License for the specific language governing permissions and limitations under
 * the License.
 *
 * Copyright (c) 2011-2013 Jos de Jong, http://jsoneditoronline.org
 *
 * @author  Jos de Jong, <wjosdejong@gmail.com>
 */

// create namespace
var jsoneditor = jsoneditor || {};

/**
 * A context menu
 * @param {Object[]} items    Array containing the menu structure
 *                            TODO: describe structure
 * @param {Object} [options]  Object with options. Available options:
 *                            {function} close    Callback called when the
 *                                                context menu is being closed.
 * @constructor
 */
jsoneditor.ContextMenu = function (items, options) {
	this.dom = {};

	var me = this;
	var dom = this.dom;
	this.anchor = undefined;
	this.items = items;
	this.eventListeners = {};
	this.selection = undefined; // holds the selection before the menu was opened
	this.visibleSubmenu = undefined;
	this.onClose = options ? options.close : undefined;

	// create a container element
	var menu = document.createElement('div');
	menu.className = 'jsoneditor-contextmenu';
	dom.menu = menu;

	// create a list to hold the menu items
	var list = document.createElement('ul');
	list.className = 'menu';
	menu.appendChild(list);
	dom.list = list;
	dom.items = []; // list with all buttons

	// create a (non-visible) button to set the focus to the menu
	var focusButton = document.createElement('button');
	dom.focusButton = focusButton;
	var li = document.createElement('li');
	li.style.overflow = 'hidden';
	li.style.height = '0';
	li.appendChild(focusButton);
	list.appendChild(li);

	function createMenuItems(list, domItems, items) {
		items.forEach(function (item) {
			if (item.type == 'separator') {
				// create a separator
				var separator = document.createElement('div');
				separator.className = 'separator';
				li = document.createElement('li');
				li.appendChild(separator);
				list.appendChild(li);
			} else {
				var domItem = {};

				// create a menu item
				var li = document.createElement('li');
				list.appendChild(li);

				// create a button in the menu item
				var button = document.createElement('button');
				button.className = item.className;
				domItem.button = button;
				if (item.title) {
					button.title = item.title;
				}
				if (item.click) {
					button.onclick = function () {
						me.hide();
						item.click();
					};
				}
				li.appendChild(button);

				// create the contents of the button
				if (item.submenu) {
					// add the icon to the button
					var divIcon = document.createElement('div');
					divIcon.className = 'icon';
					button.appendChild(divIcon);
					button.appendChild(document.createTextNode(item.text));

					var buttonSubmenu;
					if (item.click) {
						// submenu and a button with a click handler
						button.className += ' default';

						var buttonExpand = document.createElement('button');
						domItem.buttonExpand = buttonExpand;
						buttonExpand.className = 'expand';
						buttonExpand.innerHTML = '<div class="expand"></div>';
						li.appendChild(buttonExpand);
						if (item.submenuTitle) {
							buttonExpand.title = item.submenuTitle;
						}

						buttonSubmenu = buttonExpand;
					} else {
						// submenu and a button without a click handler
						var divExpand = document.createElement('div');
						divExpand.className = 'expand';
						button.appendChild(divExpand);

						buttonSubmenu = button;
					}

					// attach a handler to expand/collapse the submenu
					buttonSubmenu.onclick = function () {
						me._onExpandItem(domItem);
						buttonSubmenu.focus();
					};

					// create the submenu
					var domSubItems = [];
					domItem.subItems = domSubItems;
					var ul = document.createElement('ul');
					domItem.ul = ul;
					ul.className = 'menu';
					ul.style.height = '0';
					li.appendChild(ul);
					createMenuItems(ul, domSubItems, item.submenu);
				} else {
					// no submenu, just a button with clickhandler
					button.innerHTML = '<div class="icon"></div>' + item.text;
				}

				domItems.push(domItem);
			}
		});
	}
	createMenuItems(list, this.dom.items, items);

	// TODO: when the editor is small, show the submenu on the right instead of inline?

	// calculate the max height of the menu with one submenu expanded
	this.maxHeight = 0; // height in pixels
	items.forEach(function (item) {
		var height = (items.length + (item.submenu ? item.submenu.length : 0)) * 24;
		me.maxHeight = Math.max(me.maxHeight, height);
	});
};

/**
 * Get the currently visible buttons
 * @return {Array.<HTMLElement>} buttons
 * @private
 */
jsoneditor.ContextMenu.prototype._getVisibleButtons = function () {
	var buttons = [];
	var me = this;
	this.dom.items.forEach(function (item) {
		buttons.push(item.button);
		if (item.buttonExpand) {
			buttons.push(item.buttonExpand);
		}
		if (item.subItems && item == me.expandedItem) {
			item.subItems.forEach(function (subItem) {
				buttons.push(subItem.button);
				if (subItem.buttonExpand) {
					buttons.push(subItem.buttonExpand);
				}
				// TODO: change to fully recursive method
			});
		}
	});

	return buttons;
};

// currently displayed context menu, a singleton. We may only have one visible context menu
jsoneditor.ContextMenu.visibleMenu = undefined;

/**
 * Attach the menu to an anchor
 * @param {HTMLElement} anchor
 */
jsoneditor.ContextMenu.prototype.show = function (anchor) {
	this.hide();

	// calculate whether the menu fits below the anchor
	var windowHeight = jsoneditor.util.getWindowHeight();
	var anchorHeight = anchor.offsetHeight;
	var menuHeight = this.maxHeight;

	// position the menu
	var left = jsoneditor.util.getAbsoluteLeft(anchor);
	var top = jsoneditor.util.getAbsoluteTop(anchor);
	if (top + anchorHeight + menuHeight < windowHeight) {
		// display the menu below the anchor
		this.dom.menu.style.left = left + 'px';
		this.dom.menu.style.top = (top + anchorHeight) + 'px';
		this.dom.menu.style.bottom = '';
	} else {
		// display the menu above the anchor
		this.dom.menu.style.left = left + 'px';
		this.dom.menu.style.top = '';
		this.dom.menu.style.bottom = (windowHeight - top) + 'px';
	}

	// attach the menu to the document
	document.body.appendChild(this.dom.menu);

	// create and attach event listeners
	var me = this;
	var list = this.dom.list;
	this.eventListeners.mousedown = jsoneditor.util.addEventListener(
	document, 'mousedown', function (event) {
		// hide menu on click outside of the menu
		event = event || window.event;
		var target = event.target || event.srcElement;
		if ((target != list) && !me._isChildOf(target, list)) {
			me.hide();
			jsoneditor.util.stopPropagation(event);
			jsoneditor.util.preventDefault(event);
		}
	});
	this.eventListeners.mousewheel = jsoneditor.util.addEventListener(
	document, 'mousewheel', function () {
		// hide the menu on mouse scroll
		jsoneditor.util.stopPropagation(event);
		jsoneditor.util.preventDefault(event);
	});
	this.eventListeners.keydown = jsoneditor.util.addEventListener(
	document, 'keydown', function (event) {
		me._onKeyDown(event);
	});

	// move focus to the first button in the context menu
	this.selection = jsoneditor.util.getSelection();
	this.anchor = anchor;
	setTimeout(function () {
		me.dom.focusButton.focus();
	}, 0);

	if (jsoneditor.ContextMenu.visibleMenu) {
		jsoneditor.ContextMenu.visibleMenu.hide();
	}
	jsoneditor.ContextMenu.visibleMenu = this;
};

/**
 * Hide the context menu if visible
 */
jsoneditor.ContextMenu.prototype.hide = function () {
	// remove the menu from the DOM
	if (this.dom.menu.parentNode) {
		this.dom.menu.parentNode.removeChild(this.dom.menu);
		if (this.onClose) {
			this.onClose();
		}
	}

	// remove all event listeners
	// all event listeners are supposed to be attached to document.
	for (var name in this.eventListeners) {
		if (this.eventListeners.hasOwnProperty(name)) {
			var fn = this.eventListeners[name];
			if (fn) {
				jsoneditor.util.removeEventListener(document, name, fn);
			}
			delete this.eventListeners[name];
		}
	}

	if (jsoneditor.ContextMenu.visibleMenu == this) {
		jsoneditor.ContextMenu.visibleMenu = undefined;
	}
};

/**
 * Expand a submenu
 * Any currently expanded submenu will be hided.
 * @param {Object} domItem
 * @private
 */
jsoneditor.ContextMenu.prototype._onExpandItem = function (domItem) {
	var me = this;
	var alreadyVisible = (domItem == this.expandedItem);

	// hide the currently visible submenu
	var expandedItem = this.expandedItem;
	if (expandedItem) {
		//var ul = expandedItem.ul;
		expandedItem.ul.style.height = '0';
		expandedItem.ul.style.padding = '';
		setTimeout(function () {
			if (me.expandedItem != expandedItem) {
				expandedItem.ul.style.display = '';
				jsoneditor.util.removeClassName(expandedItem.ul.parentNode, 'selected');
			}
		}, 300); // timeout duration must match the css transition duration
		this.expandedItem = undefined;
	}

	if (!alreadyVisible) {
		var ul = domItem.ul;
		ul.style.display = 'block';
		var height = ul.clientHeight; // force a reflow in Firefox
		setTimeout(function () {
			if (me.expandedItem == domItem) {
				ul.style.height = (ul.childNodes.length * 24) + 'px';
				ul.style.padding = '5px 10px';
			}
		}, 0);
		jsoneditor.util.addClassName(ul.parentNode, 'selected');
		this.expandedItem = domItem;
	}
};

/**
 * Handle onkeydown event
 * @param {Event} event
 * @private
 */
jsoneditor.ContextMenu.prototype._onKeyDown = function (event) {
	event = event || window.event;
	var target = event.target || event.srcElement;
	var keynum = event.which || event.keyCode;
	var handled = false;
	var buttons, targetIndex, prevButton, nextButton;

	if (keynum == 27) { // ESC
		// hide the menu on ESC key

		// restore previous selection and focus
		if (this.selection) {
			jsoneditor.util.setSelection(this.selection);
		}
		if (this.anchor) {
			this.anchor.focus();
		}

		this.hide();

		handled = true;
	} else if (keynum == 9) { // Tab
		if (!event.shiftKey) { // Tab
			buttons = this._getVisibleButtons();
			targetIndex = buttons.indexOf(target);
			if (targetIndex == buttons.length - 1) {
				// move to first button
				buttons[0].focus();
				handled = true;
			}
		} else { // Shift+Tab
			buttons = this._getVisibleButtons();
			targetIndex = buttons.indexOf(target);
			if (targetIndex == 0) {
				// move to last button
				buttons[buttons.length - 1].focus();
				handled = true;
			}
		}
	} else if (keynum == 37) { // Arrow Left
		if (target.className == 'expand') {
			buttons = this._getVisibleButtons();
			targetIndex = buttons.indexOf(target);
			prevButton = buttons[targetIndex - 1];
			if (prevButton) {
				prevButton.focus();
			}
		}
		handled = true;
	} else if (keynum == 38) { // Arrow Up
		buttons = this._getVisibleButtons();
		targetIndex = buttons.indexOf(target);
		prevButton = buttons[targetIndex - 1];
		if (prevButton && prevButton.className == 'expand') {
			// skip expand button
			prevButton = buttons[targetIndex - 2];
		}
		if (!prevButton) {
			// move to last button
			prevButton = buttons[buttons.length - 1];
		}
		if (prevButton) {
			prevButton.focus();
		}
		handled = true;
	} else if (keynum == 39) { // Arrow Right
		buttons = this._getVisibleButtons();
		targetIndex = buttons.indexOf(target);
		nextButton = buttons[targetIndex + 1];
		if (nextButton && nextButton.className == 'expand') {
			nextButton.focus();
		}
		handled = true;
	} else if (keynum == 40) { // Arrow Down
		buttons = this._getVisibleButtons();
		targetIndex = buttons.indexOf(target);
		nextButton = buttons[targetIndex + 1];
		if (nextButton && nextButton.className == 'expand') {
			// skip expand button
			nextButton = buttons[targetIndex + 2];
		}
		if (!nextButton) {
			// move to first button
			nextButton = buttons[0];
		}
		if (nextButton) {
			nextButton.focus();
			handled = true;
		}
		handled = true;
	}
	// TODO: arrow left and right

	if (handled) {
		jsoneditor.util.stopPropagation(event);
		jsoneditor.util.preventDefault(event);
	}
};

/**
 * Test if an element is a child of a parent element.
 * @param {Element} child
 * @param {Element} parent
 * @return {boolean} isChild
 */
jsoneditor.ContextMenu.prototype._isChildOf = function (child, parent) {
	var e = child.parentNode;
	while (e) {
		if (e == parent) {
			return true;
		}
		e = e.parentNode;
	}

	return false;
};


/*----------------------------------------------*/
/* appendnode.js
/*----------------------------------------------*/
/**
 * @license
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not
 * use this file except in compliance with the License. You may obtain a copy
 * of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * License for the specific language governing permissions and limitations under
 * the License.
 *
 * Copyright (c) 2011-2013 Jos de Jong, http://jsoneditoronline.org
 *
 * @author  Jos de Jong, <wjosdejong@gmail.com>
 */

// create namespace
var jsoneditor = jsoneditor || {};

/**
 * @constructor jsoneditor.AppendNode
 * @extends jsoneditor.Node
 * @param {jsoneditor.JSONEditor} editor
 * Create a new AppendNode. This is a special node which is created at the
 * end of the list with childs for an object or array
 */
jsoneditor.AppendNode = function (editor) {
	this.editor = editor;
	this.dom = {};
};

jsoneditor.AppendNode.prototype = new jsoneditor.Node();

/**
 * Return a table row with an append button.
 * @return {Element} dom   TR element
 */
jsoneditor.AppendNode.prototype.getDom = function () {
	// TODO: do not create the DOM for the appendNode when in viewer mode
	// TODO: implement a new solution for the append node
	var dom = this.dom;

	if (dom.tr) {
		return dom.tr;
	}

	// a row for the append button
	var trAppend = document.createElement('tr');
	trAppend.node = this;
	dom.tr = trAppend;

	// when in viewer mode, don't create the contents for the append node
	// but return here.
	if (!this.editor.mode.editor) {
		return trAppend;
	}

	// TODO: consistent naming

	// a cell for the dragarea column
	var tdDrag = document.createElement('td');
	dom.tdDrag = tdDrag;

	// create context menu
	var tdMenu = document.createElement('td');
	var menu = document.createElement('button');
	menu.className = 'contextmenu';
	menu.title = '菜单 (Ctrl+M)';
	dom.menu = menu;
	dom.tdMenu = tdMenu;
	tdMenu.appendChild(dom.menu);

	// a cell for the contents (showing text 'empty')
	var tdAppend = document.createElement('td');
	var domText = document.createElement('div');
	domText.innerHTML = '(empty)';
	domText.className = 'readonly';
	tdAppend.appendChild(domText);
	dom.td = tdAppend;
	dom.text = domText;

	this.updateDom();

	return trAppend;
};

/**
 * Update the HTML dom of the Node
 */
jsoneditor.AppendNode.prototype.updateDom = function () {
	var dom = this.dom;
	var tdAppend = dom.td;
	if (tdAppend) {
		tdAppend.style.paddingLeft = (this.getLevel() * 24 + 26) + 'px';
		// TODO: not so nice hard coded offset
	}

	var domText = dom.text;
	if (domText) {
		domText.innerHTML = '(empty ' + this.parent.type + ')';
	}

	// attach or detach the contents of the append node:
	// hide when the parent has childs, show when the parent has no childs
	var trAppend = dom.tr;
	if (!this.isVisible()) {
		if (dom.tr.firstChild) {
			trAppend.removeChild(dom.tdDrag);
			trAppend.removeChild(dom.tdMenu);
			trAppend.removeChild(tdAppend);
		}
	} else {
		if (!dom.tr.firstChild) {
			trAppend.appendChild(dom.tdDrag);
			trAppend.appendChild(dom.tdMenu);
			trAppend.appendChild(tdAppend);
		}
	}
};

/**
 * Check whether the AppendNode is currently visible.
 * the AppendNode is visible when its parent has no childs (i.e. is empty).
 * @return {boolean} isVisible
 */
jsoneditor.AppendNode.prototype.isVisible = function () {
	return (this.parent.childs.length == 0);
};

/**
 * Show a contextmenu for this node
 * @param {HTMLElement} anchor   The element to attach the menu to.
 * @param {function} [onClose]   Callback method called when the context menu
 *                               is being closed.
 */
jsoneditor.AppendNode.prototype.showContextMenu = function (anchor, onClose) {
	var node = this;
	var titles = jsoneditor.Node.TYPE_TITLES;
	var items = [
	// create append button
	{
		'text': 'Append',
		'title': 'Append a new field with type \'auto\' (Ctrl+Shift+Ins)',
		'submenuTitle': 'Select the type of the field to be appended',
		'className': 'insert',
		'click': function () {
			node._onAppend('', '', 'auto');
		},
		'submenu': [{
			'text': 'Auto',
			'className': 'type-auto',
			'title': titles.auto,
			'click': function () {
				node._onAppend('', '', 'auto');
			}
		}, {
			'text': 'Array',
			'className': 'type-array',
			'title': titles.array,
			'click': function () {
				node._onAppend('', []);
			}
		}, {
			'text': 'Object',
			'className': 'type-object',
			'title': titles.object,
			'click': function () {
				node._onAppend('', {});
			}
		}, {
			'text': 'String',
			'className': 'type-string',
			'title': titles.string,
			'click': function () {
				node._onAppend('', '', 'string');
			}
		}]
	}];

	var menu = new jsoneditor.ContextMenu(items, {
		close: onClose
	});
	menu.show(anchor);
};

/**
 * Handle an event. The event is catched centrally by the editor
 * @param {Event} event
 */
jsoneditor.AppendNode.prototype.onEvent = function (event) {
	var type = event.type;
	var target = event.target || event.srcElement;
	var dom = this.dom;

	// highlight the append nodes parent
	var menu = dom.menu;
	if (target == menu) {
		if (type == 'mouseover') {
			this.editor.highlighter.highlight(this.parent);
		} else if (type == 'mouseout') {
			this.editor.highlighter.unhighlight();
		}
	}

	// context menu events
	if (type == 'click' && target == dom.menu) {
		var highlighter = this.editor.highlighter;
		highlighter.highlight(this.parent);
		highlighter.lock();
		jsoneditor.util.addClassName(dom.menu, 'selected');
		this.showContextMenu(dom.menu, function () {
			jsoneditor.util.removeClassName(dom.menu, 'selected');
			highlighter.unlock();
			highlighter.unhighlight();
		});
	}

	if (type == 'keydown') {
		this.onKeyDown(event);
	}
};

/*----------------------------------------------*/
/* app.js
/*----------------------------------------------*/
/*!
 * @file app.js
 *
 * @brief
 * JSONEditor is an editor to display and edit JSON data in a treeview.
 *
 * Supported browsers: Chrome, Firefox, Safari, Opera, Internet Explorer 8+
 *
 * @license
 * This json editor is open sourced with the intention to use the editor as
 * a component in your own application. Not to just copy and monetize the editor
 * as it is.
 *
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not
 * use this file except in compliance with the License. You may obtain a copy
 * of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * License for the specific language governing permissions and limitations under
 * the License.
 *
 * Copyright (C) 2011-2013 Jos de Jong, http://jsoneditoronline.org
 *
 * @author  Jos de Jong, <wjosdejong@gmail.com>
 * @date    2013-02-09
 */


var editor = null;
var formatter = null;

var app = {};

/**
 * Get the JSON from the formatter and load it in the editor
 */
app.formatterToEditor = function () {
	try {
		editor.set(formatter.get());
	} catch (err) {
		app.notify.showError(err);
	}
};

/**
 * Get the JSON from the editor and load it into the formatter
 */
app.editorToFormatter = function () {
	try {
		formatter.set(editor.get());
	} catch (err) {
		app.notify.showError(err);
	}
};

/**
 * Load the interface (editor, formatter, splitter)
 */
// TODO: split the method load in multiple methods, it is too large
app.load = function () {
	try {
		// notification handler
		app.notify = new Notify();

		// default json document
		var json = {
			"name": "JSON中国",
			"url": "http://www.json.org.cn",
			"page": 88,
			"isNonProfit": true,
			"address": {
				"street": "浙大路38号.",
				"city": "浙江杭州",
				"country": "中国"
			},
			"links": [{
				"name": "Google",
				"url": "http://www.google.com"
			}, {
				"name": "Baidu",
				"url": "http://www.baidu.com"
			}, {
				"name": "SoSo",
				"url": "http://www.SoSo.com"
			}]
		};

		// load url if query parameters contains a url
		if (window.QueryParams) {
			var qp = new QueryParams();
			var url = qp.getValue('url');
			if (url) {
				json = {};
				app.openUrl(url);
			}
		}

		// Store whether editor or formatter is last changed
		app.lastChanged = undefined;

		// formatter
		var container = document.getElementById("jsonformatter");
		formatter = new jsoneditor.JSONFormatter(container, {
			change: function () {
				app.lastChanged = formatter;
			}
		});
		formatter.set(json);
		formatter.onError = function (err) {
			app.notify.showError(err);
		};

		// editor
		container = document.getElementById("jsoneditor");
		editor = new jsoneditor.JSONEditor(container, {
			change: function () {
				app.lastChanged = editor;
			}
		});
		editor.set(json);
		// TODO: automatically synchronize data of formatter and editor? (editor should keep its state though)

		// splitter
		var domSplitter = document.getElementById('splitter');
		app.splitter = new Splitter({
			container: domSplitter,
			change: function () {
				app.resize();
			}
		});

		// button Formatter-to-Editor
		domSplitter.appendChild(document.createElement('br'));
		domSplitter.appendChild(document.createElement('br'));
		domSplitter.appendChild(document.createElement('br'));
		var toForm = document.createElement('button');
		toForm.id = 'toForm';
		toForm.title = '解析JSON';
		toForm.className = 'convert';
		toForm.innerHTML = '<div class="convert-right"></div>';
		toForm.onclick = function () {
			this.focus();
			app.formatterToEditor();
		};
		domSplitter.appendChild(toForm);

		// button Editor-to-Formatter
		domSplitter.appendChild(document.createElement('br'));
		domSplitter.appendChild(document.createElement('br'));
		var toJSON = document.createElement('button');
		toJSON.id = 'toJSON';
		toJSON.title = '保存JSON';
		toJSON.className = 'convert';
		toJSON.innerHTML = '<div class="convert-left"></div>';
		toJSON.onclick = function () {
			this.focus();
			app.editorToFormatter();
		};
		domSplitter.appendChild(toJSON);

		// web page resize handler
		jsoneditor.util.addEventListener(window, 'resize', app.resize);

		// clear button
		/* TODO: enable clicking on open to execute the default, "open file"
        // open button
        var domOpen = document.getElementById('open');
        var domOpenMenuButton = document.getElementById('openMenuButton');
        domOpen.onclick = function (event) {
            event = event || window.event; // for IE8
            var target = event.target || event.srcElement;
            if (target == domOpenMenuButton ||
                    (event.offsetX > domOpen.offsetWidth - domOpenMenuButton.offsetWidth)) {
                // clicked on the menu button
            }
            else {
                app.openFile();
            }
        };
        */

		// TODO: implement a focus method
		formatter.textarea.focus();

		// enforce FireFox to not do spell checking on any input field
		document.body.spellcheck = false;
	} catch (err) {
		console.info(err);
		app.notify.showError(err);
	}
};

/**
 * Callback method called when a file or url is opened.
 * @param {Error} err
 * @param {String} data
 */
app.openCallback = function (err, data) {
	if (!err) {
		if (data != undefined) {
			formatter.setText(data);
			try {
				var json = jsoneditor.util.parse(data);
				editor.set(json);
			} catch (err) {
				editor.set({});
				app.notify.showError(err);
			}
		}
	} else {
		app.notify.showError(err);
	}
};



/**
 * Open a file explorer to save the file.
 */

/**
 * Clear the current file
 */
app.clearFile = function () {
	var json = {};
	formatter.set(json);
	editor.set(json);
};

app.resize = function () {
	var domEditor = document.getElementById('jsoneditor');
	var domFormatter = document.getElementById('jsonformatter');
	var domSplitter = document.getElementById('splitter');
	var domAd = document.getElementById('ad');
	var domAdInfo = document.getElementById('adInfo');

	var width = window.innerWidth || document.body.offsetWidth || document.documentElement.offsetWidth;
	var height = window.innerHeight || document.body.offsetHeight || document.documentElement.offsetHeight;
	var adWidth = domAd ? domAd.clientWidth : 0;
	var splitterWidth = domSplitter.clientWidth;
	if (adWidth) {
		width -= (adWidth + 15); // Not so nice, +15 here for the margin
	}

	if (app.splitter) {
		var splitterLeft = width * app.splitter.getValue();

		// resize formatter
		domFormatter.style.width = Math.round(splitterLeft) + 'px';

		// resize editor
		// the width has a -1 to prevent the width from being just half a pixel
		// wider than the window, causing the content elements to wrap...
		domEditor.style.left = Math.round(splitterLeft + splitterWidth) + 'px';
		domEditor.style.width = Math.round(width - splitterLeft - splitterWidth - 1) + 'px';
	}

	// resize ad text
	if (domAdInfo && domAd) {
		var infoHeight = domAdInfo.clientHeight;
		domAd.style.paddingTop = infoHeight + 'px';
	}
};

/**
 * Hide the advertisement
 */
app.hideAds = function () {
	var domAd = document.getElementById("ad");
	if (domAd) {
		domAd.parentNode.removeChild(domAd);
		app.resize();
	}
};