// import = requires

import express from "express";
import inicio from "./routes/inicio_router.js";
import router_Login from "./routes/login_router.js";
import router_Registro from "./routes/registro_router.js";
import router_Cards from './routes/cards_router.js';
import router_Review from './routes/review_router.js'

import session from "express-session";

// Registro Usuario

import db from "./config/db.js";

// CONFIGURACIONES PAGINA

// Crear la aplicacion
const app = express();



//leer formulario
app.use(express.urlencoded({ extended: true }));

try {
  await db.authenticate();
  db.sync();
  console.log("Conexion exitosa a la base de datos");
} catch (error) {
  console.log(error);
}



// Accesos a los datos del formulario
// Traer datos del formulario

// Renderizar las paginas
// pug -> estilo
// Motor de plantillas
app.set("view engine", "pug");
app.set("views", "./views");

// carpeta publica (Acceso de Usuario)
app.use(express.static("public"));




// Variables de Sesion

app.use(session({
    // Clave
    secret:"secret",
    // Guardar sesiones
    resave: true, 

    saveUninitialized:true
}))

// routing -> Ruta por default
app.use("/", inicio);
app.use("/formulario", router_Login)
app.use("/formulario", router_Registro)


// definiendo el puerto -> Puerto de comunicion
// Se le puede dar >=1024
const port = 2800;
app.listen(port, () => {
  console.log("Esperando peticiones en");
});


// // Accesos a los datos del formulario
// app.use(express.urlencoded({ extended: true }));
