

   	// livechat by www.mylivechat.com/  2018-06-12

   	


   	MyLiveChat.Version=1019;
   	MyLiveChat.FirstRequestTimeout=28800;
   	MyLiveChat.NextRequestTimeout=57600;
   	MyLiveChat.SyncType="VISIT";
   	MyLiveChat.SyncStatus="READY";
   	MyLiveChat.SyncUserName="Guest_4643e564";
   	MyLiveChat.SyncResult=null;
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


	
   	
   	MyLiveChat.VisitorLocation="MX|Mexico|19|Nuevo Leon|Monterrey";
   	MyLiveChat.LastLoadTime=new Date().getTime();
   	MyLiveChat.VisitorStatus="VISIT";
   	MyLiveChat.VisitorDuration=73;
   	MyLiveChat.VisitorEntryUrl="https://www.theengineeringprojects.com/2018/10/introduction-to-nodemcu-v3.html";
   	MyLiveChat.VisitorReferUrl="https://www.google.com/";

   	MyLiveChat.VisitorUrls=[];


   	MyLiveChat.VisitorUrls.push("https://www.theengineeringprojects.com/2018/10/introduction-to-nodemcu-v3.html");
   	

   	MyLiveChat_Initialize();

   	if(MyLiveChat.localStorage||MyLiveChat.userDataBehavior)
   	{
   		MyLiveChat_SyncToCPR();
   	}
	
   	