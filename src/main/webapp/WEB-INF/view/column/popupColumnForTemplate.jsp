<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.xnx3.DateUtil"%>
<%@page import="com.xnx3.j2ee.Global"%>
<%@page import="com.xnx3.wangmarket.admin.G"%><%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="../iw/common/head.jsp">
    <jsp:param name="title" value="编辑栏目"/>
</jsp:include>

<script src="<%=basePath+Global.CACHE_FILE %>SiteColumn_used.js"></script>
<script src="<%=basePath+Global.CACHE_FILE %>SiteColumn_type.js"></script>
<script src="<%=basePath+Global.CACHE_FILE %>SiteColumn_editMode.js"></script>
<script src="<%=basePath+Global.CACHE_FILE %>SiteColumn_listRank.js"></script>


<form id="form" method="post" class="layui-form" style="padding:0px;margin-bottom: 10px; margin-top:0px;">
	<input type="hidden" value="${siteColumn.id }" name="id">
	
	
<div class="layui-tab layui-tab-card" style="border-style: none; box-shadow: 0 0px 0px 0 rgba(0,0,0,.1); margin-top: 0px;">
  <ul class="layui-tab-title">
    <li class="layui-this">基本设置</li>
    <li>信息录入</li>
    <li>高级设置</li>
  </ul>
  <div class="layui-tab-content" style="padding-right: 35px;">
    <div class="layui-tab-item layui-show">
    	<div class="layui-form-item">
			<label class="layui-form-label" id="label_columnName">栏目名称</label>
			<div class="layui-input-block">
				<input type="text" name="name" lay-verify="name" autocomplete="off" placeholder="限40个字符以内" class="layui-input" value="${siteColumn.name }">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label" id="parentColumnCode_label">所属栏目</label>
			<div class="layui-input-block">
				<select name="parentCodeName" id="parentCodeName">
					${parentColumnOption}
				</select>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label" id="columnType">栏目类型</label>
			<div class="layui-input-block">
				<select name="type" required="type" lay-verify="type" lay-filter="type" id="type">
					<option value="">请选择</option>
					<option value="7" <c:if test="${siteColumn.type=='7'}"> selected="selected"</c:if>>信息列表</option>
					<option value="8" <c:if test="${siteColumn.type=='8'}"> selected="selected"</c:if>>独立页面</option>
				</select>
			</div>
		</div>
		<div class="layui-form-item" id="xnx3_listTemplate">
			<label class="layui-form-label" id="listTemplate">列表模版</label>
			<div class="layui-input-block">
				<select name="templatePageListName" lay-verify="listTemplateVerify" id="templatePageListName">
					${tpl_list_option}
				</select>
			</div>
		</div>
		<div class="layui-form-item" id="xnx3_viewTemplate">
			<label class="layui-form-label" id="viewTemplate">内容模版</label>
			<div class="layui-input-block">
				<select name="templatePageViewName" id="templatePageViewName">
					${tpl_view_option}
				</select>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label" id="columnCode">栏目代码</label>
			<div class="layui-input-block">
				<input type="text" name="codeName" lay-verify="required" autocomplete="off" placeholder="限20个字符以内" class="layui-input" value="${siteColumn.codeName }">
			</div>
		</div>
		<div class="layui-form-item" id="listnum">
			<label class="layui-form-label" id="listnum_label">列表条数</label>
			<div class="layui-input-block">
				<input type="number" name="listNum" autocomplete="off" placeholder="列表页面每页显示的条数" class="layui-input" value="${siteColumn.listNum }">
			</div>
		</div>
		
		
		
    </div>
    <div class="layui-tab-item">
    	<!-- 信息录入 -->
    	
    	<!-- 内容编辑方式，当独立页面时才会有效，才会显示。选择是使用内容富文本编辑框编辑，还是使用模板的方式编辑 -->
		<div class="layui-form-item" id="xnx3_editMode">
			<label class="layui-form-label" id="columnEditMode">编辑方式</label>
			<div class="layui-input-block">
				<script type="text/javascript">writeSelectAllOptionForeditMode_('${siteColumn.editMode }','', true);</script>
			</div>
		</div>
    	
    	<div class="layui-form-item neirongguanli_shuru" id="inputModel">
			<label class="layui-form-label" id="inputModel_label">输入模型</label>
			<div class="layui-input-block">
				<select name="inputModelCodeName" id="inputModelCodeName">
					${inputModelOptions }
				</select>
			</div>
		</div>
		
		
		<div style="padding-left: 30px; font-size: 12px; color: gray;padding-bottom: 10px;" class="neirongguanli_shuru">
			<hr>
			以下是当你进入 “内容管理” 中进行编辑文章时，是否显示这几个录入项
			
		</div>
		
    	
