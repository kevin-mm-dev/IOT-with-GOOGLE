

   	// livechat by www.mylivechat.com/  2018-06-12

   	

   	if(typeof(MyLiveChat)=="undefined")
   	{
   		MyLiveChat={};
   		MyLiveChat.RawConfig={InlineChatWaitingFieldDepartment:"1",InPageImageOnline:"1",InlineChatSurveyUseRating:"1",InlineChatOfflineLogo:"27",InviteShowTimeout:"30",InlineChatWaitingFieldEmail:"1",InPageImageOffline:"1",InlineChatOnlineLogo:"27",InlineChatSurveyUseComment:"1",InvitePhoto:"4",InlineChatSurveyUseEmail:"1",InPageTemplate:"6",InviteSoundFile:"1",InviteAcceptTooltip:"Chat Invitation",InPageUseBubbleTop:"0",InlineChatWaitingFieldQuestion:"1",InvitePlaySound:"1",InviteMessage:"Hello, my name is (AGENT). If you need any technical help regarding your project, let us help.",InviteRejectTooltip:"Close",InviteHideTimeout:"1800",InlineChatTimestampVisible:"1",WebConsoleRedirectTime:"635234325226335402",InviteHeadline:"Chat Invitation",InlineChatSurveyVisible:"1",InPageBubbleTop:"1"};
   		MyLiveChat.RawQuery={hccid:"52199617",apimode:"chatinline"};
   		for(var mlcp in MyLiveChat.RawConfig)
   		{
   			MyLiveChat[mlcp]=MyLiveChat.RawConfig[mlcp];
   		}
   		for(var mlcp in MyLiveChat.RawQuery)
   		{
   			MyLiveChat[mlcp]=MyLiveChat.RawQuery[mlcp];
   		}
   		if(MyLiveChat.InPageTemplate=="1"||MyLiveChat.InPageTemplate=="7")
   			MyLiveChat.InlineChatTemplate="2";
   		if(!MyLiveChat.InlineChatTemplate)
   			MyLiveChat.InlineChatTemplate=MyLiveChat.InPageTemplate||"2";

   		MyLiveChat.HCCID='52199617';
   		MyLiveChat.PageBeginTime=new Date().getTime();
   		MyLiveChat.LoadingHandlers=[];
   		//	,"Departments"
   		MyLiveChat.CPRFIELDS=["SyncType","SyncStatus","SyncResult","HasReadyAgents","VisitorUrls","VisitorStatus","VisitorDuration","VisitorEntryUrl","VisitorReferUrl"];
	   }



   	MyLiveChat.Version=1019;
   	MyLiveChat.FirstRequestTimeout=28800;
   	MyLiveChat.NextRequestTimeout=57600;
   	MyLiveChat.SyncType=null;
   	MyLiveChat.SyncStatus="LOADING";
   	MyLiveChat.SyncUserName=null;
   	MyLiveChat.SyncResult="LOADING";
   	MyLiveChat.HasReadyAgents=false;
   	MyLiveChat.SourceUrl="https://www.theengineeringprojects.com/2018/10/introduction-to-nodemcu-v3.html";
   	MyLiveChat.AgentTimeZone=parseInt("5" || "-5");
   	MyLiveChat.UrlBase="https://s9.mylivechat.com/livechat/";
   	MyLiveChat.SiteUrl="https://s9.mylivechat.com/";

   	MyLiveChat.Departments=[];

   	

   	MyLiveChat.Departments.push({
   		Name:"Engineering",
   		Agents:[{
   			Id:'User:1',
   			Name:"Syed Zain Nasir",
   			Online:false
   			},{
   			Id:'User:11',
   			Name:"Muhammad Nashit",
   			Online:false
   			}],
   		Online:false
   		});

	

	
   	MyLiveChat.VisitorUrls=[];


	
   	
   	function MyLiveChat_AddScript(tag)
   	{
   		var func=MyLiveChat_AddScript;
   		var arr=func._list;
   		if(!arr)func._list=arr=[];
   		if(func._loading)
   		{
   			arr.push(tag);
   			return;
   		}
   		function ontagload()
   		{
   			func._loading=false;
   			if(!arr.length)return;
   			tag=arr.shift();
   			LoadTag();
   		}
   		function LoadTag()
   		{
   			func._loading=true;
   			if('onload' in tag)
   			{
   				tag.onload=ontagload;
   			}
   			else
   			{
   				var iid=setInterval(function()
   				{
   					if(tag.readyState!='complete'&&tag.readyState!='loaded')
   						return;
   					clearInterval(iid);
   					ontagload();
   				},10);
   			}
   			var p=document.getElementsByTagName("head")[0]||document.body;
   			p.insertBefore(tag,p.firstChild);
   		}
   		LoadTag();
   	}

   	function MyLiveChat_GetLastScriptTag()
   	{
   		var coll=document.getElementsByTagName("script");
   		return coll[coll.length-1];
   	}
   	function MyLiveChat_DocWrite(html,relativetag)
   	{
   		if(html.substr(0,7)=="<script")	//Low IE interactive or defer
   		{
   			var tag=document.createElement("script");

   			var src=html.match(/src=["']?([^"'>]*)["']/)[1];
   			var div=document.createElement("div");
   			div.innerHTML=src;
   			src=div.innerText||div.firstChild.nodeValue;

   			if(!MyLiveChat.LoadedScripts)MyLiveChat.LoadedScripts={};
   			if(MyLiveChat.LoadedScripts[src])return;
   			MyLiveChat.LoadedScripts[src]=true;
   			tag.setAttribute("src",src);
   			MyLiveChat_AddScript(tag);
   		}
   		else
   		{
   			if(!document.body||document.readyState=="loading")
   			{
   				document.write(html);
   				return;
   			}

   			if(!relativetag)relativetag=MyLiveChat_GetLastScriptTag();

   			var div = document.createElement("DIV");
   			div.innerHTML = html;
   			while (true) {
   				var c = div.firstChild;
   				if (!c) break;
   				div.removeChild(c);
   				relativetag.parentNode.insertBefore(c,relativetag);
   			}
   		}
   	}
	
   	MyLiveChat.NewGuid=function()
   	{
   		var guid = "";
   		for (var i = 1; i <= 32; i++){
   			guid +=Math.floor(Math.random()*16.0).toString(16);
   			if(i==8||i==12||i==16||i==20)guid += "-";
   		}
   		return guid;    
   	}

   	
   	MyLiveChat.RandomID='4643e564-5ccc-590a-d15d-6625cd20d708';


	

   	MyLiveChat.VisitorStatus="";
   	MyLiveChat.VisitorDuration=0;
   	MyLiveChat.VisitorEntryUrl="";
   	MyLiveChat.VisitorReferUrl="";

   	MyLiveChat.ShowButton=true;
   	MyLiveChat.ShowLink=true;
   	MyLiveChat.ShowBox=true;
   	MyLiveChat.ShowSmart=false;
   	MyLiveChat.ScriptUrl="https://s9.mylivechat.com/livechat/livechat.aspx?hccid=52199617\x26apimode=chatinline";




   	MyLiveChat.NoPrivateLabel=true;


   	MyLiveChat.LoadingHandlers.push(function(funcself)
   	{
   		MyLiveChat_RunLoadingHandler('chatinline',funcself);
   	});

   	MyLiveChat.ResourcesVary="\x26culture=es-US\x26mlcv=1019";

   	function MyLiveChat_HtmlEncode(text) {
   		if (!text) return "";
   		return text.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;").replace(/\x22/g, "&quot;")
			.replace(/\x27/g, "&#39;").replace(/\n/g, "<br/>").replace(/\r/g, "");
   	}
   	function MyLiveChat_LoadMoreScripts()
   	{
   		var mlcresurl=MyLiveChat.UrlBase+"resources.aspx?HCCID="+MyLiveChat.HCCID;
   		if(MyLiveChat.InPageTemplate)mlcresurl+="&InPageTemplate="+MyLiveChat.InPageTemplate;
   		if(MyLiveChat.InlineChatTemplate)mlcresurl+="&InlineChatTemplate="+MyLiveChat.InlineChatTemplate;
	
   		if(!window.jsml)
   		{
   			MyLiveChat_DocWrite("<script src='"+MyLiveChat.SiteUrl+"JSML/jsml.js'></scr"+"ipt>");
   		}
   		MyLiveChat_DocWrite("<script src='"+MyLiveChat_HtmlEncode(mlcresurl+MyLiveChat.ResourcesVary)+"'></scr"+"ipt>");

   		if(false)
   		{
		window.mlcapimodeisdialog=true;
   		var surl=MyLiveChat.ScriptUrl;
   		MyLiveChat_DocWrite("<script onerror='LoaderScriptTagError()' src='" + MyLiveChat_HtmlEncode(MyLiveChat.UrlBase + "dialog.aspx?"+surl.substring(surl.indexOf('?')+1))+"'></scr" + "ipt>");	
   		MyLiveChat_DocWrite("<script onerror='LoaderScriptTagError()' src='" +  MyLiveChat.UrlBase + "script/dialoginit.js'></scr" + "ipt>");
	   }
	   else if(false)
   	{
   		MyLiveChat.IsDesignMode=true;
   	}
   	}

   	MyLiveChat['chatinline'+"_script_tag"]=MyLiveChat_GetLastScriptTag();

   	if(typeof(MyLiveChat_Initialize)=="undefined")
   	{
   		MyLiveChat_LoadMoreScripts();
   	}
   	else
   	{
   		MyLiveChat_Initialize()
   	}

