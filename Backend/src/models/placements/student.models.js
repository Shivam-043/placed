import { Schema, model } from "mongoose";

const studentSchema = new Schema({
    // userId: {
    //     type: String,
    //     unique: true,
    //     index: true
    // },
    name: {
        type: String,
        required: true,
        trim: true,
    },
    email: {
        type: String,
        required: true,
        unique: true,
        trim: true,
        lowercase: true,
    },
    branch: {
        type: String,
        trim: true,
    },
    passingYear: {
        type: Number,
    },
    rollNumber: {
        type: String,
        trim: true,
    },
    section: {
        type: String,
        trim: true,
    },
    subsection: {
        type: String,
        trim: true,
    },
    resume: {
        type: String,
        trim: true,
    },
    currentCgpa: {
        type: Number,
    },
    skills: {
        type: [],
        trim: true,
    },
    mobileNumber: {
        type: String,
        trim: true,
    },
    address: {
        type: String,
        trim: true,
    },
    dob:{
        type: String,
        trim:true,
    },
    photo:{
        type : String,
        trim:true,
    },
    onCampusStatus: {
        type: String,
        trim: true,
        default: "Unplaced",
    },
    offCampusStatus: {
        type: String,
        trim: true,
        default: "Unplaced",
    },
});

const Student = model("Student", studentSchema);

export default Student;
