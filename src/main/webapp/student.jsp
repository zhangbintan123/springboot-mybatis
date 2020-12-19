<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>学生管理系统</title>
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
<script>
	/***********初始化下拉列表框*************/
	$(function(){
		$("#btsave").show();
		$("#btupdate").hide();
		
		$.getJSON('findAllClazz_Student.do',function(lsca){
          alert("aaaaaaaaaaa");
			for(var i=0;i<lsca.length;i++){
				var clazz=lsca[i];
				$("#classid").append("<option value="+clazz.cid+">"+clazz.cname+"</option>");	
			}
		});
	
		showAll();
	});
	
	/*****************************************/
	/***********获取学生列表的方法************************/
	function showAll(){
		$.getJSON('findAll_Student.do?time='+new Date().getTime(),function(lsst){
			//var lsst=mappage.lsst;//获取map中的学生集合
			
			var tableHead="<table width='800' border='1' align='center' cellpadding='1' cellspacing='0'>"
						+"<tr align='center' bgcolor='#FFFFCC'>"
						+"<td width='59'>编号</td>"
						+"<td width='121'>姓名</td>"
						+"<td width='77'>性别</td>"
						+"<td width='146'>地址</td>"
						+"<td width='108'>生日</td>"
						+"<td width='122'>班级</td>"
						+"<td width='137'>操作</td>"
						+"</tr>";
			var trrows="";
			for(var i=0;i<lsst.length;i++){
				var st=lsst[i];
				trrows+="<tr align='center'>"
					+"<td>"+st.sid+"</td>"
					+"<td>"+st.sname+"</td>"
					+"<td>"+st.sex+"</td>"
					+"<td>"+st.address+"</td>"
					+"<td>"+st.sdate+"</td>"
					+"<td>"+st.cname+"</td>"
					+"<td><input type='button' name='btdel' id='btdel' value='删除' onclick='dodel("+st.sid+")' />"
					+"<input type='button' name='btfind' id='btfind' value='编辑' onclick='findById("+st.sid+")'/></td>"
					+"</tr>";
			}			
						
			var endtable=tableHead+trrows+"</table>";
			$("#ttable").html(endtable);

		});
	}
	/*****************************************************/

	
	
	
	/**********************保存方法*******************************/
	$(function(){
		$("#btsave").click(function(){
			//获取表单元素的值
			var sname=$("#sname").val();
			var sex=$(":radio[name='sex']:checked").val();//获取选中的单选按钮值
			var address=$("#address").val();
			var sdate=$("#sdate").val();
			var classid=$("#classid").val();
			//组装为json对象准备传递给服务器save_Student路径对应得方法
			var st={'sname':sname,'sex':sex,'address':address,'sdate':sdate,'classid':classid};
			//发送json对象到服务器
			$.post('save_Student.do',st,function(code){
				if(code=='1'){
					alert('保存成功！');
					showAll();//刷新表格
				}else{
					alert('保存失败！');
				}
			});
		});
	});
	/*************************************************************/	
	/**********************更新方法*******************************/
	$(function(){
		$("#btupdate").click(function(){
			//获取表单元素的值
			var sid=$("#sid").val();
			var sname=$("#sname").val();
			var sex=$(":radio[name='sex']:checked").val();//获取选中的单选按钮值
			var address=$("#address").val();
			var sdate=$("#sdate").val();
			var classid=$("#classid").val();
			//组装为json对象准备传递给服务器save_Student路径对应得方法
			var st={'sid':sid,'sname':sname,'sex':sex,'address':address,'sdate':sdate,'classid':classid};
			//发送json对象到服务器
			$.post('update_Student.do',st,function(code){
				if(code=='1'){
					alert('更新成功！');
					showAll();//刷新表格
				}else{
					alert('更新失败！');
				}
			});
			
			$("#btsave").show();
			$("#btupdate").hide();
		});
	});
	/*************************************************************/	
	
	/********************删除事件************************************/
	function dodel(sid){
		var flag=window.confirm('是否真的删除！');
		if(flag){
			$.get('delById_Student.do?sid='+sid,function(code){
				if(code=='1'){
					alert('删除成功！');
					showAll();//刷新表格
				}else{
					alert('删除失败！');
				}
			});
		}
	}
	/*************************************************************/	
	
	/***********************查找的方法*****************************/
	function findById(sid){
		$.getJSON('findById_Student.do?sid='+sid+'&t='+new Date().getTime(),function(oldst){
			//给表单元素赋值
			$("#sid").val(oldst.sid);
			$("#sname").val(oldst.sname);
			$(":radio[value='"+oldst.sex+"']").attr("checked",true);
			$("#address").val(oldst.address);
			$("#sdate").val(oldst.sdate);
			$("#classid").val(oldst.classid);
		});
		
		$("#btsave").hide();
		$("#btupdate").show();
	}
	/************************************************************/
</script>
</head>

<body>
<p align="center">学生信息列表</p>
<hr />
<div id="ttable">
	
</div>
 <table width="800" border="1" align="center" cellpadding="1" cellspacing="0">
    <tr align="center" bgcolor="#FFFFCC">
      <td>
     
      <input type="button" name="btfirst" id="btfirst" value="首页" /></td>
      <td>
     
     
      <input type="button" name="btup" id="btup" value="上页" /></td>
      <td>
     
     
      <input type="button" name="btnext" id="btnext" value="下页" /></td>
      <td>
    
      <input type="button" name="btlast" id="btlast" value="末页" /></td>
      <td>每页
        <label for="rows"></label>
      <input name="rows"  type="text" id="rows" size="1" />
      条记录 
      <input type="button" name="btchangerows" id="btchangerows" value="确定" /></td>
      <td>跳转到第
        <label for="page"></label>
        <input name="page"  type="text" id="page" size="1" />
        页
<input type="button" name="btchangepage" id="btchangepage" value="确定" /></td>
      <td><span id="pageLabel">1/1页</span></td>
    </tr>
  </table>
<hr />
<form id="form1" name="form1" method="post" action="">
  <table width="450" border="1" align="center">
    <tr>
      <td colspan="2" align="center" bgcolor="#FFFFCC">学生管理</td>
    </tr>
    <tr>
      <td width="66">姓名：</td>
      <td width="368"><label for="sname"></label>
      <input type="text" name="sname" id="sname" />
      <input type="hidden" name="sid" id="sid" />
      
      </td>
    </tr>
    <tr>
      <td>性别：</td>
      <td><input name="sex" type="radio" id="radio" value="男" checked="checked" />
      <label for="sex">男
        <input type="radio" name="sex" id="radio2" value="女" />
      女</label></td>
    </tr>
    <tr>
      <td>地址：</td>
      <td><input type="text" name="address" id="address" /></td>
    </tr>
    <tr>
      <td>生日：</td>
      <td><input type="date" name="sdate" id="sdate" value="1995-01-01"/></td>
    </tr>
    <tr>
      <td>班级：</td>
      <td><label for="classid"></label>
        <select name="classid" id="classid">
      </select></td>
    </tr>
    <tr>
      <td colspan="2" align="center" bgcolor="#FFFFCC"><input type="button" name="btsave" id="btsave" value="保存" />
      <input type="button" name="btupdate" id="btupdate" value="更新" />
      <input type="reset" name="btreset" id="btreset" value="重置" /></td>
    </tr>
  </table>
</form>
<p>&nbsp;</p>
</body>
</html>