<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!------ Include the above in your HEAD tag ---------->
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript">
$(document).ready(function() {
    document.getElementById('pro-image').addEventListener('change', readImage, false);
    
    $(document).on('click', '.image-cancel', function() {
        let no = $(this).data('no');
        $(".preview-image.preview-show-"+no).remove();
    });
});



var num = 4;
function readImage() {
    if (window.File && window.FileList && window.FileReader) {
        var files = event.target.files; //FileList object
        var output = $(".preview-images-zone");

        for (let i = 0; i < files.length; i++) {
            var file = files[i];
            if (!file.type.match('image')) continue;
            
            var picReader = new FileReader();
            
            picReader.addEventListener('load', function (event){
         		picFile = event.target;
                var html =  '<div class="preview-image preview-show-' + num + '">' +
                            '<div class="image-cancel" data-no="' + num + '">x</div>' +
                            '<div class="image-zone"><img id="pro-img-' + num + '" src="' + picFile.result + '"></div>' +
                            '<div class="tools-edit-image"><a href="javascript:void(0)" data-no="' + num + '" class="btn btn-light btn-edit-image">edit</a></div>' +
                            '</div>';

                output.append(html);
                num = num + 1;
            });

            picReader.readAsDataURL(file);
        }
        $("#pro-image").val('');
    } else {
        console.log('Browser not support');
    }
}
</script>
<style type="text/css">
.preview-images-zone {
    width: 100%;
    border: 1px solid #ddd;
    min-height: 630px;
    /* display: flex; */
    padding: 5px 5px 0px 5px;
    position: relative;
    overflow:auto;
}
.preview-images-zone > .preview-image:first-child {
    height: 490px;
    width: 100%;
    position: relative;
    margin-right: 5px;
}
.preview-images-zone > .preview-image {
    height: 100%;
    width: 33%;
    position: relative;
    float: left;
    margin-bottom: 5px;
    padding-bottom: 7px;
    border-bottom: 5px solid #f57a655c;
}
.preview-images-zone > .preview-image > .image-zone {
    width: 100%;
    height: 100%;
}
.preview-images-zone > .preview-image > .image-zone > img {
    width: 100%;
    height: 100%;
}
.preview-images-zone > .preview-image > .tools-edit-image {
    position: absolute;
    z-index: 100;
    color: #fff;
    bottom: 0;
    width: 100%;
    text-align: center;
    margin-bottom: 10px;
    display: none;
}
.preview-images-zone > .preview-image > .image-cancel {
    font-size: 18px;
    position: absolute;
    top: 0;
    right: 0;
    font-weight: bold;
    margin-right: 10px;
    cursor: pointer;
    display: none;
    z-index: 100;
}
.preview-image:hover > .image-zone {
    cursor: move;
    opacity: .5;
}
.preview-image:hover > .tools-edit-image,
.preview-image:hover > .image-cancel {
    display: block;
}
.ui-sortable-helper {
    width: 90px !important;
    height: 90px !important;
}

.container {
	max-width: 100%;
}
</style>
</head>
<body>
<div class="container">
    <fieldset class="form-group">
        <a href="javascript:void(0)" onclick="$('#pro-image').click()">Upload Image</a>
        <input type="file" id="pro-image" name="pro-image" style="display: none;" class="form-control" multiple>
    </fieldset>
    <div class="preview-images-zone">
        <div class="preview-image preview-show">
            <div class="image-cancel" data-no="1">x</div>
            <div class="image-zone"><img id="pro-img-1" src="<c:url value='/resources/images/noImage.gif'/>"></div>
            <div class="tools-edit-image"><a href="javascript:void(0)" data-no="1" class="btn btn-light btn-edit-image">edit</a></div>
        </div>
        <div class="preview-image preview-show">
            <div class="image-cancel" data-no="3">x</div>
            <div class="image-zone"><img id="pro-img-2" src="<c:url value='/resources/images/noImage.gif'/>"></div>
            <div class="tools-edit-image"><a href="javascript:void(0)" data-no="2" class="btn btn-light btn-edit-image">edit</a></div>
        </div>
        <div class="preview-image preview-show" style="margin: 0px 3.3px;">
            <div class="image-cancel" data-no="4">x</div>
            <div class="image-zone"><img id="pro-img-2" src="<c:url value='/resources/images/noImage.gif'/>"></div>
            <div class="tools-edit-image"><a href="javascript:void(0)" data-no="2" class="btn btn-light btn-edit-image">edit</a></div>
        </div>
        <div class="preview-image preview-show">
            <div class="image-cancel" data-no="5">x</div>
            <div class="image-zone"><img id="pro-img-2" src="<c:url value='/resources/images/noImage.gif'/>"></div>
            <div class="tools-edit-image"><a href="javascript:void(0)" data-no="2" class="btn btn-light btn-edit-image">edit</a></div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</body>
</html>