
var currentURL = window.location.href
let projId = currentURL.split('/');
console.log("currentURL : " + currentURL);
console.log("projId : " + projId[4]);



$(function(){
  
  $.ajax({  //댓글 리스트 ajax
    type : 'POST',
    url : '/proj/'+projId[4]+'/IssueHighCmtInsert',
    contentType : "application/json;  charset=utf-8",
    async : false,
    data :  JSON.stringify(data) ,
    beforeSend : function(xhr) {   // 데이터 전송 전 헤더에 csrf값 설정
      xhr.setRequestHeader(header, token);
    },
    success : function(result) {
      location.reload();
  },
  error: function (jqXHR, textStatus, errorThrown)
  {
      alert("실패다");
        console.log(errorThrown,textStatus);
  }
});
  


  $("#repAdd").on("click", function(){
    alert("댓글 등록 이벤트 IN")
    
        data = {
      "issueCmtCts": $("#issueCmtCts").val(),
            "issueId" : $("#issueId").text(),
  
      }
  
        console.log("data : " , data)
  
            $.ajax({ 
                type : 'POST',
                url : '/proj/'+projId[4]+'/IssueHighCmtInsert',
                contentType : "application/json;  charset=utf-8",
                async : false,
                data :  JSON.stringify(data) ,
                beforeSend : function(xhr) {   // 데이터 전송 전 헤더에 csrf값 설정
                  xhr.setRequestHeader(header, token);
                },
                success : function(result) {
                  location.reload();
              },
              error: function (jqXHR, textStatus, errorThrown)
              {
                  alert("실패다");
                    console.log(errorThrown,textStatus);
              }
            });
  
    
  });

    $.ajax({
        url : "/proj/"+projId[4]+"/taskListSelect",
        dataType : "json",
        type : "post",
        beforeSend : function(xhr) {   // 데이터 전송 전 헤더에 csrf값 설정
                xhr.setRequestHeader(header, token);
              },
        success : function(data){
            var searchval;
            console.log("data : " + data.vo.taskId);
            console.log("data : " + data.vo.taskTitle);
            console.log("data : " + JSON.stringify(data));

            for(let i=0; i<data.vo.length; i++){
                searchval  = '<option value='+data.vo[i].taskId+'>'+data.vo[i].taskTitle+'</option>';
                $("#taskId").append(searchval);
            }
			console.log("searchval : " + searchval);

        },error:function(request,status,error){
            alert("에러");
         }
      });
	
	
    
    $("#sendbtn").on("click",function(){
        var textareaVal = $("textarea[name=issueCts]").text();
        var issueCts = CKEDITOR.instances.issueCts.getData();
        let inputFile = $("#itgrnAttachFileNum");
        let files = inputFile[0].files;
        
        console.log("files : " , files);

        let formData = new FormData();

        for(let i=0; i<files.length; i++){
            formData.append("uploadFile",files[i]);
        }
        formData.append("issueTitle",$("#issueTitle").val());
        formData.append("taskId",$("#taskId").val());
        formData.append("issueCts",issueCts);
        formData.append("issueId",$("#taskId").val());


        console.log("formData : " , formData);
        console.log("$(#itgrnAttachFileNum) : " , files );


        $.ajax({
            url : "/proj/"+projId[4]+"/issueDataInsert",
            data : formData,
            contentType : false,
            processData: false,
            type : "post",
            beforeSend : function(xhr) {   // 데이터 전송 전 헤더에 csrf값 설정
                    xhr.setRequestHeader(header, token);
                  },
            success : function(data){





    
            },error:function(request,status,error){
                alert("에러");
             }
          });
    });






})

