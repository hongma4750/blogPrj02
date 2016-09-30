/**
 * 
 */

$(document).ready(function(){
	
	$("#myImg").attr("src",$("#m_photo").val());
	
	if($("#fileload").val() != null){
		alert("ㅎㅎ");
	}

});



function deleteImg(){
	$("#m_photo").val("/TeamProject03/upload/no_image.gif");
	
	$("#myImg").attr("src",$("#m_photo").val());
	$("#exampleInputFile").val("");
}

function UploadImg(fileObj){
	var filePath = fileObj.value;
	var fileName = filePath.substring(filePath.lastIndexOf("\\")+1);
	
	if (fileObj.files && fileObj.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $('#myImg').attr('src', e.target.result);
        }
        reader.readAsDataURL(fileObj.files[0]);
    }

}
