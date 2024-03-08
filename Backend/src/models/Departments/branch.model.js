import { Schema, model } from "mongoose";

const branchSchema= new Schema ({
    name : { type: String , required: true,unique:true }, 
    shortName:{
        type:String,
    },
    sections :[String],
    subSections :[String],
})

const  Branch = model("Branch",branchSchema);
export default Branch;