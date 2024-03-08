import { Router } from "express";
import { getStudentData, registerStudent, updateCGPA, updateStudent } from "../controllers/student.controller.js";


const router = Router();

router.route ("/register").post(registerStudent);
router.route ("/getstudent").post(getStudentData);
router.route ("/update").post(updateStudent);
router.route ("/updateCGPA").post(updateCGPA);
router.route("/*").all((req, res) => {
      res.status(404).
     send({ url: req.originalUrl + ' not found' });
        });


export  default router; 