/**
 * @summary     SelectMenu
 * @desc        Simple, easily and diversity menu solution
 * @file        selectmenu.js
 * @version     2.1
 * @author      TerryZeng
 * @contact     https://terryz.github.io/
 * @license     MIT License
 *
 * depend on：
 * jQuery1.x
 *
 */
;(function($){
	"use strict";
    /**
     * Version: v3.6.1
     * The MIT License: Copyright (c) 2010-2017 LiosK.
     * Link: https://github.com/LiosK/UUID.js
     */
    var UUID;
    UUID=function(f){function a(){}a.generate=function(){var b=a._getRandomInt,c=a._hexAligner;return c(b(32),8)+"-"+c(b(16),4)+"-"+c(16384|b(12),4)+"-"+c(32768|b(14),4)+"-"+c(b(48),12)};a._getRandomInt=function(b){if(0>b||53<b)return NaN;var c=0|1073741824*Math.random();return 30<b?c+1073741824*(0|Math.random()*(1<<b-30)):c>>>30-b};a._hexAligner=function(b,c){for(var a=b.toString(16),d=c-a.length,e="0";0<d;d>>>=1,e+=e)d&1&&(a=e+a);return a};a.overwrittenUUID=f;"undefined"!==typeof module&&module&&module.exports&&
    (module.exports=a);return a}(UUID);
	/**
	 * Default options
	 */
	var defaults = {
		/**
		 * Menu data source
		 * @type array | function
		 * @example
		 * array：[{a:1,b:2,c:3},{...}]
         * function: function(){ return [{...}];}
         * return data format is same to array
		 */
		data: undefined,
        /**
         * Show quick search input element, work on advance menu mode
         * @type boolean
         * @default true
         */
        search : true,
        /**
         * Title bar text, set false to close title bar
         * @type string | boolean
         * @default 'SelectMenu'
         */
        title : 'SelectMenu',
        /**
         * Regular menu mode
         * @type boolean
         * @default false
         */
        regular : false,
        /**
         * Mouse right click to show menu
         * @type boolean
         * @default false
         */
        rightClick : false,
        /**
         * Menu show arrow, look like a bubble
         * @type boolean
         * @default false
         */
        arrow : false,
        /**
         * Alignment direction
         * @type string
         * @enum
         * 'left'
         * 'center'
         * 'right'
         * @default 'left'
         */
        position : 'left',
        /**
         * Embedded to page
         * @type boolean
         * @default false
         */
        embed : false,
		/**
		 * Language ('cn', 'ja', 'en', 'es', 'pt-br')
		 * @type string
         * @default 'cn'
		 */
		lang: 'cn',
		/**
		 * Multiple select mode（tags）
		 * @type boolean
         * @default false
		 */
		multiple: false,
        /**
         * Menu result list size, the number mean is visible menu item amount
         * @type number
         * @default 10
         */
        listSize : 10,
		/**
		 * Maximum selected item limit in multiple select mode, set 0 to unlimited
		 * @type number
         * @default 0 (unlimited)
		 */
		maxSelectLimit: 0,
		/**
		 * Close result list after menu item selected, work on multiple select mode
		 * @type boolean
         * @default true
		 */
		selectToCloseList: false,
		/**
		 * Set a key to selected menu item when plugin init complete, work on multiple select mode
         * the key will match to keyField
		 * @type string 
		 */
		initSelected: undefined,
		/**
		 * Key field to return data
		 * @type string
         * @default 'id'
		 */
		keyField: 'id',
		/**
		 * Show content field
		 * @type string
         * @default 'name'
		 */
		showField: 'name',
        /**
         * Data field in search, not set default used showField
         * @type string
         */
        searchField : undefined,
		/**
		 * Filter type ('AND' or 'OR')
		 * @type string default: 'AND'
		 */
		andOr: 'AND',
        /**
         * Sort order, not set default used showField
         * @type array
         * @example
         * orderBy : ['id desc']//order by id desc
         */
        orderBy: undefined,
		/**
		 * Max item size
		 * @type number
		 */
		pageSize: 100,
		/**
		 * Menu item result format
		 * @type function
		 * @param data {object} menu item data
		 * @return string
		 */
		formatItem : undefined,
		/**
		 * -----------------------------------------Event--------------------------------------------
		 */
		/**
         * Menu item select callback
		 * @type function
		 * @param data {array[Object]} selected items data
		 */
		eSelect : undefined,
        /**
         * Multiple group data type tab switch callback
         * @type function
         * @param index {number}
         */
        eTabSwitch : undefined,
        /**
         * Menu hide callback
         * @type function
         * @param data {array[Object]} selected items data
         */
        eHidden : undefined
	};


	/**
	 * @constructor
	 * @param {Object} input - menu caller
	 * @param {Object} option - menu init option
	 */
	var SelectMenu = function(input, option) {
	    this.target = input;
		this.setOption(option);
		if(this.option.embed && !$(input).is('div')){
		    console.warn('SelectMenu embed mode need a "div" container element!');
		    return;
        }

		this.setLanguage();
		this.setCssClass();
		this.setProp();

        if(option.regular) this.setRegularMenu();
        else this.setElem();

        if(!option.rightClick) this.populate();

        this.eInput();
        if(!option.embed) this.eWhole();
		this.atLast();
	};
    /**
     * Plugin version number
     */
	SelectMenu.version = '2.1';
	/**
	 * Plugin object cache key
	 */
	SelectMenu.dataKey = 'selectMenuObject';
    /**
     * Data source type
     * List type
     */
	SelectMenu.dataTypeList = 'SelectMenuList';
    /**
     * Group type
     */
    SelectMenu.dataTypeGroup = 'SelectMenuGroup';
    /**
     * Regular menu type
     */
    SelectMenu.dataTypeMenu = 'SelectMenuMenu';
	/**
	 * Initial plugin option
	 * @param {Object} option
	 */
	SelectMenu.prototype.setOption = function(option) {
        //if not set, default used showField set field
        option.searchField = option.searchField || option.showField;

		if(option.regular && option.title === defaults.title) option.title = false;
		//Close arrow in embed and mouse right click mode
		if(option.embed || option.rightClick) option.arrow = false;

		option.andOr = option.andOr.toUpperCase();
		if(option.andOr!=='AND' && option.andOr!=='OR') option.andOr = 'AND';

		option.orderBy = (option.orderBy === undefined) ? option.showField : option.orderBy;

		//Multiple field sort
		//Example:  [ ['id', 'ASC'], ['name', 'DESC'] ]
		option.orderBy = this.setOrderbyOption(option.orderBy, option.showField);

		if($.type(option.data) === 'string'){
		    option.autoSelectFirst = false;
        }
		if($.type(option.listSize) !== 'number' || option.listSize < 0) option.listSize = 12;

		this.option = option;
	};

	/**
	 * Initial order
	 * @param {Array} arg_order
	 * @param {string} arg_field
	 * @return {Array}
	 */
	SelectMenu.prototype.setOrderbyOption = function(arg_order, arg_field) {
		var arr = [],orders = [];
		if (typeof arg_order == 'object') {
			for (var i = 0; i < arg_order.length; i++) {
				orders = $.trim(arg_order[i]).split(' ');
				arr[i] = (orders.length == 2) ? orders: [orders[0], 'ASC'];
			}
		} else {
			orders = $.trim(arg_order).split(' ');
			arr[0] = (orders.length == 2) ? orders: (orders[0].match(/^(ASC|DESC)$/i)) ? [arg_field, orders[0]] : [orders[0], 'ASC'];
		}
		return arr;
	};

	/**
	 * i18n
	 */
	SelectMenu.prototype.setLanguage = function() {
		var message;
		switch (this.option.lang) {
            // 中文
            case 'cn':
                message = {
                    select_all_btn: '选择所有 (或当前页签) 项目',
                    remove_all_btn: '清除所有选中的项目',
                    close_btn: '关闭菜单 (Esc键)',
                    loading: '读取中...',
                    select_ng: '请注意：请从列表中选择.',
                    select_ok: 'OK : 已经选择.',
                    not_found: '无查询结果',
                    ajax_error: '连接到服务器时发生错误！',
                    max_selected: '最多只能选择 max_selected_limit 个项目'
                };
                break;
            // English
            case 'en':
                message = {
                    select_all_btn: 'Select All (Tabs) items',
                    remove_all_btn: 'Clear all selected items',
                    close_btn: 'Close Menu (Esc key)',
                    loading: 'loading...',
                    select_ng: 'Attention : Please choose from among the list.',
                    select_ok: 'OK : Correctly selected.',
                    not_found: 'not found',
                    ajax_error: 'An error occurred while connecting to server.',
                    max_selected: 'You can only select up to max_selected_limit items'
                };
                break;
            // Japanese
            case 'ja':
                message = {
                    select_all_btn: 'すべての （または現在のタブ） 項目を選択',
                    remove_all_btn: '選択したすべての項目をクリアする',
                    close_btn: '閉じる (Tabキー)',
                    loading: '読み込み中...',
                    select_ng: '注意 : リストの中から選択してください',
                    select_ok: 'OK : 正しく選択されました。',
                    not_found: '(0 件)',
                    ajax_error: 'サーバとの通信でエラーが発生しました。',
                    max_selected: '最多で max_selected_limit のプロジェクトを選ぶことしかできません'
                };
                break;
            // German
            case 'de':
                message = {
                    select_all_btn: 'Wählen Sie alle (oder aktuellen Registerkarten) aus',
                    remove_all_btn: 'Alle ausgewählten Elemente löschen',
                    close_btn: 'Schließen (Tab)',
                    loading: 'lade...',
                    select_ng: 'Achtung: Bitte wählen Sie aus der Liste aus.',
                    select_ok: 'OK : Richtig ausgewählt.',
                    not_found: 'nicht gefunden',
                    ajax_error: 'Bei der Verbindung zum Server ist ein Fehler aufgetreten.',
                    max_selected: 'Sie können nur bis zu max_selected_limit Elemente auswählen'
                };
                break;
            // Spanish
            case 'es':
                message = {
                    select_all_btn: 'Seleccionar todos los elementos (o la pestaña actual)',
                    remove_all_btn: 'Borrar todos los elementos seleccionados',
                    close_btn: 'Cerrar (tecla TAB)',
                    loading: 'Cargando...',
                    select_ng: 'Atencion: Elija una opcion de la lista.',
                    select_ok: 'OK: Correctamente seleccionado.',
                    not_found: 'no encuentre',
                    ajax_error: 'Un error ocurrió mientras conectando al servidor.',
                    max_selected: 'Solo puedes seleccionar hasta max_selected_limit elementos'
                };
                break;
            // Brazilian Portuguese
            case 'pt-br':
                message = {
                    select_all_btn: 'Selecione todos os itens (ou guia atual)',
                    remove_all_btn: 'Limpe todos os itens selecionados',
                    close_btn: 'Fechar (tecla TAB)',
                    loading: 'Carregando...',
                    select_ng: 'Atenção: Escolha uma opção da lista.',
                    select_ok: 'OK: Selecionado Corretamente.',
                    not_found: 'não encontrado',
                    ajax_error: 'Um erro aconteceu enquanto conectando a servidor.',
                    max_selected: 'Você só pode selecionar até max_selected_limit itens'
                };
                break;
		}
		this.message = message;
	};

	/**
	 * CSS classname set
	 */
	SelectMenu.prototype.setCssClass = function() {
		var css_class = {
		    target_clicked : 'sm_target_clicked',
			container: 'sm_container',
			container_open: 'sm_container_open',
            container_embed: 'sm_embed',
            header: 'sm_header',
			re_area: 'sm_result_area',
            re_tabs: 'sm_result_tabs',
            re_list: 'sm_list_mode',
			control_box: 'sm_control_box',
            two_btn: 'sm_two_btn',
			element_box: 'sm_element_box',
			results: 'sm_results',
			re_off: 'sm_results_off',
			select: 'sm_over',
            selected_icon: 'sm_selected_icon',
            item_text: 'sm_item_text',
			select_ok: 'sm_select_ok',
			select_ng: 'sm_select_ng',
            selected: 'sm_selected',
			input_off: 'sm_input_off',
			message_box: 'sm_message_box',

			btn_close: 'sm_close_button',
            btn_selectall: 'sm_selectall_button',
            btn_removeall: 'sm_removeall_button',
			btn_on: 'sm_btn_on',
			btn_out: 'sm_btn_out',
            btn_back: 'sm_sub_back',
			input: 'sm_input',
            input_area: 'sm_input_area',
            clear_btn: 'sm_clear_btn',

            menu_root: 'sm_menu_root',
            menu_divider: 'sm_divider',
            menu_regular: 'sm_regular',
            menu_arrow: 'sm_arrow',
            menu_arrow_have_title : 'sm_have_title',
            menu_disabled: 'sm_disabled',
            menu_header: 'sm_header',
            menu_caret: 'sm_caret',
            menu_sub_menu: 'sm_sub_menu',
            menu_sub_item: 'sm_sub_item',
            menu_sub_header: 'sm_sub_header',


            direction_top : 'sm_arrow_top',
            direction_bottom : 'sm_arrow_bottom'
		};
		this.css_class = css_class;
        this.template = {
            msg :{
                maxSelectLimit: 'max_selected_limit'
            }
        };
	};

	/**
	 * Internal variable initial
	 */
	SelectMenu.prototype.setProp = function() {
		this.prop = {
		    //selected menu item keys
		    values : [],
            data : undefined,
            //multiple group data current data index
            data_index : 0,
			key_select: false,
			prev_value: '',
            selected_text : '',
			last_input_time: undefined,
            //menu data type
            data_type : SelectMenu.dataTypeList,
            //id prefix
            menu_tab_id_prefix : 'selectmenu_tab_',
            menu_code_prefix: 'selectmenu_',
            //mouse x point
            x : undefined,
            //mouse y point
            y : undefined
		};
	};

    /**
     * Data source type check
     */
    SelectMenu.prototype.checkDataType = function(d){
        var self = this,p = this.option;
        if(d && $.isArray(d) && d.length){
            if(p.regular) return SelectMenu.dataTypeMenu;
            else{
                var row = d[0];
                if(row.hasOwnProperty('title') && row.hasOwnProperty('list') && $.isArray(row.list)){
                    return SelectMenu.dataTypeGroup;
                }else return SelectMenu.dataTypeList;
            }
        }else return null;
    };

	/**
     * Menu structure build
	 */
	SelectMenu.prototype.setElem = function() {
	    var self = this, p = this.option, css = this.css_class;
		// 1. build dom element
		var elem = {};

        elem.container = p.embed ? $(self.target).addClass(css.container_embed) : $('<div>');
        elem.container.addClass(css.container).addClass(css.direction_bottom);
        if(p.title){
            elem.header = $('<div>').addClass(css.header);
            elem.header.append('<h3>' + p.title + '</h3>');
            if(p.multiple){
                elem.selectAllButton = $('<button type="button"><i class="iconfont icon-selectall"></i></button>')
                    .attr('title',this.message.select_all_btn)
                    .addClass(css.btn_selectall);
                elem.removeAllButton = $('<button type="button"><i class="iconfont icon-removeall"></i></button>')
                    .attr('title',this.message.remove_all_btn)
                    .addClass(css.btn_removeall);
                elem.header.append(elem.selectAllButton);
                elem.header.append(elem.removeAllButton);
            }

            if(!p.embed){
                elem.closeButton = $('<button type="button">×</button>')
                    .attr('title',self.message.close_btn)
                    .addClass(css.btn_close);
                elem.header.append(elem.closeButton);
            }
        }

        elem.inputArea = $('<div>').addClass(css.input_area);
		elem.input = $('<input type="text" autocomplete="off">').addClass(css.input);

		//Result list
		elem.resultArea = $('<div>').addClass(css.re_area);
        elem.resultTabs = $('<div>').addClass(css.re_tabs);
        elem.results = $('<ul>').addClass(css.results);
        elem.selectedIcon = $('<i class="iconfont icon-selected">');

		// 2. DOM element put
        if(p.arrow){
            elem.arrow = $('<div>').addClass(css.menu_arrow);
            if(p.title) elem.arrow.addClass(css.menu_arrow_have_title);
            elem.container.append(elem.arrow);
        }
        if(p.title) elem.container.append(elem.header);
        if(p.search){
            elem.container.append(elem.inputArea);
            elem.inputArea.append(elem.input);
        }
        elem.container.append(elem.resultTabs).append(elem.resultArea);
		elem.resultArea.append(elem.results);

		if(!p.embed) $(document.body).append(elem.container);

		this.elem = elem;
	};

    /**
     * Initial regular menu frame
     */
	SelectMenu.prototype.setRegularMenu = function(){
	    var p = this.option, self = this, css = this.css_class;
	    var elem = {};
        elem.container = p.embed ? $(self.target).addClass(css.container_embed) : $('<div>');
        elem.container.addClass(css.container)
            .addClass(css.direction_bottom)
            .addClass(css.menu_regular);
        if(p.title){
            elem.header = $('<div>').addClass(css.header);
            elem.header.append('<h3>' + p.title + '</h3>');
            if(!p.embed)
                elem.closeButton = $('<button type="button">×</button>')
                .attr('title',self.message.close_btn)
                .addClass(css.btn_close);
        }

        elem.resultArea = $('<div>').addClass(css.re_area);
        elem.results = $('<ul>').addClass(css.results).addClass(css.menu_root);

        if(p.arrow){
            elem.arrow = $('<div>').addClass(css.menu_arrow);
            if(p.title) elem.arrow.addClass(css.menu_arrow_have_title);
            elem.container.append(elem.arrow);
        }

        if(p.title){
            elem.container.append(elem.header);
            if(!p.embed) elem.header.append(elem.closeButton);
        }
        elem.container.append(elem.resultArea);
        elem.resultArea.append(elem.results);

        if(!p.embed) $(document.body).append(elem.container);
        this.elem = elem;
    };

    /**
     * Regular menu item render
     */
    SelectMenu.prototype.regularMenuInit = function(){
        var d = this.prop.data, p = this.option, self = this, css = this.css_class, el = self.elem;
        var showMenu = function(){
            if(!p.embed){
                this.calcResultsSize(this);
                el.container.addClass(css.container_open);
            }
        };
        if(el.results.find('li').size() && !$.isFunction(p.data)){
            showMenu.call(self);
            return;
        }
        if(d && $.isArray(d) && d.length){
            var buildMenu = function(menudata, ul){
                if(ul.hasClass(css.menu_root)) ul.empty().hide();

                $.each(menudata,function(i,row){
                    if(!row.content ||
                        (!row.header &&
                            !row.url &&
                            !row.callback &&
                            !row.menus &&
                            row.content !== css.menu_divider))
                        return true;
                    var li = $('<li>');
                    if(row.content === css.menu_divider){
                        li.addClass(css.menu_divider);
                    }else{
                        var a = $('<a>').html(row.content).attr('href',
                            (row.url && !row.disabled)?row.url:'javascript:void(0);');
                        if(row.callback && $.isFunction(row.callback) && !row.url){
                            a.on('click.selectMenu',function(e){
                                e.stopPropagation();
                                if(row.disabled) return;
                                row.callback();
                                self.hideResults(self);
                            });
                        }
                        //build sub menus
                        if(row.menus && $.isArray(row.menus) && row.menus.length){
                            var itemCode = self.prop.menu_code_prefix + UUID.generate();
                            a.attr({
                                'href': 'javascript:void(0);',
                                'item_code': itemCode
                            }).append($('<span>').addClass(css.menu_caret)).addClass(css.menu_sub_item);
                            var subMenu = $('<ul>').attr('id', itemCode).addClass(css.results).addClass(css.menu_sub_menu);

                            //build sub menu header bar
                            var backBtn = $('<button type="button">').addClass(css.btn_back).append('<i class="iconfont icon-back"></i>');
                            var header = $('<li>').append(backBtn).append($('<p>').text(row.content)).addClass(css.menu_sub_header);

                            subMenu.append(header).append($('<li>').addClass(css.menu_divider));
                            el.resultArea.append(subMenu);
                            buildMenu(row.menus, subMenu);
                        }
                        li.prepend(a);
                        if(row.disabled) li.addClass(css.menu_disabled);
                        if(row.header) li.addClass(css.menu_header);
                    }
                    ul.append(li);
                });
                if(!ul.hasClass(css.menu_sub_menu)) ul.show();
            };

            el.resultArea.find('ul.'+css.results+':not(.'+css.menu_root+')').remove();
            buildMenu(d, el.results);

            //sub menus event bind
            el.resultArea.find('a.'+css.menu_sub_item).off('click.SelectMenu').on('click.SelectMenu', function(e){
                e.preventDefault();
                e.stopPropagation();
                var $this = $(this),
                    $menu = $this.closest('ul.'+css.results),
                    $subMenu = $('#'+$this.attr('item_code'));
                if($subMenu.size()){
                    $menu.hide();
                    /*
                    $subMenu.css({ marginLeft: 60 }).show().animate({
                        marginLeft: 0
                    },100);
                    */
                    $subMenu.addClass('vivify fadeInRight').show();
                }
            });
            //back button
            el.resultArea.find('button.'+css.btn_back).off('click.SelectMenu').on('click.SelectMenu', function(e){
                var $btn = $(this),
                    $menu = $btn.closest('ul'),
                    $parentMenu = $('a[item_code="'+$menu.attr('id')+'"]').closest('ul');
                $menu.hide();
                $parentMenu.addClass('vivify fadeInLeft').show();
            });

            showMenu.call(self);
        }
    };

    /**
     * Show menu
     * @param self
     */
    SelectMenu.prototype.showMenu = function(self){
        self.populate();
        if($(self.target).is('button'))
            $(self.target).addClass(self.css_class.target_clicked);
    };

    /**
     * Set menu item to selected
     * @param self
     * @param list - datasource
     */
    SelectMenu.prototype.setInitSelected = function(self, list){
        var p = self.option;
        if($.type(p.initSelected) !== 'undefined' &&
            !p.regular && list && $.isArray(list) && list.length){
            var str = String(p.initSelected),arr = str.split(',');
            var matchItem = function(dataList){
                $.each(dataList, function(i,row){
                    var id = String(row[p.keyField]);
                    if(id && $.inArray(id,arr) !== -1) self.prop.values.push(row);
                });
            };
            if(self.prop.data_type === SelectMenu.dataTypeList){
                matchItem(list);
            }else if(self.prop.data_type === SelectMenu.dataTypeGroup){
                $.each(list, function(i,group){
                    group && group.list && group.list.length && matchItem(group.list);
                });
            }
            p.initSelected = undefined;
        }
    };

	/**
	 * Menu frame event handle
	 */
	SelectMenu.prototype.eInput = function() {
		var self = this,p = this.option,el = self.elem;
		if(!p.regular && p.search){
            el.input.keyup(function(e) {
                self.processKey(self, e);
            }).keydown(function(e){
                self.processControl(self, e);
            });
        }
        if(p.title){
		    if(!p.embed){
                el.closeButton.click(function(e){
                    self.hideResults(self);
                });
            }
            if(!p.regular){
                if(p.multiple){
                    el.selectAllButton.click(function(e){
                        e.stopPropagation();
                        self.selectAllLine(self);
                    });
                    el.removeAllButton.click(function(e){
                        e.stopPropagation();
                        self.clearAll(self);
                    });
                }
            }
        }
        if(!p.regular && self.prop.data_type === SelectMenu.dataTypeGroup){
            el.resultTabs.off('click.selectMenu').on('click.selectMenu', 'a', function(e){
                e.stopPropagation();
                if(!$(this).hasClass('active')){
                    var li = $(this).closest('li');
                    li.siblings().children('a').removeClass('active');
                    $(this).addClass('active');
                    self.prop.data_index = parseInt($(this).attr('data_index'));
                    self.populate();
                    if(p.eTabSwitch && $.isFunction(p.eTabSwitch)){
                        var currentGroup = $.extend({}, self.prop.data[self.prop.data_index]);
                        //cut the list item
                        delete currentGroup.list;
                        p.eTabSwitch.call(this, self.prop.data_index, currentGroup);
                    }
                }
            });
        }
        if(p.rightClick){
            $(self.target).on('contextmenu',function(e){
                e.preventDefault();
                e.stopPropagation();
                e.cancelBubble = true;
                e.returnValue = false;
                var scrollX = document.documentElement.scrollLeft || document.body.scrollLeft,
                    scrollY = document.documentElement.scrollTop || document.body.scrollTop;
                self.prop.x = e.pageX || e.clientX + scrollX;
                self.prop.y = e.pageY || e.clientY + scrollY;
                if(!self.isVisible(self)) self.populate();
                else self.calcResultsSize(self);
                return false;
            }).mouseup(function(e){
                if(e.button != 2) self.hideResults(self);
            });
            self.hideResults(self);
        }
	};

	/**
	 * Out of menu event bind
	 */
	SelectMenu.prototype.eWhole = function() {
		var self = this, css = this.css_class;
		$(document).off('mouseup.selectMenu').on('mouseup.selectMenu',function(e) {
		    var srcEl = e.target || e.srcElement,
                sm = $(srcEl).closest('div.' + css.container);
            //out of menu area click, when menu is opened , hide it
            $('div.' + css.container + '.' + css.container_open).each(function(){
                var d = $(this).data(SelectMenu.dataKey);
                if(this == sm[0] || d.target == srcEl || $(srcEl).closest(d.target).size()) return;
                d.hideResults(d);
            });
		});
	};

	/**
	 * Menu item event bind
	 */
	SelectMenu.prototype.eResultList = function() {
        var self = this,p = this.option,el = self.elem;
		self.elem.results.children('li').mouseenter(function() {
			if (self.prop.key_select) {
				self.prop.key_select = false;
				return;
			}
			if(!$(this).hasClass('sm_message_box')) $(this).addClass(self.css_class.select);
		}).mouseleave(function(){
		    $(this).removeClass(self.css_class.select);
        }).click(function(e) {
			if (self.prop.key_select) {
				self.prop.key_select = false;
				return;
			}
			e.preventDefault();
			e.stopPropagation();

            self.selectCurrentLine(self, false);
		});
	};

    /**
     * Reposition result list when list beyond the visible area
     */
    SelectMenu.prototype.eScroll = function(){
        var self = this, css = this.css_class;
        $(window).on('scroll.SelectMenu',function(e){
            $('div.' + css.container + '.' + css.container_open).each(function(){
                var d = $(this).data(SelectMenu.dataKey),
                    offset = d.elem.container.offset(),
                    screenScrollTop = $(window).scrollTop(),
                    docHeight = $(document).height(),//the document full height
                    viewHeight = $(window).height(),//browser visible area height
                    menuHeight = d.elem.container.outerHeight(),
                    menuBottom = offset.top + menuHeight,
                    hasOverflow = docHeight > viewHeight,
                    down = d.elem.container.hasClass(css.direction_bottom);
                if(hasOverflow){
                    if(down){//show down
                        if(menuBottom > (viewHeight + screenScrollTop)) d.calcResultsSize(d);
                    }else{//show up
                        if(offset.top < screenScrollTop) d.calcResultsSize(d);
                    }
                }
            });
        });
    };

    /**
     * Closing work
     * @param {Object} self
     */
    SelectMenu.prototype.atLast = function(self){
        if(!self) self = this;
        var p = self.option;
        if(p.search && !p.regular && !p.embed && !p.rightClick) self.elem.input.focus();
        self.elem.container.data(SelectMenu.dataKey,self);
        if($(self.target).is('button,.btn') && !p.embed && !p.rightClick)
            $(self.target).addClass(self.css_class.target_clicked);
    }

	/**
	 * Ajax request fail
	 * @param {Object} self
	 * @param {string} errorThrown
	 */
	SelectMenu.prototype.ajaxErrorNotify = function(self, errorThrown) {
		self.showMessage(self.message.ajax_error);
	};
	
	/**
	 * Show some message
	 * @param {Object} self
	 * @param msg {string}
	 */
	SelectMenu.prototype.showMessage = function(self,msg){
		if(!msg) return;
		var msgLi = '<li class="sm_message_box"><i class="iconfont icon-warn"></i> '+msg+'</li>';
		self.elem.results.empty().append(msgLi);
		self.calcResultsSize(self);
		self.elem.container.addClass(self.css_class.container_open);
		self.elem.control.hide();
	};

	/**
     * Check input to search
	 * @param {Object} self
	 */
	SelectMenu.prototype.checkValue = function(self) {
		var now_value = self.elem.input.val();
		if (now_value != self.prop.prev_value) {
			self.prop.prev_value = now_value;
			self.suggest(self);
		}
	};

    /**
     * Input element event handle( regular letter )
     * @param {Object} self
     * @param {Object} e - event
     */
    SelectMenu.prototype.processKey = function(self, e){
        if($.inArray(e.keyCode, [38, 40, 27, 9, 13]) === -1){
            //if(e.keyCode != 16) self.setCssFocusedInput(self); // except Shift(16)
            if($.type(self.option.data) === 'string'){
                self.prop.last_input_time = e.timeStamp;
                setTimeout(function(){
                    if((e.timeStamp - self.prop.last_input_time) === 0)
                        self.checkValue(self);
                },self.option.inputDelay * 1000);
            }else{
                self.checkValue(self);
            }
        }
    }

	/**
     * Input element event handle( control key )
	 * @param {Object} self
	 * @param {Object} e - event
	 */
	SelectMenu.prototype.processControl = function(self, e) {
		if (($.inArray(e.keyCode, [38, 40, 27, 9]) > -1 && self.elem.container.is(':visible')) ||
			($.inArray(e.keyCode, [13, 9]) > -1 && self.getCurrentLine(self))) {
			e.preventDefault();
			e.stopPropagation();
			e.cancelBubble = true;
			e.returnValue = false;
			switch (e.keyCode) {
			case 38:// up
				self.prop.key_select = true;
				self.prevLine(self);
				break;
			case 40:// down
				if (self.elem.results.children('li').length) {
					self.prop.key_select = true;
					self.nextLine(self);
				} else self.suggest(self);
				break;
			case 9: // tab
				self.selectCurrentLine(self, true);
				//self.hideResults(self);
				break;
			case 13:// return
				self.selectCurrentLine(self, true);
				break;
			case 27:// escape
				self.hideResults(self);
				break;
			}
		}
	};


    /**
     * Populate menu data
     */
    SelectMenu.prototype.populate = function() {
        var self = this, p = this.option;
        if(!p.regular) self.elem.input.val('');
        /**
         * 1.Process data source
         */
        if(p.data){
            if($.type(p.data) === 'array'){
                self.prop.data = p.data;
            }else if($.type(p.data) === 'function'){
                self.prop.data = p.data();
            }
        }
        //Check data type
        if($.type(self.prop.data) === 'array')
            this.prop.data_type = this.checkDataType(self.prop.data);
        /**
         * 2.Set menu init selected
         */
        if($.type(p.data) !== 'string') self.setInitSelected(self, self.prop.data);
        /**
         * 3.Show data
         */
        if(p.regular) self.regularMenuInit();
        else self.suggest(self);

        //scrolling listen
        if(!p.embed) self.eScroll();
    };

	/**
	 * Search suggest
	 * @param {Object} self
	 */
	SelectMenu.prototype.suggest = function(self) {
		var q_word, p = self.option,
            val = $.trim(self.elem.input.val());
        if(p.multiple) q_word = val;
        else{
            if(val && val === self.prop.selected_text) q_word = '';
            else q_word = val;
        }
		q_word = q_word.split(/[\s　]+/);
		self.setLoading(self);
		if ($.type(p.data) === 'array' || $.type(p.data) === 'function') self.search(self, q_word);
	};

	/**
	 * Loading
	 * @param {Object} self
	 */
	SelectMenu.prototype.setLoading = function(self) {
		if (self.elem.results.html() === '') {
			//self.calcResultsSize(self);
			if(!self.option.embed) self.elem.container.addClass(self.css_class.container_open);
		}
	};

	/**
	 * Search / load menu data
	 * @param {Object} self
	 * @param {Array} q_word - query keywords
	 */
	SelectMenu.prototype.search = function(self, q_word) {
	    var p = self.option, innerData = self.prop.data,
            matched = [], esc_q = [], sorted = [], json = {}, i = 0, arr_reg = [];
		do {
			//'/\W/g'正则代表全部不是字母，数字，下划线，汉字的字符
			//将非法字符进行转义
			esc_q[i] = q_word[i].replace(/\W/g, '\\$&').toString();
			arr_reg[i] = new RegExp(esc_q[i], 'gi');
			i++;
		} while ( i < q_word.length );
        var d = [];
        if(self.prop.data_index > (innerData.length-1) || self.prop.data_index < 0) self.prop.data_index = 0;
        if(self.prop.data_type === SelectMenu.dataTypeGroup){
            d = innerData[self.prop.data_index].list;
        }else d = innerData;
		// SELECT * FROM data WHERE field LIKE q_word;
		for (i = 0; i < d.length; i++) {
			var flag = false;
			var row = d[i];
			for (var j = 0; j < arr_reg.length; j++) {					
				var itemText = row[p.searchField];
				if(p.formatItem && $.isFunction(p.formatItem))
					itemText = p.formatItem(row);
				if (itemText.match(arr_reg[j])) {
					flag = true;
					if (p.andOr == 'OR') break;
				} else {
					flag = false;
					if (p.andOr == 'AND') break;
				}
			}
			if (flag) matched.push(row);
		}
		
		// (CASE WHEN ...) then く order some field
		var reg1 = new RegExp('^' + esc_q[0] + '$', 'gi'),
            reg2 = new RegExp('^' + esc_q[0], 'gi'),
            matched1 = [], matched2 = [], matched3 = [];
		for (i = 0; i < matched.length; i++) {
		    var orderField = p.orderBy[0][0],
                orderValue = String(matched[i][orderField]);
			if (orderValue.match(reg1)) {
				matched1.push(matched[i]);
			} else if (orderValue.match(reg2)) {
				matched2.push(matched[i]);
			} else {
				matched3.push(matched[i]);
			}
		}

		if (p.orderBy[0][1].match(/^asc$/i)) {
			matched1 = self.sortAsc(self, matched1);
			matched2 = self.sortAsc(self, matched2);
			matched3 = self.sortAsc(self, matched3);
		} else {
			matched1 = self.sortDesc(self, matched1);
			matched2 = self.sortDesc(self, matched2);
			matched3 = self.sortDesc(self, matched3);
		}
		sorted = sorted.concat(matched1).concat(matched2).concat(matched3);

        /*
        if (sorted.length === undefined || sorted.length === 0 ) {
            self.notFoundSearch(self);
            return;
        }
        */
        //json.cnt_whole = sorted.length;

		//Cache original row data
		json.originalResult = [];
        if(json.keyField === undefined) json.keyField = [];
        if(json.candidate === undefined) json.candidate = [];

		$.each(sorted, function(i,row){
		    if(row === undefined || $.type(row) !== 'object') return true;
            json.originalResult.push(row);
            if(row.hasOwnProperty(p.keyField) && row.hasOwnProperty(p.showField)){
                json.keyField.push(row[p.keyField]);
                json.candidate.push(row[p.showField]);
            }
        });

		//json.cnt_page = json.candidate.length;
		self.prepareResults(self, json, q_word);
	};

	/**
	 * Sort ascending
	 * @param {Object} self
	 * @param {Array} arr
	 */
	SelectMenu.prototype.sortAsc = function(self, arr) {
		arr.sort(function(a, b) {
		    var valA = a[self.option.orderBy[0][0]],
                valB = b[self.option.orderBy[0][0]];
            return $.type(valA) === 'number' ? valA - valB : String(valA).localeCompare(String(valB));
		});
		return arr;
	};

	/**
	 * Sort descending
	 * @param {Object} self
	 * @param {Array} arr
	 */
	SelectMenu.prototype.sortDesc = function(self, arr) {
		arr.sort(function(a, b) {
            var valA = a[self.option.orderBy[0][0]],
                valB = b[self.option.orderBy[0][0]];
            return $.type(valA) === 'number' ? valB - valA : String(valB).localeCompare(String(valA));
		});
		return arr;
	};

	/**
	 * No result handle
	 * @param {Object} self
	 */
	SelectMenu.prototype.notFoundSearch = function(self) {
		self.elem.results.empty();
		self.calcResultsSize(self);
		self.elem.container.addClass(self.css_class.container_open);
		self.setCssFocusedInput(self);
	};

	/**
	 * Prepare data to render menu item
	 * @param {Object} self
	 * @param {Object} json
	 * @param {Array} q_word - query keywords
	 */
	SelectMenu.prototype.prepareResults = function(self, json, q_word) {
		if (!json.keyField) json.keyField = false;

		if (self.option.selectOnly &&
            json.candidate.length === 1 &&
            json.candidate[0] == q_word[0]) {
			self.elem.hidden.val(json.keyField[0]);
			this.setButtonAttrDefault();
		}
		var is_query = false;
		if (q_word && q_word.length && q_word[0]) is_query = true;
		//self.setInitSelected(self,json.originalResult);
		self.displayResults(self, json, is_query);
	};

	/**
	 * Render menu item
	 * @param {Object} self
	 * @param {Object} json
	 * @param {boolean} is_query
	 */
	SelectMenu.prototype.displayResults = function(self, json, is_query) {
	    var p = self.option, el = self.elem, css = self.css_class;
		el.results.hide().empty();

		// build tabs
        if(self.prop.data_type === SelectMenu.dataTypeGroup) {
            var ul = $('<ul>');
            $.each(self.prop.data,function(i,row){
                var a = $('<a href="javascript:void(0);">').html(row.title).attr({
                    'tab_id' : self.prop.menu_tab_id_prefix + (i+1),
                    'data_index' : i
                });
                if(i === self.prop.data_index) a.addClass('active');
                var li = $('<li>').append(a);
                ul.append(li);
            });
            el.resultTabs.empty().append(ul);
        }else{
            el.resultTabs.hide();
            if(p.title || p.search) el.resultArea.addClass(this.css_class.re_list);
        }

		if(p.multiple && $.type(p.maxSelectLimit) === 'number' && p.maxSelectLimit){
            var selectedSize = self.prop.results.length;
            if(selectedSize && selectedSize >= p.maxSelectLimit){
                var msg = self.message.max_selected;
                self.showMessage(self, msg.replace(self.template.msg.maxSelectLimit, p.maxSelectLimit));
                return;
            }
		}

		if(json.candidate.length){
            var arr_candidate = json.candidate, arr_primary_key = json.keyField;
            for (var i = 0; i < arr_candidate.length; i++) {
                var itemText = '', custom = false, row = json.originalResult[i];
                if(p.formatItem && $.isFunction(p.formatItem)){
                    try {
                        itemText = p.formatItem(row);
                        custom = true;
                    } catch (e) {
                        console.error('formatItem 内容格式化函数内容设置不正确！');
                        itemText = arr_candidate[i];
                    }
                }else itemText = arr_candidate[i];
                var icon = $('<div>').html('<i class="iconfont icon-selected">').addClass(css.selected_icon),
                    text = $('<div>').html(itemText).addClass(css.item_text),
                    li = $('<li>').append(icon).append(text).attr('pkey' , arr_primary_key[i]);
                if(!custom) li.attr('title',itemText);

                //set selected item to highlight
                if ($.inArray(row,self.prop.values) !== -1) {
                    li.addClass(css.selected);
                }
                //cache item data
                li.data('dataObj',row);
                el.results.append(li);
            }
        }else{
		    var li = '<li class="sm_message_box"><i class="iconfont icon-warn"></i> ' + self.message.not_found + '</li>';
            el.results.append(li);
        }
        el.results.show();

		self.calcResultsSize(self);
		if(!p.embed) el.container.addClass(css.container_open);

		//menu item event bind
		self.eResultList();
        //auto highlight first item in search, in have result and set autoSelectFirst to true situation
		//if (is_query && json.candidate.length > 0 && p.autoSelectFirst) self.nextLine(self);
		self.atLast(self);
	};

	/**
	 * Calculate menu position and size
	 * @param {Object} self
	 */
	SelectMenu.prototype.calcResultsSize = function(self) {
	    var p = self.option, el = self.elem, css = self.css_class,
            hasScroll = function(){
	            return $(document).height() > $(window).height();
            };
	    var setListHeight = function(){
            if(!p.regular){
                //result list height
                var itemHeight = el.results.find('li:first').outerHeight(),
                    listHeight = itemHeight * p.listSize;
                el.results.css({
                    'max-height':listHeight
                });
            }
        };
	    var scrollFlag = hasScroll();
	    var rePosition = function(){
            var menuHeight = el.container.outerHeight(),
                screenScrollTop = $(window).scrollTop(),
                viewHeight = $(window).height();
	        if(p.rightClick){
	            var top = self.prop.y;
	            if((self.prop.y + menuHeight) > (screenScrollTop + viewHeight))
	                top = self.prop.y - menuHeight;
                return {top : top, left : self.prop.x};
            }
            var boxoffset = $(self.target).offset(),
                t = boxoffset.top,
                menuWidth = el.container.outerWidth(),
                targetWidth = Math.round($(self.target)[0].getBoundingClientRect().width),
                dist = 5;
            t += $(self.target).outerHeight() + dist;
            if(p.arrow && !p.embed) t += el.arrow.outerHeight(true);

            if((t + menuHeight) > (screenScrollTop + viewHeight)){
                t = boxoffset.top - dist - menuHeight;
                if(p.arrow && !p.embed) t -= el.arrow.outerHeight(true);
                el.container.removeClass(css.direction_bottom).addClass(css.direction_top);
            }else{
                if(el.container.hasClass(css.direction_top))
                    el.container.removeClass(css.direction_top).addClass(css.direction_bottom);
            }

            var l = boxoffset.left;
            switch (p.position){
                case 'right':
                    l = l + targetWidth - menuWidth;
                    if(p.arrow) el.arrow.css('left',menuWidth - (targetWidth / 2));
                    break;
                case 'center':
                    l = l + (targetWidth / 2) - (menuWidth / 2);
                    break;
                case 'left':
                default:
                    if(p.arrow) el.arrow.css('left',targetWidth / 2);
                    break;
            }
            return {top : t,left : l};
        }
	    if(el.container.is(':visible')){
            setListHeight();
            if(!p.embed) el.container.offset(rePosition());
        }else{
            el.container.show(1,function(){
                setListHeight();
                $(this).offset(rePosition());
            });
        }
        if(scrollFlag !== hasScroll()) el.container.offset(rePosition());
	};

    /**
     *
     */
    SelectMenu.prototype.subMenuPosition = function(parent, menu){
        var pOffset = $(parent).offset();
        var t = pOffset.top,l = pOffset.left + $(parent).outerWidth() + 5;
    };

	/**
	 * Hide menu
	 * @param {Object} self
	 */
	SelectMenu.prototype.hideResults = function(self) {
	    var p = self.option;
		if (p.autoFillResult) {
			//self.selectCurrentLine(self, true);
		}

		if(!p.regular) self.elem.results.empty();
		if(!p.embed){
            self.elem.container.removeClass(self.css_class.container_open).hide();
            if($(self.target).is('button,.btn')) $(self.target).removeClass(self.css_class.target_clicked);
        }
        self.elem.resultArea.find('ul.'+self.css_class.results).not('.'+self.css_class.menu_root).hide();
        //remove animate class
		self.elem.results.removeClass('vivify').removeClass('fadeInLeft').show();
        $(window).off('scroll.SelectMenu');
        if(!p.regular && p.eHidden && $.isFunction(p.eHidden)) p.eHidden.call(self, self.prop.values.concat());
	};
	/**
	 * do something after select/unSelect action
     * @param {Object} self
	 */
	SelectMenu.prototype.afterAction = function(self){
	    //$(self.elem.input).change();
		if(self.option.multiple){
			if(self.option.selectToCloseList){
				self.hideResults(self);
				self.elem.input.blur();
			}else{
				//self.suggest(self);
				self.elem.input.focus();
			}
		}else{
			self.hideResults(self);
			self.elem.input.blur();
		}
	};

    /**
     * Get current menu item
     * @param {Object} self
     */
    SelectMenu.prototype.getCurrentLine = function(self) {
        if (self.elem.container.is(':hidden')) return false;
        var obj = self.elem.results.find('li.' + self.css_class.select);
        if (obj.size()) return obj;
        else return false;
    };

    /**
     * Get selected menu item
     * @param self
     * @returns {*}
     */
    SelectMenu.prototype.getSelectedLine = function(self) {
        if (self.elem.container.is(':hidden')) return false;
        var obj = self.elem.results.find('li.' + self.css_class.selected);
        if (obj.size()) return obj;
        else return false;
    };

	/**
	 * Selected menu item and trigger select callback
	 * @param {Object} self
	 * @param {boolean} is_enter_key
	 */
	SelectMenu.prototype.selectCurrentLine = function(self, is_enter_key) {
		var current = self.getCurrentLine(self), p = self.option;
		if (current) {
		    var rowData = current.data('dataObj'),
                id = String(rowData[p.keyField]);
			if($.inArray(rowData,self.prop.values) === -1){
			    if(!p.multiple) self.prop.values.splice(0,self.prop.values.length);
			    self.prop.values.push(rowData);
			    if(!p.multiple)
                    self.elem.results.find('li.' + self.css_class.selected).removeClass(self.css_class.selected);
                current.addClass(self.css_class.selected);
            } else{
			    self.prop.values.splice($.inArray(rowData,self.prop.values),1);
                current.removeClass(self.css_class.selected);
            }

            //trigger callback
            if(p.eSelect && $.isFunction(p.eSelect)){
                if(p.multiple){
                    p.eSelect.call(self, self.prop.values.concat());
                }else p.eSelect.call(self, [rowData]);
            }

			self.prop.prev_value = self.elem.input.val();
			self.prop.selected_text = self.elem.input.val();
		}
		if(!p.embed) self.afterAction(self);
	};

	/**
	 * Select all menu item
	 * @param {Object} self
	 */
	SelectMenu.prototype.selectAllLine = function(self){
        self.elem.results.find('li').each(function(i,row){
			var d = $(row).data('dataObj');
			if($.inArray(d,self.prop.values) === -1) self.prop.values.push(d);
            $(this).addClass(self.css_class.selected);
            //limited max select items
            /*
			if($.type(self.option.maxSelectLimit) === 'number' &&
                self.option.maxSelectLimit > 0 &&
                self.option.maxSelectLimit === $('li.selected_tag',self.elem.element_box).size()){
			    return false;
            }
            */
		});
		if(self.option.eSelect && $.isFunction(self.option.eSelect))
			self.option.eSelect.call(self, self.prop.values.concat());
		self.afterAction(self);
	};
	/**
	 * Clear all selected menu items
	 * @param {Object} self
	 */
	SelectMenu.prototype.clearAll = function(self){
        var p = self.option, el = self.elem;
        el.input.val('');
        el.results.find('li').each(function(i,row){
            $(this).removeClass(self.css_class.selected);
        });
        self.prop.values.splice(0,self.prop.values.length);
		self.afterAction(self);
        if (p.eSelect && $.isFunction(p.eSelect)) p.eSelect.call(self, []);
	};

	/**
	 * Select next menu item
	 * @param {Object} self
	 */
	SelectMenu.prototype.nextLine = function(self) {
		var obj = self.getCurrentLine(self), el = self.elem, idx;
		if (!obj) idx = -1;
		else {
			idx = el.results.children('li').index(obj);
			obj.removeClass(self.css_class.select);
		}
		idx++;
		var size = el.results.find('li').size();
		if(idx === size) idx = size - 1;
		if (idx < size) {
			var next = el.results.children('li').eq(idx);
			next.addClass(self.css_class.select);

            var itemHeight = el.results.find('li:first').outerHeight(),
                curTop = next.position().top,
                curScrollTop = el.resultArea.scrollTop(),
                listHeight = el.resultArea.outerHeight(),
                dist = curTop + itemHeight - listHeight;
			if((curTop + itemHeight) > listHeight)
			    el.resultArea.scrollTop(curScrollTop + dist);
		}
	};

	/**
	 * Select previous menu item
	 * @param {Object} self
	 */
	SelectMenu.prototype.prevLine = function(self) {
	    var el = self.elem, idx, obj = self.getCurrentLine(self);
		if (!obj) idx = el.results.children('li').length;
		else {
			idx = el.results.children('li').index(obj);
			obj.removeClass(self.css_class.select);
		}
		idx--;
		if(idx < 0) idx = 0;
		if (idx > -1) {
			var prev = el.results.children('li').eq(idx),
                itemHeight = el.results.find('li:first').outerHeight(),
                curTop = prev.position().top,
                curScrollTop = el.resultArea.scrollTop(),
                listHeight = el.resultArea.outerHeight();
            prev.addClass(self.css_class.select);
            if((curTop > (curScrollTop + listHeight)) || (curTop < curScrollTop))
                el.resultArea.scrollTop(curScrollTop - (0 - curTop));
		}
	};

    /**
     * Check menu visible
     * @param self
     */
	SelectMenu.prototype.isVisible = function(self){
        return self.elem.container.hasClass(self.css_class.container_open);
    }


	/**
	 * Init plugin entrance
	 * @global
	 * @memberof jQuery
	 * @param option {Object} init parameters
	 */
	function Plugin(option) {
		return this.each(function(){
			var $this = $(this),
				data = $this.data(SelectMenu.dataKey),
				params = $.extend({}, defaults, $this.data(), data && data.option ,typeof option === 'object' && option);
			if(!data) $this.data(SelectMenu.dataKey,(data =  new SelectMenu(this,params)));
			else{
			    if(data.isVisible(data)) data.hideResults(data);
			    else data.showMenu(data);
            }
		});
	}

    /**
     * Hide menu
     */
	function HideMenu(){
	    return this.each(function(){
            var $this = $(this),
                data = $this.data(SelectMenu.dataKey);
            if(data) data.hideResults(data);
        });
    }

    /**
     * Clear all menu selected item
     */
    function ClearSelected(){
        return this.each(function(){
            var $this = $(this),
                data = $this.data(SelectMenu.dataKey);
            if(data) data.clearAll(data);
        });
    }

    /**
     * Get selected item data
     */
    function GetSelected(){
        var results = new Array();
        this.each(function(){
            var $this =$(this),
                data = $this.data(SelectMenu.dataKey);
            if(data) results = data.prop.values.concat();
        });
        return results;
    }

	var old = $.fn.selectMenu;

	$.fn.selectMenu              = Plugin;
	$.fn.selectMenu.Constructor = SelectMenu;
	$.fn.selectMenuHide          = HideMenu;
	$.fn.selectMenuClear         = ClearSelected;
	$.fn.selectMenuValues        = GetSelected;

	// SelectMenu no conflict
	// =================
	$.fn.selectMenu.noConflict = function () {
		$.fn.selectMenu = old;
		return this;
	};
})(window.jQuery);