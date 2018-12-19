//Servidor web en nodeJS para publicar archivos estaticos.
var express = require("express");
var session = require("express-session");
var bodyParser = require("body-parser");
var mysql = require("mysql");
var passport = require('passport')
  , FacebookStrategy = require('passport-facebook').Strategy;
var app = express();

//var varSesion;

var credenciales ={
    user:"root",
    password:"password",
    database:"proyecto",
    host:"localhost",
    port:"3306"  
};

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true })); // support encoded bodies
  
//Exponer una carpeta como publica, unicamente para archivos estaticos: .html, imagenes, .css, .js
app.use(express.static("public"));
//variable de sesion
app.use(session({secret:"ASDFE$%#%",resave:true, saveUninitialized:true}));

var dash = express.static("dashboard");
app.use(
    function(peticion,respuesta,next){
        if (peticion.session.correo) {
            dash(peticion,respuesta,next);
        }
        else
            return next();
    }
);

app.post("/login",function(peticion,respuesta){
    var conexion=mysql.createConnection(credenciales);
    var sql= "select id_Tbl_Usuarios, nombre, Email from tbl_usuarios where Email=? and contrasenia=?";
    conexion.query(sql,[peticion.body.correo,peticion.body.contrasena],
    function(err,data,fields){
        if (data.length>0) {
            peticion.session.correo=data[0].Email;
            peticion.session.codigoUsuario=data[0].id_Tbl_Usuarios;
            data[0].estatus=0;
            respuesta.send(data[0]);
            varSesion=peticion.session.correo;
        }
        else{
            respuesta.send({estatus:1,mensale:"login fallido"});
        }
        
    });
});

app.post("/registro", function(peticion,respuesta){
    var conexion=mysql.createConnection(credenciales);
    var sql="insert into tbl_usuarios(nombre, apellido, Email, fecha_nacimiento,contrasenia, Tbl_PlanesDePago_id_Tbl_PlanesDePago) values(?,?,?,?,?,?)";
    conexion.query(sql,[peticion.body.nombre, peticion.body.apellido, peticion.body.email, peticion.body.fecha, peticion.body.password, peticion.body.plan],
    function(err,result){
        if(err) throw err;
        respuesta.send(result);
    }
    );
});
//aqui se haria in sp donde se agrega los valores del archivo a crear y se jalaria la variable de sesion del codigo usuario para agregarlo dentro del mismo proceso
//crear carpetas
app.post("/crear-carpeta",function(peticion,respuesta){
    var conexion=mysql.createConnection(credenciales);
    var sql="call sp_carpeta_guardar(?,?)";
    conexion.query(sql,[peticion.body.nombreProyecto,peticion.session.codigoUsuario],
        function(err,result){
            if(err) throw err;
            console.log(result);
            respuesta.send(result);
    });
});



//cargar carpetas
app.post("/cargar-carpetas",function (peticion,respuesta) {
    var conexion=mysql.createConnection(credenciales);
    conexion.query(
        `select b.Tbl_Usuarios_id_Tbl_Usuarios,c.id_Tbl_carpeta,c.nombre from tbl_usuarios_has_tbl_carpeta b
        inner join tbl_carpeta c
        on(b.Tbl_carpeta_id_Tbl_carpeta=c.id_Tbl_carpeta)
        where Tbl_Usuarios_id_Tbl_Usuarios=${peticion.session.codigoUsuario};`,
        [],
        function(error,data,fields){
            respuesta.send(data);
            respuesta.end();
        }
    );
});
app.post("/seleccionar-archivos",function(peticion,respuesta){
    var conexion=mysql.createConnection(credenciales);
    var sql=`select a.id_Tbl_Usuarios,c.id_Tbl_carpeta,c.nombre as nombre_carpeta,e.id_Tbl_Archivos,e.nombre as nombre_archivo,e.Contenido,e.tipo_lenguaje
    from tbl_usuarios a
    inner join tbl_usuarios_has_tbl_carpeta b
    on(a.id_Tbl_Usuarios=b.Tbl_Usuarios_id_Tbl_Usuarios)
    inner join tbl_carpeta c
    on(b.Tbl_carpeta_id_Tbl_carpeta=c.id_Tbl_carpeta)
    inner join tbl_carpeta_has_tbl_archivos d
    on(c.id_Tbl_carpeta=d.Tbl_carpeta_id_Tbl_carpeta)
    inner join tbl_archivos e
    on(d.Tbl_Archivos_id_Tbl_Archivos=e.id_Tbl_Archivos)
    where a.id_Tbl_Usuarios=? and c.id_Tbl_carpeta=?
    ;`;
    conexion.query(sql,
        [peticion.session.codigoUsuario,peticion.body.idCarpeta],
        function(error,data,fields){
            respuesta.send(data);
            respuesta.end();
        }
    );
});


//tiene q haber un apartado donde deja ver las carpetas de cada usuario, una vez seleccionad la carpeta, guradar ahi el archivo
//obtener el id de la carpeta seleeccoinada para poder filtrar
//al momento de crear el front las carpetas tengo q dejarlas tipo boton o algo asi para q cuando se seleccione obtenga el valor del id de cada una de ella
app.post("/guardar-archivo", function(peticion, respuesta){
    var conexion=mysql.createConnection(credenciales);
    var sql="call sp_guardar_archivos(?,?,?,?);";
    //console.log(peticion.body.contenidoHtml);
    conexion.query(sql,
        [peticion.body.contenidoHtml,peticion.body.contenidoCss,peticion.body.contenidoJs,peticion.body.carpeta],
    function(err, result){
        if(err) throw err;
        respuesta.send(result);
        //console.log(result);
    }  
    )
});

//eliminar carpeta o proyevto
app.post("/eliminar-carpeta",function(peticion,respuesta){
    var conexion=mysql.createConnection(credenciales);
    var sql="call sp_eliminar_carpeta(?);";
    conexion.query(sql,[peticion.body.idCarpeta],
        function(err, result){
            if(err) throw err;
            respuesta.send(result);
            //console.log(result);
        }  
        )
});

app.post("/obtener",function(peticion,respuesta){
    respuesta.send(peticion.session.correo); 
   // console.log(respuesta.send(varSesion));
    //console.log(respuesta.send(peticion.session.correo));
});

app.get("/logout",function(peticion, respuesta){
    peticion.session.destroy();
    respuesta.redirect("index.html");
	//respuesta.send("Sesion eliminada");
});

//////////////////////////////////////login fais
// app.use(passport.initialize());
// app.use(passport.session());

// passport.use(new FacebookStrategy({
//     clientID: '2168531836740582',
//     clientSecret: '694fee775e2c5ca85ffc8391b67cafa1',
//     callbackURL: '/auth/facebook/callback'
// },
// function(accesToken, refreshToken,profile, done){
//     //profile todos los datos q pueden venir de facebook
//     console.log(profile);
//     done(null,profile);
// }
// ));
// app.get('/auth/facebook/',passport.authenticate('facebook'));
// app.get('/auth/facebook/callback/',passport.authenticate('facebook',
//                                     {successRedirect:'/',
//                                      failureRedirect:'/login'   }));

///////////////////////////////////////////

//Crear y levantar el servidor web.
app.listen(3000);
console.log("Servidor iniciado");
////////////////////////////////////////
//require('./passport/indexPassport');
//require('./passport/facebook');