<style>
.layui-form-switch em {
	font-size: 15px;
}
</style>    	
    	<div class="layui-form-item neirongguanli_shuru">
			<label class="layui-form-label" id="label_editUseTitlepic">标题图片</label>
			<div class="layui-input-block">
				<input type="checkbox" name="editUseTitlepic" lay-skin="switch" lay-text="显示|隐藏" value="1" <c:if test="${siteColumn.editUseTitlepic=='1'}"> checked</c:if>>
			</div>
		</div>
		<div class="layui-form-item neirongguanli_shuru">
			<label class="layui-form-label" id="label_editUseExtendPhotos">文章图集</label>
			<div class="layui-input-block">
				<input type="checkbox" name="editUseExtendPhotos" lay-skin="switch" lay-text="显示|隐藏" value="1" <c:if test="${siteColumn.editUseExtendPhotos=='1'}"> checked</c:if>>
			</div>
		</div>
		<div class="layui-form-item neirongguanli_shuru">
			<label class="layui-form-label" id="label_editUseIntro">内容简介</label>
			<div class="layui-input-block">
				<input type="checkbox" name="editUseIntro" lay-skin="switch" lay-text="显示|隐藏" value="1" <c:if test="${siteColumn.editUseIntro=='1'}"> checked</c:if>>
			</div>
		</div>
		<div class="layui-form-item neirongguanli_shuru">
			<label class="layui-form-label" id="label_editUseText">内容正文</label>
			<div class="layui-input-block">
				<input type="checkbox" name="editUseText" lay-skin="switch" lay-text="显示|隐藏" value="1" <c:if test="${siteColumn.editUseText=='1'}"> checked</c:if>>
			</div>
		</div>
		
    </div>
    <div class="layui-tab-item">
    	<!-- 高级方式 -->
    	
		<div class="layui-form-item" id="listRank">
			<label class="layui-form-label" id="listRank_label">信息排序</label>
			<div class="layui-input-block">
				<script type="text/javascript">writeSelectAllOptionForlistRank_('${siteColumn.listRank }','请选择', false);</script>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label" id="xianshi_label">是否显示</label>
			<div class="layui-input-block">
				<script type="text/javascript">writeSelectAllOptionForused_('${siteColumn.used }','请选择', true);</script>
			</div>
		</div>
    	
    </div>
  </div>
</div>

	
	<div class="layui-form-item" style="padding-top:15px;">
		<div class="layui-input-block">
			<button class="layui-btn" lay-submit="" lay-filter="demo1">保存修改</button>
			<button type="reset" class="layui-btn layui-btn-primary">重置</button>
		</div>
	</div>
	
	<div style="padding:10px;color:#e2e2e2; padding-bottom: 2px; width:100%; text-align:center;">
		提示：鼠标放到左侧描述,可显示当前说明
	</div>
</form>

<script>
//自适应弹出层大小
var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
parent.layer.iframeAuto(index);

layui.use(['form', 'layedit', 'laydate', 'element'], function(){
  var form = layui.form;

  //自定义验证规则
  form.verify({
    name: function(value){
      if(value.length == 0 || value.length > 40){
        return '请输入40个字以内的栏目名称';
      }
    },
    type: function(value){
      if(value=='' || value.length ==0){
        return '请选择栏目类型';
      }
    }
  });
  
	//当类型发生变动改变
	form.on('select(type)', function (data) {
		selectTypeChange();
	});
	
	//当编辑方式发生变动改变
	form.on('select(editMode)', function (data) {
		selectEditMode();
	});
  
  //监听提交
  form.on('submit(demo1)', function(data){
  		parent.iw.loading('保存中');
		var d=$("form").serialize();
        $.post("<%=basePath %>column/savePopupColumnGaoJiUpdate.do", d, function (result) { 
        	parent.iw.loadClose();
        	var obj = JSON.parse(result);
        	if(obj.result == '1'){
        		parent.parent.iw.msgSuccess("操作成功");
        		parent.location.reload();	//刷新父窗口
        		parent.layer.close(index);
        	}else if(obj.result == '0'){
        		parent.layer.msg(obj.info, {shade: 0.3})
        	}else{
        		parent.layer.msg(result, {shade: 0.3})
        	}
         }, "text");
		
    return false;
  });
  
});


