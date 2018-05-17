<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

  <title>网站后台管理系统 </title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">


 <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
  <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>

  <link rel="stylesheet" href=<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath()+"/"%>jsp/html/SystemUser/css/bootstrap.min.css>
  <script src=<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath()+"/"%>jsp/html/SystemUser/js/ace.min.js></script>
  <script src=<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath()+"/"%>jsp/html/SystemUser/js/ace-elements.min.js></script>
  <script src=<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath()+"/"%>jsp/html/SystemUser/js/ace-extra.min.js></script>
  <link rel="stylesheet" href=<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath()+"/"%>jsp/html/SystemUser/css/dataTables.bootstrap.min.css>
  <link rel="stylesheet" href=<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath()+"/"%>jsp/html/SystemUser/css/style.css>
  <link rel="stylesheet" href=<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath()+"/"%>jsp/html/SystemUser/css/codemirror.css>
  <link rel="stylesheet" href=<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath()+"/"%>jsp/html/SystemUser/css/ace.min.css>
  <script src=<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath()+"/"%>jsp/html/SystemUser/js/bootstrap.min.js></script>
  <script src=<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath()+"/"%>jsp/html/SystemUser/js/jquery.dataTables.min.js></script>
  <script src=<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath()+"/"%>jsp/html/SystemUser/js/jquery.dataTables.bootstrap.js></script>
  <link rel="stylesheet" href=<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath()+"/"%>jsp/html/SystemUser/css/layer.css>
  <link rel="stylesheet" href=<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath()+"/"%>jsp/html/SystemUser/css/laydate.css>
  <link rel="stylesheet" href=<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath()+"/"%>jsp/html/SystemUser/css/laydate(1).css>


  <script type="text/javascript">
    $(function () {
      var cid = $('#nav_list> li>.submenu');
      cid.each(function (i) {
        $(this).attr('id', "Sort_link_" + i);

      })
    })
    jQuery(document).ready(function () {
      $.each($(".submenu"), function () {
        var $aobjs = $(this).children("li");
        var rowCount = $aobjs.size();
        var divHeigth = $(this).height();
        $aobjs.height(divHeigth / rowCount);
      });
      //初始化宽度、高度 
      $("#main-container").height($(window).height() - 76);
      $("#iframe").height($(window).height() - 140);

      $(".sidebar").height($(window).height() - 99);
      var thisHeight = $("#nav_list").height($(window).outerHeight() - 173);
      $(".submenu").height();
      $("#nav_list").children(".submenu").css("height", thisHeight);

      //当文档窗口发生改变时 触发
      $(window).resize(function () {
        $("#main-container").height($(window).height() - 76);
        $("#iframe").height($(window).height() - 140);
        $(".sidebar").height($(window).height() - 99);

        var thisHeight = $("#nav_list").height($(window).outerHeight() - 173);
        $(".submenu").height();
        $("#nav_list").children(".submenu").css("height", thisHeight);
      });
      $(".iframeurl").click(function () {
        var cid = $(this).attr("name");
        var cname = $(this).attr("title");
        $("#iframe").attr("src", cid).ready();
        $("#Bcrumbs").attr("href", cid).ready();
        $(".Current_page a").attr('href', cid).ready();
        $(".Current_page").attr('name', cid);
        $(".Current_page").html(cname).css({"color": "#333333", "cursor": "default"}).ready();
        $("#parentIframe").html('<span class="parentIframe iframeurl"> </span>').css("display", "none").ready();
        $("#parentIfour").html('').css("display", "none").ready();
      });


    });


    /*********************点击事件*********************/
    $(document).ready(function () {
      $('#nav_list').find('li.home').click(function () {
        $('#nav_list').find('li.home').removeClass('active');
        //$(this).addClass('active');
      });


//时间设置
      function currentTime() {
        var d = new Date(), str = '';
        str += d.getFullYear() + '年';
        str += d.getMonth() + 1 + '月';
        str += d.getDate() + '日';
        str += d.getHours() + '时';
        str += d.getMinutes() + '分';
        str += d.getSeconds() + '秒';
        return str;
      }

      setInterval(function () {
        $('#time').html(currentTime)
      }, 1000);
//修改密码

      $('#Exit_system').on('click', function () {
        layer.confirm('是否确定退出系统？', {
            btn: ['是', '否'],//按钮
            icon: 2,
          },
          function () {
            location.href = '<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath()+"/"%>jsp/html/SystemUser/adminLogin.jsp';

          });
      });
    })
  </script>

</head>

<body>
<div class="navbar navbar-default" id="navbar">
  <script type="text/javascript">
    try {
      ace.settings.check('navbar', 'fixed')
    } catch (e) {
    }
  </script>
  <div class="navbar-container" id="navbar-container">
    <div class="navbar-header pull-left">
      <a href=<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath()+"/"%>jsp/html/SystemUser/home.jsp# class="navbar-brand">
        <small>
        </small>
      </a>
    </div>

  </div>
