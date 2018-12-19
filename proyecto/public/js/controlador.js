//uso de highlight
//$("sel-lan").change(function () {    
      
//});
///ontener usuario

////////

var myCode;
var myCode1;
var myCode2;
var idUsuario;
var idCarpeta;
var carpeta;

$(document).ready(function () {
    
    $.ajax({
     
        url: "/obtener",  
        method:"post",  
        
        dataType: "json",
        success: function (response) {
           $("#btn-obtener-sesion").prepend(response);
           console.log(response);
        }
    }); 
    

  //  $("#editor").hide();
  //  $("#sel-lan").change(function () {
    cargarCarpetas()
  //  });
  //$("#editor").val(lenguaje);
  //$("#editor").html("");


    htmlEditor("write your code here");
    cssEditor("write your code here");
    cssJavascript("write your code here");
});
//highlight
function htmlEditor(Contenido) {
 //   var myCode;
    var editor = ace.edit("editor");

    $("#editor").show();
  
    // var seleccionado=$("#sel-lan").val();
     ace.require("ace/ext/language_tools");
     ace.require("ace/ext/emmet");
     
    editor.setTheme("ace/theme/TextMate");
    editor.session.setMode("ace/mode/html");
    editor.getSession().setValue(Contenido);
    myCode=editor//.getValue();
    myCode.getSession().on('change',function () {  
        update();
    });

    
    
    editor.setOption("enableEmmet",true);
    editor.focus();

    //console.log(myCode);
    
    editor.setOptions({
        hasCssTransforms: true,
        enableBasicAutocompletion: true,
        enableSnippets: true,
        enableLiveAutocompletion: true
        
    });
};
function update() {
    var res=document.getElementById('frame').contentWindow.document;
    res.open();
    res.write(myCode.getValue());
    res.close();  
};

function cssEditor(Contenido){
 //   var myCode1;
    var editor1 = ace.edit("menu-css");
   // $("#menu-css").html("");
    $("#menu-css").show();
   
 // var seleccionado=$("#sel-lan").val();
  ace.require("ace/ext/language_tools");
  ace.require("ace/ext/emmet");
  
      editor1.setTheme("ace/theme/TextMate");
      editor1.session.setMode("ace/mode/css");
      editor1.getSession().setValue(Contenido);
      myCode1=editor1.getSession().getValue();
      editor1.setOption("enableEmmet",true);
      editor1.focus();
      
      editor1.setOptions({
          enableBasicAutocompletion: true,
          enableSnippets: true,
          enableLiveAutocompletion: true
      });
};

function cssJavascript(contenido){
//    var myCode2;
    var editor2 = ace.edit("menu-javascript");

    $("#menu-javascript").show();
   // $("#menu-javascript").html("");
 
 // var seleccionado=$("#sel-lan").val();
  ace.require("ace/ext/language_tools");
  ace.require("ace/ext/emmet");
  
      editor2.setTheme("ace/theme/TextMate");
      editor2.session.setMode("ace/mode/javascript");
      editor2.getSession().setValue(contenido);
      myCode2=editor2.getSession().getValue();
      editor2.setOption("enableEmmet",true);
      editor2.focus();
      
      editor2.setOptions({
          enableBasicAutocompletion: true,
          enableSnippets: true,
          enableLiveAutocompletion: true
      });
};


//obtener carpetas o proyectos
function cargarCarpetas() {
    $.ajax({
        url:"/cargar-carpetas",
        method:"post",
        dataType:"json",
        success: function(response){
        console.log(response);
        $("#carpetas").html("");
        for (var i=0;i<response.length;i++){
            idUsuario=response[i].Tbl_Usuarios_id_Tbl_Usuarios;
            idCarpeta=response[i].id_Tbl_carpeta;
            $("#carpetas").append(
                ` 
                <div class="col-lg-3 col-md-4 col-sm-12 mb-3" >
                    <a ><i class="fa fa-folder-o fa-2x" aria-hidden="true" color="red" onclick="seleccionarCarpeta(${response[i].Tbl_Usuarios_id_Tbl_Usuarios},${response[i].id_Tbl_carpeta})">${response[i].nombre}</i></a>  
                    <a ><i class="fa fa-trash-o fa-2x" aria-hidden="true" onclick="eliminarCarpeta(${response[i].Tbl_Usuarios_id_Tbl_Usuarios},${response[i].id_Tbl_carpeta})"></i></a>                                                                
                </div>
               
                `
            )
        }
        },
        error:function(error){
            console.error(error);
        }
    });
};

//eliminar carpeta
function eliminarCarpeta(codigoUsuario,codigoCarpeta) {
    $.ajax({
        
        url: "/eliminar-carpeta",
        data: "idCarpeta="+codigoCarpeta,
        method:"post",
        dataType: "json",
        success: function (response) {
            console.log(response);
            //seleccionarCarpeta(codigoUsuario,codigoCarpeta);
            cargarCarpetas();
        }
    });
};

//seleccionar carpetas
function seleccionarCarpeta(codigoUsuario,codigoCarpeta) {
    console.log(codigoUsuario);
    console.log(codigoCarpeta);
    carpeta=codigoCarpeta;
    seleccionarArchivos(carpeta);
};

