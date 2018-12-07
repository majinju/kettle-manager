/* 查询样例1 */ 
function showCollapse(a) {
    if ($('#collapse').hasClass('display-none')) {
        $('#collapse').removeClass('display-none');
        $(a).html('收起 <i class="icon ion-ios-arrow-up"></i>');
    } else {
        $('#collapse').addClass('display-none');
        $(a).html('更多 <i class="icon ion-ios-arrow-down"></i>');
    }
}

/* 查询样例1 */
function showCollapse1(a) {
    if ($('#collapse').hasClass('display-none')) {
        $('#collapse').removeClass('display-none');
        $(a).html('收起 <i class="icon ion-ios-arrow-up"></i>');
    } else {
        $('#collapse').addClass('display-none');
        $(a).html('展开 <i class="icon ion-ios-arrow-down"></i>');
    }
}

/* 详情样例1 */
$(function () { $('#collapse1').collapse('show')});
$(function () { $('#collapse2').collapse('show')});
$(function () { $('#collapse3').collapse('show')});
