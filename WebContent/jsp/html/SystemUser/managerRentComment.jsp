<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
  <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <link rel="stylesheet" href="css/dataTables.bootstrap.min.css">
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="../../css/SystemUser/style.css">
  <link rel="stylesheet" href="css/codemirror.css">
  <link rel="stylesheet" href="css/ace.min.css">
  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/typeahead-bs2.min.js"></script>
  <script src="js/jquery.dataTables.min.js"></script>
  <script src="js/jquery.dataTables.bootstrap.js"></script>
  <script src="js/H-ui.js"></script>
  <script src="js/H-ui.admin.js"></script>
  <script src="js/layer.js"></script>
  <link rel="stylesheet" href="css/layer.css">
  <script src="js/laydate.js"></script>
  <link rel="stylesheet" href="css/laydate.css">
  <link rel="stylesheet" href="css/laydate(1).css">

  <style>
    .dataTable th.sorting_desc:after {
      content: "\f0dd";
      top: 15px;
      color: #307ecc;
    }
  </style>
  <link rel="stylesheet" href="css/ace-rtl.min.css">
  <link rel="stylesheet" href="css/ace-skins.min.css">


</head>
<body>
<div class="page-content clearfix">
  <div class="page-content clearfix" style="display: inline-block">
    <div id="Member_Ratings">
      <div class="d_Confirm_Order_style">
        <div class="search_style" style="display: block">
          <div class="title_names">搜索查询</div>
          <ul class="search_content clearfix">

            <li><label class="l_f" style="width: 60px">用户名称</label><input name="" type="text" class="text_add "
                                                                          placeholder="输入用户名称、电话、邮箱" style=" width:300px"></li>

            <li style="width:90px;">
              <button type="button" class="btn_search">查询</button>
            </li>
          </ul>
        </div>

        <div class="border clearfix" style="display: block">
               <span class="l_f">
                <a href="javascript:ovid()" id="member_add" class="btn btn-warning">添加租房评论</a>
                <a href="javascript:ovid()" class="btn btn-danger">批量删除</a>
               </span>
          <!--<span class="r_f">共：<b>2345</b>条</span>-->
        </div>

        <div class="table_menu_list">
          <div id="sample-table_wrapper" class="dataTables_wrapper no-footer">

            <table class="table table-striped table-bordered table-hover dataTable no-footer" id="sample-table"
                   role="grid" aria-describedby="sample-table_info">
              <thead>
              <tr role="row">
                <th width="25" class="sorting_disabled" rowspan="1" colspan="1" aria-label=""
                    style="width: 20.3333px;"><label><input id="selectedAll" type="checkbox"><span
                  class="lbl"></span></label>
                </th>
                <th width="80" tabindex="0" aria-controls="sample-table" rowspan="1"
                    colspan="1" aria-sort="descending" aria-label="ID" style="width: 90px;">用户ID
                </th>
                <th width="100" tabindex="0" aria-controls="sample-table" rowspan="1" colspan="1"
                    aria-label="房屋ID" style="width: 80px;">房屋ID
                </th>
                <th width="100" tabindex="0" aria-controls="sample-table" rowspan="1" colspan="1"
                    aria-label="评论" style="width: 80px;">评论
                </th>
                <th width="80" tabindex="0" aria-controls="sample-table" rowspan="1" colspan="1"
                    aria-label="时间" style="width: 60px;">评论时间
                </th>

                <th width="250" tabindex="0" aria-controls="sample-table" rowspan="1" colspan="1"
                    aria-label="操作" style="width: 200px;">操作
                </th>

              </tr>
              </thead>
              <tbody>
              <tr role="row" class="odd">
                <td><label><input type="checkbox"><span class="lbl"></span></label></td>
                <td class="sorting_1" value="5">20141791</td>
                <td>2</td>
                <td>阳光不错，价格也能接受。</td>
                <td>2017-06-26 00:00:00</td>


                <td class="td-manage">

                  <a title="编辑" href="javascript:;" class="btn btn-xs btn-info" onclick="member_edit(this.parentNode.parentNode.cells[1].innerHTML  )">编辑</a>

                  <a title="删除" href="javascript:;" class="btn btn-xs btn-warning" onclick="member_del(this, this.parentNode.parentNode.cells[1].innerHTML )">删除</a>
                </td>
              </tr>
              </tbody>


            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>



