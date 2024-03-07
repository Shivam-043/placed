import { Router } from "express";
import { createBranch, getAllBranches, getBranchData, updateBranch } from "../controllers/branch.controller.js";

const router =Router();

router.route("/create").post(createBranch);
router.route("/get").post(getBranchData);
router.route("/update").post(updateBranch);
router.route("/readall").post(getAllBranches);

export default router;