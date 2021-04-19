<%@ page contentType="text/html; charset=utf-8" pageEncoding="gbk"%>
<!DOCTYPE html>
<html>
<head>
	<title>DES加密解密</title>
	<style>
	td.label {
		text-align: right;
	}
	
	td {
		border: 1px solid #ccc;
		text-align: center;
	}
	td textarea{
	width: 95%;
	}
	
	th {
		text-align: center;
	}
	</style>
    <script type="text/javascript" src="${serviceAddr}myui/jquery/jquery-1.9.1.min.js?time=20200214"></script>
</head>
<body>
	<table style="width: 100%;">
		<tr>
			<th style="width: 50%;">待处理信息</th>
			<th style="width: 50%;">处理结果</th>
		</tr>
		<tr>
			<td><textarea id="dclxx" maxlength="2000000"
					style="height: 300px;" title="一行一个,一次最多输入十万个"></textarea>
			</td>
			<td><textarea id="cljg" style="height: 300px;"></textarea></td>
		</tr>
		<tr>
			<td>
			           密码：<input id="mm" style="width:200px;">
                <button onclick="descl('jiami')" style="width: 60px; cursor: pointer;">
                                                加&nbsp;&nbsp;密</button>
                <button onclick="descl('jiemi')" style="width: 60px; cursor: pointer;">
                                                解&nbsp;&nbsp;密</button>
            </td>
            <td>
            </td>
		</tr>
	</table>
	<script>
        function descl(clfs) {
            var dclxx = document.getElementById("dclxx").value.replace(/\r/g, '').replace(/\n/g, ',');
            var mm = document.getElementById("mm").value;
            $.ajax({
                type: "POST",
                url: "${serviceAddr}/common/desZh.do",
                async : true,
                data: {"e_mm":mm,"e_dclxx":dclxx,"e_clfs":clfs},
                dataType: "text",
                success: function (result) {
                    document.getElementById("cljg").value = result.replace(/,/g, '\n');
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("请求异常:"+errorThrown);
                }
            });
        }
    </script>
</body>
</html>