function seleccionarArchivos(codigoCarpeta) {
    

    $.ajax({
        
        url: "/seleccionar-archivos",
        method:"post",
        data: "idCarpeta="+codigoCarpeta,
        dataType: "json",
        success: function (response) {
            console.log(response);
            //esto es si la carpeta q esta seleccionada no tiene ningun
            //archivo
            if (response.length==0) {
                htmlEditor(""); 
                cssEditor( "");
                cssJavascript("");
            } else {
                //aqui se pone lo q se guarda en la bd segun el lenguaje
                //que se esta usando
                for(var i=0; i<response.length; i++){
                    if (response[i].tipo_lenguaje=="html") {
                        //$("#editor").html("");
                        htmlEditor(response[i].Contenido);               
                    
                                    
                    } ;
                    if(response[i].tipo_lenguaje=="css") {
                        //$("#menu-css").html("");
                        cssEditor( response[i].Contenido);
                    };
                    
                    if(response[i].tipo_lenguaje=="js"){
                        //$("#menu-javascript").html("");
                        cssJavascript(response[i].Contenido);
                    }
                    
                }
            }

               
        }
        
    });
    //cargarCarpetas();
};

$("#crear-carpeta").click(function () {
    $.ajax({
       
        url: "/crear-carpeta",
        method:"post",
        data: "nombreProyecto="+$("#txt-nombre-carpeta").val(),
        dataType: "json",
        success: function (response) {
            console.log(response);
            cargarCarpetas();
        }
    }); 

    
    
});


$("#btn-archivo").click(function () { 
    //aqui agregar un valro en una varible, representando el tipo de lenguaje
    //o enviar como parametro el tipo

   // var archivo={
   //     nombre:$("#txt-nombre").val(),
   //     mensaje:editor.getSession().getValue()
    
    //console.log(archivo);
    valorHtml();
    valorCss();
    valorJs();
    console.log(myCode,myCode1,myCode2);
    //console.log($("#editor").val());

    
    $.ajax({
       
        url: "/guardar-archivo",
        method:"post",
        //data: "contenidoHtml="+myCode+"&contenidoCss="+myCode1+"&contenidoJs="+myCode2+"&carpeta="+carpeta,
        data:`contenidoHtml=${myCode}&contenidoCss=${myCode1}&contenidoJs=${myCode2}&carpeta=${carpeta}`,
        dataType: "json",
        success: function (response) {
            if (response.affectedRows>=1){
                console.log(response);
                //seleccionarCarpeta(idUsuario,idCarpeta);
                //seleccionarArchivos(idCarpeta);
                //cargarCarpetas();
                
				alert("todo bien");
			}
        },
        error:function(error){
            console.error(error);
        }
    });
    
});

function valorHtml() {
    var editor = ace.edit("editor");
    

  
    // var seleccionado=$("#sel-lan").val();
     ace.require("ace/ext/language_tools");
     ace.require("ace/ext/emmet");
     
    //editor.setTheme("ace/theme/TextMate");
    editor.session.setMode("ace/mode/html");
    //editor.getSession().setValue(Contenido);
    myCode=editor.getSession()//.getValue();
    update();
   // editor.getSession().on('change', function() {
   //     myCode=editor.getValue();
   //     var res=document.getElementById('frame-result').contentDocument.document;
   //     res.open();
   //    res.write(myCode);
   //    res.close();
   //  });

    
    
   
};
function valorCss() {
    var editor1 = ace.edit("menu-css");

        //   $("#menu-javascript").show();
    // $("#menu-javascript").html("");
    
    // var seleccionado=$("#sel-lan").val();
    ace.require("ace/ext/language_tools");
    ace.require("ace/ext/emmet");
    
        //editor2.setTheme("ace/theme/TextMate");
        editor1.session.setMode("ace/mode/css");
        // editor2.getSession().setValue();
        myCode1=(editor1.getSession().getValue());
};
function valorJs() {
    var editor2 = ace.edit("menu-javascript");

        //   $("#menu-javascript").show();
    // $("#menu-javascript").html("");
    
    // var seleccionado=$("#sel-lan").val();
    ace.require("ace/ext/language_tools");
    ace.require("ace/ext/emmet");
    
        //editor2.setTheme("ace/theme/TextMate");
        editor2.session.setMode("ace/mode/javascript");
        // editor2.getSession().setValue();
        myCode2=(editor2.getSession().getValue());
};


//$("btn-obtener-sesion").click(function () { 
  //  $.ajax({
        
    //    url: "/obtener-sesion",
      //  method:"post",
        //data: "data",
        //dataType: "dataType",
        //success: function (response) {
            
       // }
    //});
    
//});






    //function showHTML() {
    //    $('#return').html(editor.getValue());
   // }
    // or use data: url to handle things like doctype
    //function showHTMLInIFrame() {
    //    $('#return').html("<iframe src=" +
     //        "data:text/html," + encodeURIComponent(editor.getValue()) +
       // "></iframe>");
    //}
    //editor.on("input", showHTMLInIFrame)