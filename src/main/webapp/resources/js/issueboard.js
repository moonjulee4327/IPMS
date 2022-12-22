$(function(){
    
    var sel_file;

    $.ajax({
        url : "/proj/taskListSelect",
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
        
        data = { "issueTitle" : $("#issueTitle").val(),
                 "taskId" : $("#taskId").val(),
                 "issueCts" : issueCts
                }
    console.log("data : " + JSON.stringify(data));


    
 
        $("#file1").on("change", handleImgFileSelect);
 
    function handleImgFileSelect(e) {
        var files = e.target.files;
        var filesArr = Array.prototype.slice.call(files);
 
        var reg = /(.*?)\/(jpg|jpeg|png|bmp)$/;
 
        filesArr.forEach(function(f) {
            if (!f.type.match(reg)) {
                alert("확장자는 이미지 확장자만 가능합니다.");
                return;
            }
 
            sel_file = f;
 
            var reader = new FileReader();
            reader.onload = function(e) {
                $("#img").attr("src", e.target.result);
            }
            reader.readAsDataURL(f);
        });
    }







                    $.ajax({
                        url : "/proj/issueDataInsert",
                        data : JSON.stringify(data),
                        contentType : "application/json;  charset=utf-8",
                        type : "post",
                        beforeSend : function(xhr) {   // 데이터 전송 전 헤더에 csrf값 설정
                                xhr.setRequestHeader(header, token);
                            },
                        success : function(data){
                            alert("data");
                
                        },error:function(request,status,error){
                            alert("에러");
                        }
                    });

    });









})