<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
  <link rel="stylesheet" href=<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath()+"/"%>jsp/html/SystemUser/css/bootstrap.min.css>
  <link rel="stylesheet" href=<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath()+"/"%>jsp/html/SystemUser/css/style.css>
  <link rel="stylesheet" href=<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath()+"/"%>jsp/html/SystemUser/css/codemirror.css>

  <link rel="stylesheet" href=<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath()+"/"%>jsp/html/SystemUser/css/ace-rtl.min.css>
  <link rel="stylesheet" href=<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath()+"/"%>jsp/html/SystemUser/css/ace-skins.min.css>
  <link rel="stylesheet" href=<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath()+"/"%>jsp/html/SystemUser/css/layer.css>


  <script src=<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath()+"/"%>jsp/html/SystemUser/js/typeahead-bs2.min.js></script>
  <script src=<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath()+"/"%>jsp/html/SystemUser/js/H-ui.js></script>
  <script src=<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath()+"/"%>jsp/html/SystemUser/js/H-ui.admin.js></script>
  <script src=<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath()+"/"%>jsp/html/SystemUser/js/layer.js></script>
  <link rel="stylesheet" href=<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath()+"/"%>jsp/html/SystemUser/css/layer.css>
  <link rel="stylesheet" href=<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath()+"/"%>jsp/html/SystemUser/css/laydate.css>
  <link rel="stylesheet" href=<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath()+"/"%>jsp/html/SystemUser/css/laydate(1).css>


  <script type="text/javascript" src="<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath()+"/"%>jsp/html/MyHome/js/jquery-1.11.1.min.js"></script>
  <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
  <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src=<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath()+"/"%>jsp/html/SystemUser/js/jquery.min.js></script>
  <script src=<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath()+"/"%>jsp/html/SystemUser/js/bootstrap.min.js></script>
  <script src=<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath()+"/"%>jsp/html/SystemUser/js/jquery.dataTables.min.js></script>
  <script src=<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath()+"/"%>jsp/html/SystemUser/js/jquery.dataTables.bootstrap.js></script>



  <script type="text/javascript">
  try {
  var AG_onLoad=function(func){if(document.readyState==="complete"||document.readyState==="interactive")func();else if(document.addEventListener)document.addEventListener("DOMContentLoaded",func);else if(document.attachEvent)document.attachEvent("DOMContentLoaded",func)};
  var AG_removeElementById = function(id) { var element = document.getElementById(id); if (element && element.parentNode) { element.parentNode.removeChild(element); }};
  var AG_removeElementBySelector = function(selector) { if (!document.querySelectorAll) { return; } var nodes = document.querySelectorAll(selector); if (nodes) { for (var i = 0; i < nodes.length; i++) { if (nodes[i] && nodes[i].parentNode) { nodes[i].parentNode.removeChild(nodes[i]); } } } };
  var AG_each = function(selector, fn) { if (!document.querySelectorAll) return; var elements = document.querySelectorAll(selector); for (var i = 0; i < elements.length; i++) { fn(elements[i]); }; };
  var AG_removeParent = function(el, fn) { while (el && el.parentNode) { if (fn(el)) { el.parentNode.removeChild(el); return; } el = el.parentNode; } };
} catch (ex) { console.error('Error executing AG js: ' + ex); }
</script>


  <title>无标题文档</title>
  <style>
    .dataTable th.sorting_desc:after {
      content: "\f0dd";
      top: 5px;
      color: #307ecc;
    }
  </style>
  <script>
    $(document).ready(function() {
      $('#sample-table').DataTable();
    } );

    $.fn.dataTable.ext.errMode = function(s,h,m){}
  </script>

</head>
<body>
<div class="page-content clearfix">
  <div class="alert alert-block alert-success">
    <button type="button" class="close" data-dismiss="alert"><i class="icon-remove"></i></button>
    <i><span class="glyphicon glyphicon-ok green"></span></i>欢迎使用<strong class="green">后台管理系统<small>(v1.2)</small></strong><!-- ,你本次登陆时间为2016年7月12日13时34分，登陆IP:192.168.1.110. -->
  </div>

  <div class="state-overview clearfix">
    <div class="col-lg-5 col-sm-10">
      <section class="panel">
        <a href=<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath()+"/"%>managerUserinit.do title="用户数">
          <div class="symbol terques">
            <i><span class="glyphicon glyphicon-user"></span></i>
          </div>
          <div class="value">
            <h1><%out.print((Integer)session.getAttribute("userListSize"));%></h1>
            <p>用户数</p>
          </div>
        </a>
      </section>
    </div>
    <div class="col-lg-5 col-sm-10">
      <section class="panel">
        <div class="symbol yellow">
          <i><span class="glyphicon glyphicon-home"></span></i>
        </div>
        <div class="value">
          <h1><%out.print((Integer)session.getAttribute("buildingInfoListSize"));%></h1>
          <p>楼盘数</p>
        </div>
      </section>
    </div> 
    <div class="col-lg-5 col-sm-10">
      <section class="panel">
        <div class="symbol blue">
          <i><span class="glyphicon glyphicon-pencil"></span></i>
        </div>
        <div class="value">
          <h1><%out.print((Integer)session.getAttribute("rentHouseListSize"));%></h1>
          <p>租房数</p>
        </div>
      </section>
    </div>
  </div>
</div>
  <!--实时交易记录-->
</body>
</html>
