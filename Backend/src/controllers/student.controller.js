import Student from "../models/placements/student.models.js";
import { ApiError } from "../utils/ApiError.js";
import { ApiResponse } from "../utils/ApiResponse.js";
import { asyncHandler } from "../utils/asyncHandler.js";

const registerStudent= asyncHandler(async (req,res)=>{
    const { name, email, mobileNumber,photo } = req.body;
    if (
        [name, email].some((field) => (!field || field?.trim() === ""))
    ) {
        console.log("\nrequired field not received !!!!");
        throw new ApiError(400, "All fields are required");
    }

    const existedUser = await Student.findOne({ email });
    console.log("existted user : ",existedUser);
    if (existedUser) {
        // throw new ApiError(409, "Email already in use");
        return res.status(201
        ).json(
        new ApiResponse(200, { user: existedUser }, "User already exist")
        )
    }

    const student = await Student.create({ email, name, mobileNumber,photo});
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
const updateStudent = asyncHandler(async (req, res) => {
    const { email } = req.body;
    // const { name, mobile, photo } = req.body;

    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!email || !emailRegex.test(email.trim())) {
        throw new ApiError(400, "Invalid or missing email address");
    }

    const existingStudent = await Student.findOne({ email });

    if (!existingStudent) {
        throw new ApiError(404, "Student not found");
    }

    // Update the fields if provided
    if (req.body.name) {
        existingStudent.name = req.body.name;
    }
    if (req.body.branch) {
        existingStudent.branch = req.body.branch;
    }
    if (req.body.passingYear) {
        existingStudent.passingYear = req.body.passingYear;
    }
    if (req.body.rollNumber) {
        existingStudent.rollNumber = req.body.rollNumber;
    }
    if (req.body.section) {
        existingStudent.section = req.body.section;
    }
    if (req.body.subsection) {
        existingStudent.subsection = req.body.subsection;
    }
    if (req.body.resume) {
        existingStudent.resume = req.body.resume;
    }
    if (req.body.skills) {
        existingStudent.skills = req.body.skills;
    }
    if (req.body.mobileNumber) {
        existingStudent.mobileNumber = req.body.mobileNumber;
    }
    if (req.body.address) {
        existingStudent.address = req.body.address;
    }
    if (req.body.dob) {
        existingStudent.dob = req.body.dob;
    }
    if (req.body.photo) {
        existingStudent.photo = req.body.photo;
    }

    // Save the updated student data
    const updatedStudent = await existingStudent.save();

    res.status(200).json(new ApiResponse(200, { user: updatedStudent }, "Student data updated successfully"));
});

const updateCGPA = asyncHandler(async (req, res) => {
    const { section, subsection, rollNumber } = req.params;

    // Find the student by section, subsection, and rollNumber
    const existingStudent = await Student.findOne({ section, subsection, rollNumber });

    // Check if the student exists
    if (!existingStudent) {
        throw new ApiError(404, "Student not found");
    }

    // Update the CGPA if provided in the request body
    if (req.body.currentCgpa) {
        existingStudent.currentCgpa = req.body.currentCgpa;
    }

    // Save the updated student data
    const updatedStudent = await existingStudent.save();

    res.status(200).json(new ApiResponse(200, { user: updatedStudent }, "CGPA updated successfully"));
});

export { registerStudent, getStudentData,updateStudent,updateCGPA }