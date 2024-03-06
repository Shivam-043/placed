import Student from "../models/placements/student.models.js";
import { ApiError } from "../utils/ApiError.js";
import { ApiResponse } from "../utils/ApiResponse.js";
import { asyncHandler } from "../utils/asyncHandler.js";

const registerStudent= asyncHandler(async (req,res)=>{
    const { name, email, mobile,photo } = req.body;
    if (
        [name, email, mobile,photo].some((field) => (!field || field?.trim() === ""))
    ) {
        console.log("\nrequired field not received !!!!");
        throw new ApiError(400, "All fields are required");
    }

    const existedUser = await Student.findOne({ email });

    if (existedUser) {
        throw new ApiError(409, "Email already in use");
    }

    const student = await Student.create({email,name,mobile,photo});
    res.status(201
        ).json(
            new ApiResponse(200,{user:student},"User created successfully")
        )  
})

const getStudentData = asyncHandler(async (req, res) => {
    const { email } = req.body;

    if (!email || email.trim() === "") {
        throw new ApiError(400, "Email parameter is required");
    }

    const student = await Student.findOne({ email });

    if (!student) {
        throw new ApiError(404, "Student not found");
    }

    res.status(200).json(new ApiResponse(200, { user: student }, "Student data retrieved successfully"));
});
export { registerStudent, getStudentData }