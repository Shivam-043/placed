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

export {registerStudent}