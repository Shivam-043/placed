import { Schema, model } from "mongoose";

const opportunitySchema = new Schema({
    companyName: {
        type: String,
        required: true,
    },
    type: {
        type: String,
        enum: ['Internship', 'Placement'],
        required: true,
    },
    eventDateTime: {
        type: Date,
        required: true,
    },
    requirements: {
        type: String,
        required: true,
    },
    role: {
        type: String,
        required: true,
    },
    eligibleBranches: {
        type: [String], // Array of eligible branches
        required: true,
    },
    documents: {
        type: String,
        required: true,
    },
    salaryRange: {
        type: String,
        required: true,
    },
    offerId: {
        type: String,
        required: true,
        unique: true,
    },
    numberOfOA: {
        type: Number,
        default: 0,
    },
    numberOfInterviews: {
        type: Number,
        default: 0,
    },
});

const Opportunity = model("Opportunity", opportunitySchema);

export default Opportunity;
