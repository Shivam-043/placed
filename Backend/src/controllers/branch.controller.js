import Branch from "../models/Departments/branch.model.js";
import { ApiError } from "../utils/ApiError.js";
import { ApiResponse } from "../utils/ApiResponse.js";
import { asyncHandler } from "../utils/asyncHandler.js";

const createBranch = asyncHandler(async (req, res) => {
    const { name, shortName, sections, subSections } = req.body;

    if (!name || name.trim() === "") {
        throw new ApiError(400, "Branch name is required");
    }

    const existingBranch = await Branch.findOne({ name });

    if (existingBranch) {
        return res.status(200).json(new ApiResponse(200, { branch: existingBranch }, "Branch already exists"));
    }

    const branch = await Branch.create({ name, shortName, sections, subSections });
    res.status(201).json(new ApiResponse(201, { branch }, "Branch created successfully"));
});

const getBranchData = asyncHandler(async (req, res) => {
    const { name } = req.params;

    if (!name || name.trim() === "") {
        throw new ApiError(400, "Branch name parameter is required");
    }

    const branch = await Branch.findOne({ name });

    if (!branch) {
        throw new ApiError(404, "Branch not found");
    }

    res.status(200).json(new ApiResponse(200, { branch }, "Branch data retrieved successfully"));
});

const updateBranch = asyncHandler(async (req, res) => {
    const { name } = req.body;

    if (!name || name.trim() === "") {
        throw new ApiError(400, "Branch name parameter is required");
    }

    const existingBranch = await Branch.findOne({ name });

    if (!existingBranch) {
        throw new ApiError(404, "Branch not found");
    }

    // Update the fields if provided
    if (req.body.shortName) {
        existingBranch.shortName = req.body.shortName;
    }
    if (req.body.sections) {
        existingBranch.sections = req.body.sections;
    }
    if (req.body.subSections) {
        existingBranch.subSections = req.body.subSections;
    }

    // Save the updated branch data
    const updatedBranch = await existingBranch.save();

    res.status(200).json(new ApiResponse(200, { branch: updatedBranch }, "Branch data updated successfully"));
});

const getAllBranches = asyncHandler(async (req, res) => {
    const branches = await Branch.find();

    if (!branches || branches.length === 0) {
        throw new ApiError(404, "No branches found");
    }

    res.status(200).json(new ApiResponse(200, { branches }, "All branches retrieved successfully"));
});

export { createBranch, getBranchData, updateBranch, getAllBranches };