</div>
<div class="main-container" id="main-container" style="height: 537px;">
  <script type="text/javascript">
    try {
      ace.settings.check('main-container', 'fixed')
    } catch (e) {
    }
  </script>
  <div class="main-container-inner">
    <a class="menu-toggler" id="menu-toggler" href=<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath()+"/"%>jsp/html/SystemUser/home.jsp#>
      <span class="menu-text"></span>
    </a>
    <div class="sidebar" id="sidebar" style="height: 514px;">
      <script type="text/javascript">
        try {
          ace.settings.check('sidebar', 'fixed')
        } catch (e) {
        }
      </script>
      <div class="sidebar-shortcuts" id="sidebar-shortcuts">
        <div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
          Easyhousing后台管理系统
        </div>
        <div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
          <span class="btn btn-success"></span>
          <span class="btn btn-info"></span>
          <span class="btn btn-warning"></span>
          <span class="btn btn-danger"></span>
        </div>
      </div>
      <ul class="nav nav-list" id="nav_list" style="height: 440px;text-align: right">
        <li class="home">
          <a href="javascript:void(0)"  name=<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath()+"/"%>homeinit.do class="iframeurl" title="">
            <span class="menu-text"> 系统首页 </span>
          </a>
        </li>
      <li>
          <a href="#" title="用户管理" class="iframeurl" name=<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath()+"/"%>managerUserinit.do><span class="menu-text">用户管理 </span></a>
        </li> 
        <!-- 
		<li>
          <a href="#" class="dropdown-toggle" name=<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath()+"/"%>jsp/html/SystemUser/managerBuilding.jsp><span class="menu-text">租房管理</span></a>
          <ul class="submenu" id="Sort_link_4">
            <li >
              <a href="#" title="租房管理" class="iframeurl" style="text-align: center" name=<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath()+"/"%>managerRentHouseinit.do>租房管理</a>
            <li >
              <a href="#" title="租房记录" class="iframeurl" style="text-align: center" name=<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath()+"/"%>managerRentHouseDealinit.do >租房记录</a>
          </ul>
        </li>
         -->
 		<li>
          <a href="#" class="iframeurl" name=<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath()+"/"%>managerRentHouseinit.do><span class="menu-text">租房管理</span></a>
        </li>
        <!-- 
		<li>
          <a href="#" class="iframeurl" name=<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath()+"/"%>managerRentHouseDealinit.do><span class="menu-text">租房记录</span></a>
        </li>

        <li>
          <a href="#" class="iframeurl" name=<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath()+"/"%>managerAgentinit.do><span class="menu-text"> 经纪人 </span></a>
        </li>

        <li>
          <a href="#" class="dropdown-toggle" name=<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath()+"/"%>jsp/html/SystemUser/managerBuilding.jsp><span class="menu-text">楼盘管理 </span></a>
          <ul class="submenu" id="Sort_link_5">
            <li >
              <a href="#" title="楼盘管理" class="iframeurl" style="text-align: center" name=<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath()+"/"%>managerBuildinginit.do>楼盘管理</a>
            <li >
              <a href="#" title="楼盘交易" class="iframeurl" style="text-align: center" name=<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath()+"/"%>managerBuildingDealinit.do >买房记录</a>
          </ul>
        </li> -->
        <li>
          <a href="#" class="iframeurl" name=<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath()+"/"%>managerBuildinginit.do><span class="menu-text">楼盘管理 </span></a>
        </li>
        <!-- 
        <li>
          <a href="#" class="iframeurl" name=<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath()+"/"%>managerCheckRentHouseinit.do><span class="menu-text"> 审核租房 </span></a>
        </li>
         --> 
      </ul>

        
        

      <div class="sidebar-collapse" id="sidebar-collapse">
        <i class="icon-double-angle-left" data-icon1="icon-double-angle-left" data-icon2="icon-double-angle-right"></i>
      </div>

      <script type="text/javascript">
        try {
          ace.settings.check('sidebar', 'collapsed')
        } catch (e) {
        }
      </script>
    </div>
    <div class="main-content">
      <script type="text/javascript">
        try {
          ace.settings.check('breadcrumbs', 'fixed')
        } catch (e) {
        }
      </script>
      <div class="breadcrumbs" id="breadcrumbs">
        <ul class="breadcrumb">
          <li>
            <i class="icon-home home-icon"></i>
            <a href=<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath()+"/"%>homeinit.do>首页</a>
          </li>
        </ul>
      </div>


      <iframe id="iframe" style="border: 0px; width: 90%; background-color: rgb(255, 255, 255); height: 473px; "
              name="iframe" frameborder="0" src=<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath()+"/"%>homeinit.do></iframe>
      <div id="calUser" style="display: none"></div>
    </div>
  </div>
</div>
<!--底部样式-->

<div class="footer_style" id="footerstyle">
  <p class="l_f">版权所有：zdn</p>
  <p class="r_f">地址：福建省福州市鼓山18景 技术支持：XXXX</p>
</div>
<!--修改密码样式-->

</body>
</html>