//鼠标跟随提示
$(function(){
	//栏目名称
	var label_columnName_index = 0;
	$("#label_columnName").hover(function(){
		label_columnName_index = layer.tips('给当前栏目起个名字吧。这里的名字可以直接在网站里调出显示，也可以在内容管理中显示栏目的名字。', '#label_columnName', {
			tips: [2, '#0FA6A8'], //还可配置颜色
			time:0,
			tipsMore: true,
			area : ['310px' , 'auto']
		});
	},function(){
		layer.close(label_columnName_index);
	})

	//列表页模版
	var listTemplate_index = 0;
	$("#listTemplate").hover(function(){
		listTemplate_index = layer.tips('当前栏目信息展示给用户看时，的列表页面模版<br/>比如，新闻列表、产品列表、成功案例列表等此类信息列表。<br/>若这里为空，那肯定就是还没有创建过列表页模版了，先去<b>模版页面</b>去创建一个列表页模版吧', '#listTemplate', {
			tips: [2, '#0FA6A8'], //还可配置颜色
			time:0,
			tipsMore: true,
			area : ['310px' , 'auto']
		});
	},function(){
		layer.close(listTemplate_index);
	})
	
	//编辑方式
	var columnEditMode_index = 0;
	$("#columnEditMode").hover(function(){
		columnEditMode_index = layer.tips('编辑方式，设定其填充/编辑内容信息的编辑方式。<br/>1.&nbsp;<b>在内容管理中编辑</b>，系统默认的内容编辑，比如添加新闻、图文时，都可以使用这个。若对此详不是太了解，一律选择此项即可。<br/>2.&nbsp;<b>在模版页面中编辑</b>，直接编辑模版页面的方式进行编辑，同样，编辑的工具是模版页，也就是直接对模版页面进行编辑。<br/><b style="font-size:16px; padding:6px;">注意，若是不理解，请勿改动本项。</b>', '#columnEditMode', {
			tips: [2, '#0FA6A8'], //还可配置颜色
			time:0,
			tipsMore: true,
			area : ['310px' , 'auto']
		});
	},function(){
		layer.close(columnEditMode_index);
	})
	
	//内容页模版
	var viewTemplate_index = 0;
	$("#viewTemplate").hover(function(){
		viewTemplate_index = layer.tips('当前栏目信息展示给用户看时，的内容页面模版<br/>比如，新闻详情、产品详情、公司介绍、联系我们等页面，都是单独的一个内容介绍页面<br/>若这里为空，那肯定就是还没有创建过内容页模版了，先去<b>模版页面</b>去创建一个内容页模版吧', '#viewTemplate', {
			tips: [2, '#0FA6A8'], //还可配置颜色
			time:0,
			tipsMore: true,
			area : ['310px' , 'auto']
		});
	},function(){
		layer.close(viewTemplate_index);
	})
	
	//栏目类型
	var columnType_index = 0;
	$("#columnType").hover(function(){
		//这里通常使用的有这么三种：<br/><b>新闻信息</b>：像是新闻列表、动态资讯，这种纯文字性质的列表，并点击某项后可进入查看详情<br/><b>图文信息</b>：像是产品展示、案例展示等，图片＋文字形式的列表，并点击项后进入查看详情<br/><b>独立页面</b>：像是公司简介、联系我们、招商加盟这种单独的页面
		columnType_index = layer.tips('<b>信息列表</b>：像是新闻列表、动态资讯、产品展示等，这种信息的列表。这个栏目内的文章条数不固定，用户可以随意添加多条信息。<br/><b>独立页面</b>：像是公司简介、联系我们这种的，一个栏目就只有一个页面的', '#columnType', {
			tips: [2, '#0FA6A8'], //还可配置颜色
			time:0,
			tipsMore: true,
			area : ['310px' , 'auto']
		});
	},function(){
		layer.close(columnType_index);
	})
	
	//栏目代码
	var columnCode_index = 0;
	$("#columnCode").hover(function(){
		columnCode_index = layer.tips('1.&nbsp;网站中，每个栏目都有一个唯一的栏目代码，在模版中动态调用某个栏目、或某个栏目下的动态数据时，就是根据这个栏目的栏目代码来进行调取的。<br/>2.&nbsp;此处强烈建议使用英文或拼音，禁止特殊字符<br/>3.&nbsp;<b>提示：生成的页面就是以这里命名的。填的栏目代码.html</b>。例如，你的栏目代码设置为aboutus，那么你这个页面的地址便是你的域名/aboutus.html<br/>4.&nbsp;栏目代码设置好后最好不要再改动！模版页面、模版栏目中动态调用栏目就是使用的这个；还有栏目的备份还原也是使用的栏目代码！', '#columnCode', {
			tips: [2, '#0FA6A8'], //还可配置颜色
			time:0,
			tipsMore: true,
			area : ['310px' , 'auto']
		});
	},function(){
		layer.close(columnCode_index);
	})
	
	
	//上级栏目
	var parentColumnCode_index = 0;
	$("#parentColumnCode_label").hover(function(){
		parentColumnCode_index = layer.tips('您当前操作的栏目，是属于哪个栏目下的。<br/>若选顶级栏目，则此栏目不属于任何栏目，是顶级栏目<br/><b>注意，模版中动态调取数据只支持一级子栏目</b>', '#parentColumnCode_label', {
			tips: [2, '#0FA6A8'], //还可配置颜色
			time:0,
			tipsMore: true,
			area : ['310px' , 'auto']
		});
	},function(){
		layer.close(parentColumnCode_index);
	})
	
	//输入模型
	var inputModel_index = 0;
	$("#inputModel_label").hover(function(){
		inputModel_index = layer.tips('本栏目建立好后，在<b>内容管理</b>中操作本栏目的具体数据时，数据录入的样式。<br/>可在<b>模板管理</b>-<b>输入模型</b>中进行修改<b><br/><b style="font-size:16px; padding:6px;">注意，若是不理解，请勿改动本项。</b>', '#inputModel_label', {
			tips: [2, '#0FA6A8'], //还可配置颜色
			time:0,
			tipsMore: true,
			area : ['310px' , 'auto']
		});
	},function(){
		layer.close(inputModel_index);
	})
	
	//列表条数，列表页面的显示条数
	var listnum_index = 0;
	$("#listnum_label").hover(function(){
		listnum_index = layer.tips('当前列表页面，每个列表页显示多少条数据。<br/>如新闻列表，再生成后，用户查看新闻列表时，每页显示多少条新闻', '#listnum_label', {
			tips: [2, '#0FA6A8'], //还可配置颜色
			time:0,
			tipsMore: true,
			area : ['310px' , 'auto']
		});
	},function(){
		layer.close(listnum_index);
	})
	
	//显示
	var xianshi_index = 0;
	$("#xianshi_label").hover(function(){
		xianshi_index = layer.tips('绝大多数时候，都是显示即可，显示即正常使用。<br/>若是隐藏，在 内容管理 中不会显示此栏目、另外在模版页面中使用动态栏目代码调取子栏目列表时，也不会调取到', '#xianshi_label', {
			tips: [2, '#0FA6A8'], //还可配置颜色
			time:0,
			tipsMore: true,
			area : ['310px' , 'auto']
		});
	},function(){
		layer.close(xianshi_index);
	})
	
	//listRank ，信息排序
	var listRank_index = 0;
	$("#listRank_label").hover(function(){
		listRank_index = layer.tips('当前栏目内，内容信息排序方式。有以下两种：<br>1.&nbsp;<b>发布时间倒序</b>：发布时间越晚，排序越靠前。<br/>2.&nbsp;<b>发布时间正序</b>：发布时间越早，排序越靠前', '#listRank_label', {
			tips: [2, '#0FA6A8'], //还可配置颜色
			time:0,
			tipsMore: true,
			area : ['310px' , 'auto']
		});
	},function(){
		layer.close(listRank_index);
	})
	
	
	//内容管理中，是否使用标题图片
	var label_editUseTitlepic_index = 0;
	$("#label_editUseTitlepic").hover(function(){
		label_editUseTitlepic_index = layer.tips('标题图片，也就是文章的封面图，让每篇文章都有自己的一个封面图。比如，这个封面图可以是网站中，产品列表页面的每个产品的图片。', '#label_editUseTitlepic', {
			tips: [2, '#0FA6A8'], //还可配置颜色
			time:0,
			tipsMore: true,
			area : ['310px' , 'auto']
		});
	},function(){
		layer.close(label_editUseTitlepic_index);
	})
	
	
	//内容管理中，是否使用图集
	var label_editUseExtendPhotos_index = 0;
	$("#label_editUseExtendPhotos").hover(function(){
		label_editUseExtendPhotos_index = layer.tips('文章图集，也就是让每篇文章都有自己的图集，一篇文章里面，可以上传不固定数量的多张图片，可以在网站中，做出轮播图等效果', '#label_editUseExtendPhotos', {
			tips: [2, '#0FA6A8'], //还可配置颜色
			time:0,
			tipsMore: true,
			area : ['310px' , 'auto']
		});
	},function(){
		layer.close(label_editUseExtendPhotos_index);
	})
	
	//内容管理中，是否使用内容简介
	var label_editUseIntro_index = 0;
	$("#label_editUseIntro").hover(function(){
		label_editUseIntro_index = layer.tips('内容简介，也就是让本栏目中的每篇文章都可以编辑自己的内容简介。这些简介文字，可以在网站中，进行调取出来，比如在新闻列表中，作为新闻的简介说明。<br/>如果设置为不显示，内容简介也会有信息，会自动从内容正文中截取前120个字符作为内容简介的信息。', '#label_editUseIntro', {
			tips: [2, '#0FA6A8'], //还可配置颜色
			time:0,
			tipsMore: true,
			area : ['310px' , 'auto']
		});
	},function(){
		layer.close(label_editUseIntro_index);
	})
	
	//内容管理中，是否使用内容正文
	var label_editUseText_index = 0;
	$("#label_editUseText").hover(function(){
		label_editUseText_index = layer.tips('内容正文，也就是文章的正文、详情。也就是富文本编辑器UEditor编辑的区域，可以通过这里进行随意布局、上传图片、附件、表情、以及插入地图等！', '#label_editUseText', {
			tips: [2, '#0FA6A8'], //还可配置颜色
			time:0,
			tipsMore: true,
			area : ['310px' , 'auto']
		});
	},function(){
		layer.close(label_editUseText_index);
	})
	
	
});	

