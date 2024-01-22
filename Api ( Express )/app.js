const express = require("express");
const mongoose = require("mongoose");
const cors = require("cors");cors


const schema = mongoose.Schema;
app = express();

app.use(cors());
// رمز التجربة لتمكين CORS لجميع المسارات
app.options('*', cors());

app.use(
  express.urlencoded({
    extended: true,
  })
);
app.use(express.json());

// Connect In Mongodb and server
const PORT = 5000;
const name_DB = "Hotel";
const server = "localhost:27017";
mongoose
  .connect("mongodb://" + server + "/" + name_DB)
  .then(() => {
    console.log("Connected to MongoDB");
    app.listen(PORT, () => {
      console.log("Start Server in Port :\t" + PORT);
    });
  })
  .catch((error) => {
    console.error("====================================");
    console.error("Error connecting to MongoDB:", error);
    console.error("====================================");
  });

/********************************* Tables **********************************/

const schema_hotel = new schema({
  name: {
    type: String,
    require: true,
  },
  img: {
    type: String,
    require: true,
  },
  img1: {
    type: String,
    require: true,
  },
  img2: {
    type: String,
    require: true,
  },
  img3: {
    type: String,
    require: true,
  },
  img4: {
    type: String,
    require: true,
  },
  price: {
    type: Number,
    require: true,
  },
  start: {
    type: Number,
    require: true,
  },
  counter_start: {
    type: Number,
    require: true,
  },
  dec: {
    type: String,
    require: true,
  },
},{timestamps:true}

);
const hotel = mongoose.model("hotel", schema_hotel);

const schema_user = new schema({
  name: {
    type: String,
    require: true,
  },
  email: {
    type: String,
    require: true,
  },
  password: {
    type: String,
    require: true,
  },
},{timestamps:true});
const Users = mongoose.model("Users", schema_user);

/********************************* Function **********************************/
app.get("/GetAllUsers", async (req, res) => {
  try {
    let data = await Users.find();
    return res.status(200).json({
      status: "Successful",
      data: data,
    });
  } catch (E) {
    return res.status(404).json({
      status: "failed",
      Massage: E,
    });
  }
});
//   login
app.post("/Login", async (req, res) => {
  console.log(req.body)
  try {
    email = req.body.email;
    password = req.body.password;
    const respones = await Users.findOne({
      email,
      password,
    });
    console.log(respones);
    if (respones != null) {
      res.status(200).json({
        status: "true",
      });
    } else {
      res.status(200).json({
        status: "false",
      });
    }
  } catch (error) {
    res.status(400).json({
      massage: error,
    });
  }
});

// Sign in
app.post("/add_user", (req, res) => {

  // console.log(req.body)
  try {
    Users.create(req.body);

    res.status(200).json({
      Status: "true",
    });
  } catch (error) {
    res.status(400).json({
      massage: error,
    });
  }
});

// Add New Hotel
app.post("/add_Hotel", (req, res) => {
  // console.log(req.body)
  try {
    hotel.create(req.body);
    res.status(200).json({
      Status: "true",
    });
  } catch (error) {
    res.status(400).json({
      massage: error,
    });
  }
});

app.get("/get_data_all_hotel", async (req, res) => {
  try {
    let data = await hotel.find();
    return res.status(200).json({
      Status: "true",
      data: data,
    });
  } catch (e) {
    res.status(400).json({
      massage: error,
    });
  }
});


 //delect users
 app.delete("/delete/:ID", async(req,res)=>{
  // console.log(req.params.ID)
  try{
       await Users.deleteOne({ _id:req.params.ID});
       res.status(200).json({"Status":"The Delete Successful"});
}catch(error){
 res.status(400).json({"massage":error});
}
});

//delect Hotel
 app.delete("/delete_Hotel/:ID", async(req,res)=>{
  // console.log(req.params.ID)
  try{
       await hotel.deleteOne({ _id:req.params.ID});
       res.status(200).json({"Status":"The Delete Successful"});
}catch(error){
 res.status(400).json({"massage":error});
}
});

  // Updata hotel
  app.put("/put/:ID", async(req,res)=>{
    // console.log(req.body)
   try{
    await hotel.updateOne({ _id:req.params.ID},req.body);
    res.status(200).json({"Status":"The Updata Successful"});
   }
   catch(error){
    res.status(400).json({"massage":error});
   }
 });

