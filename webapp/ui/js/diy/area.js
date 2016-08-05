$(document).ready(function(){
	var $province = $('#province');
    var $city= $('#city');
    var $region= $('#region');

    // 初始禁用
    $city.mask();
    $region.mask();

 	// 省级联市
    $province.eovacombo({onChange: function (oldValue, newValue) {
        $city.eovacombo().setValue("");
        $region.eovacombo().setValue("");

        if (newValue == "") {
            $city.mask();
            return;
        }
        
        $city.unmask();
        var url = '/widget/comboJson?exp=select id ID,name CN from area where lv = 2 and pid = ' + newValue;
        $city.eovacombo({url : url}).reload();
    }});
    // 市级联区县
    $city.eovacombo({onChange: function (oldValue, newValue) {
        $region.eovacombo().setValue("");

        if (newValue == "") {
            $region.mask();
            return;
        }
        
        $region.unmask();
        var url = '/widget/comboJson?exp=select id ID,name CN from area where lv = 3 and pid = ' + newValue;
        $region.eovacombo({url : url}).reload();

    }});
});