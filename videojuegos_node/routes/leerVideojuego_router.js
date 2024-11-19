import express from "express";
import { leerVideojuego } from "../controllers/CRUD/leerVideojuegoController.js";

const router_leer = express.Router();

router_leer.get("/leerVideojuego", leerVideojuego);

export default router_leer;