//当类型改变后，相应的自定义网址也会显示或者隐藏、模版也会相应显示或者隐藏
function selectTypeChange(){
	document.getElementById("xnx3_viewTemplate").style.display="none";	//内容模版
	document.getElementById("xnx3_listTemplate").style.display="none";	//列表模版
	document.getElementById("listnum").style.display="none";				//列表页面每页显示多少条
	
	if(document.getElementById("type").options[1].selected){
		//新闻、图文
		document.getElementById("xnx3_viewTemplate").style.display="";
		document.getElementById("xnx3_listTemplate").style.display="";
		document.getElementById("listnum").style.display="";
		document.getElementById("xnx3_editMode").style.display="none";
		document.getElementById("listRank").style.display="";
	}else if(document.getElementById("type").options[2].selected){
		//独立页面
		document.getElementById("xnx3_viewTemplate").style.display="";
		document.getElementById("xnx3_editMode").style.display="";
		document.getElementById("listRank").style.display="none";
	}
}
selectTypeChange();

//当编辑方式放生改变
function selectEditMode(){
	if(document.getElementById("editMode").options[2].selected){
		//模板式编辑，将不显示输入模型、以及图集、内容等输入选项
		$(".neirongguanli_shuru").hide();
	}else{
		$(".neirongguanli_shuru").show();
	}
}
selectEditMode();

</script>

<jsp:include page="../iw/common/foot.jsp"></jsp:include>