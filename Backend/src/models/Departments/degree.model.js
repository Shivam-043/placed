const degreeSchema = new Schema({
    name: { type: String, required: true },
    branches: [{ type: Schema.Types.ObjectId, ref: "Branch" }],
});

const Degree = model("Degree", degreeSchema);

export { Degree };