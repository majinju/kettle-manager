<%
var json = "{}";
if(!isEmpty(value!)){
    json = value;
}
var mode = "tree";
if(!isEmpty(disable!)&&disable){
    mode = "view";
}
%>
<style type="text/css">
  #${id!} {
    font: 10.5pt arial;
    color: #4d4d4d;
  }
  #${id!} td{
    border: none;
  }

  code {
    background-color: #f5f5f5;
  }
</style>
<script type="text/javascript">
var options_${id!} = {
    mode: "${mode}",
    modes: ['code', 'form', 'text', 'tree', 'view'], // allowed modes
    onError: function (err) {
      alert(err.toString());
    },
    onModeChange: function (newMode, oldMode) {
      console.log('Mode switched from', oldMode, 'to', newMode);
    },
    onChange: function(){
        $("#jsoneditor_textarea_${name!}").val(JSON.stringify(${id!}.get()));
    }
  }
var ${id!};
$(function(){
    var json_${id!} = ${json!};
    var container = document.getElementById('${id!}');
    ${id!} = new JSONEditor(container, options_${id!}, json_${id!} );
});
</script>
<div id="${id!}" style="${style!}"></div>
<textarea name="${name!}" id="jsoneditor_textarea_${name!}" style="display: none;">${value!}</textarea>
