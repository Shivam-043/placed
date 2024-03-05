import mongoose from "mongoose"
import { DB_NAME } from "../constants.js"

//DB connection
const connectDB = async () =>{
    try {
       const connetionInstance =  await mongoose.connect(`${process.env.MONGODB_URL}/${DB_NAME}`)
       console.log(`\n MONGODB connected !! HOST : ${connetionInstance.connection.host}`);

    } catch (error) {
        console.log("MONGODB connection error:",error );
        process.exit(1);
    }
}

export default connectDB