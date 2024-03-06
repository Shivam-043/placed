import { Router } from "express";
import { getStudentData, registerStudent } from "../controllers/student.controller.js";


const router = Router();

router.route ("/register").post(registerStudent);
router.route ("/getstudent").post(getStudentData);

export  default router; 