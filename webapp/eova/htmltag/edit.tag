<%
var disable_edit = "false";
if(!isEmpty(disable!)&&disable){
    disable_edit = "true";
}
%>
<script type="text/javascript">
    $(function(){
        var ${id!} = UE.getEditor('${id!}');
        if(${disable_edit}){
            setTimeout(function(){
                UE.getEditor('${id!}').setDisabled('fullscreen');
            },500);
        }
    });
</script>
<div>
    <script type="text/plain" id="${id!}" name="${name!}" style="${style!}">${value!}</script>
</div>