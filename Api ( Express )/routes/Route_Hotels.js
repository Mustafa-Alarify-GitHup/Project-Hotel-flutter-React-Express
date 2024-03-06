const express = require("express");
const route = express.Router();

// Import Model
const { hotel } = require("../models/hotels")
  
// Add New Hotel
route.post("/add_Hotel", (req, res) => {
    try {
      hotel.create(req.body);
      res.status(200).json({
        Status: "created true",
      });
    } catch (error) {
      res.status(400).json({
        massage: error,
      });
    }
  });
  // Get all Hotels
  route.get("/get_data_all_hotel", async (req, res) => {
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

  
  //delect Hotel
   route.delete("/delete_Hotel/:ID", async(req,res)=>{
    // console.log(req.params.ID)
    try{
         await hotel.deleteOne({ _id:req.params.ID});
         res.status(200).json({"Status":"The Delete Successful"});
  }catch(error){
   res.status(400).json({"massage":error});
  }
  });
  
    // Updata hotel
    route.put("/put/:ID", async(req,res)=>{
      // console.log(req.body)
     try{
      await hotel.updateOne({ _id:req.params.ID},req.body);
      res.status(200).json({"Status":"The Updata Successful"});
     }
     catch(error){
      res.status(400).json({"massage":error});
     }
   });
  

module.exports =  route ;