<div class="add_menber" id="add_menber_style" style="display:none">

  <ul class=" page-content">
    <li>
      <label class="label_name">用户ID：</label>
      <span class="add_name">
          <input name="用户ID" type="text"  class="text_add"/>
        </span>
    </li>

    <li>
      <label class="label_name">房屋ID：</label>
      <span class="add_name">
          <input name="房屋ID" type="text"  class="text_add"/>
        </span>
    </li>
    <li>
      <label class="label_name">租房时间：</label>
      <span class="add_name">
        <input class="inline laydate-icon" id="start" style=" margin-left:10px;">
        </span>
      <div class="prompt r_f"></div>
    </li>
    <li class="adderss">
      <label class="label_name">评论：</label>
      <span class="add_name">
          <!--<input name="评论" type="text"  class="text_add" style="width: 600px"/>-->
         <textarea name="评论" cols="40 " rows="4"> </textarea>
        </span>
      <div class="prompt r_f"></div>
    </li>

  </ul>
</div>

<script>


  jQuery(function($) {
    var oTable1 = $('#sample-table').dataTable( {
      "aaSorting": [[ 1, "desc" ]],//默认第几个排序
      "bStateSave": true,//状态保存
      "aoColumnDefs": [
        //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
        {"orderable":false,"aTargets":[0,7]}// 制定列不参与排序
      ] } );


    $('table th input:checkbox').on('click' , function(){
      var that = this;
      $(this).closest('table').find('tr > td:first-child input:checkbox')
        .each(function(){
          this.checked = that.checked;
          $(this).closest('tr').toggleClass('selected');
        });

    });


    $('[data-rel="tooltip"]').tooltip({placement: tooltip_placement});
    function tooltip_placement(context, source) {
      var $source = $(source);
      var $parent = $source.closest('table')
      var off1 = $parent.offset();
      var w1 = $parent.width();

      var off2 = $source.offset();
      var w2 = $source.width();

      if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) return 'right';
      return 'left';
    }
  })
  /*用户-添加*/
  $('#member_add').on('click', function(){
    layer.open({
      type: 1,
      title: '添加用户评论',
      maxmin: true,
      shadeClose: true, //点击遮罩关闭层
      area : ['800px' , ''],
      content:$('#add_menber_style'),
      btn:['提交','取消'],
      yes:function(index,layero){
        var num=0;
        var str="";
        $(".add_menber input[type$='text']").each(function(n){
          if($(this).val()=="")
          {

            layer.alert(str+=""+$(this).attr("name")+"不能为空！\r\n",{
              title: '提示框',
              icon:0,
            });
            num++;
            return false;
          }
        });
        if(num>0){  return false;}
        else{
          layer.alert('添加成功！',{
            title: '提示框',
            icon:1,
          });
          layer.close(index);
        }
      }
    });
  });
  /*用户-查看*/
  function member_show(title,url,id,w,h){
    layer_show(title,url+'#?='+id,w,h);
  }
  /*用户-停用*/
  function member_stop(obj,id){
    layer.confirm('确认要停用吗？',function(index){
      $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs " onClick="member_start(this,id)" href="javascript:;" title="启用"><i class="icon-ok bigger-120"></i></a>');
      $(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已停用</span>');
      $(obj).remove();
      layer.msg('已停用!',{icon: 5,time:1000});
    });
  }

  /*用户-启用*/
  function member_start(obj,id){
    layer.confirm('确认要启用吗？',function(index){
      $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs btn-success" onClick="member_stop(this,id)" href="javascript:;" title="停用"><i class="icon-ok bigger-120"></i></a>');
      $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已启用</span>');
      $(obj).remove();
      layer.msg('已启用!',{icon: 6,time:1000});
    });
  }
  /*用户-编辑*/
  function member_edit(id){
    layer.open({
      type: 1,
      title: '修改用户评论信息',
      maxmin: true,
      shadeClose:false, //点击遮罩关闭层
      area : ['800px' , ''],
      content:$('#add_menber_style'),
      btn:['提交','取消'],
      yes:function(index,layero){
        var num=0;
        var str="";
        $(".add_menber input[type$='text']").each(function(n){
          if($(this).val()=="")
          {

            layer.alert(str+=""+$(this).attr("name")+"不能为空！\r\n",{
              title: '提示框',
              icon:0,
            });
            num++;
            return false;
          }
        });
        if(num>0){  return false;}
        else{
          layer.alert('添加成功！',{
            title: '提示框',
            icon:1,
          });
          layer.close(index);
        }
      }
    });
  }
  /*用户-删除*/
  function member_del(obj,id){
    layer.confirm('确认要删除吗？',function(index){
      $(obj).parents("tr").remove();
      layer.msg('已删除!',{icon:1,time:1000});
    });
  }
  laydate({
    elem: '#start',
    event: 'focus'
  });
</script>

</body>
</html>
