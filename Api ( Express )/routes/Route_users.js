const express = require("express");
const Authorition = require("../middlewares/Authorition");
const route = express.Router();

// Import Model
const { Users } = require("../models/users")

route.get("/GetAllUsers", async (req, res) => {
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
  // Sign in
  route.post("/add_user",async (req, res) => {
// console.log(req.body)
    email = req.body.email;
    password = req.body.password;
    const respones = await Users.findOne({email,password});

    if(!respones){
      try {
        Users.create(req.body);
        res.status(200).json({Status: "SusseccFuly"});
      } 
      catch (error) {
        res.status(400).json({massage: error});
      }
    }else{
      res.status(200).json({
        massage:"This users is defound",
      });
    }
  });
  
   //delect users
 route.delete("/delete/:ID", async(req,res)=>{
    const id = req.params.ID
    try{
      const respones = await Users.findById(id);
      if(respones){
        await Users.deleteOne({ _id:req.params.ID});
        res.status(200).json({"Status":"The Delete Successful"});
      }else{
        res.status(200).json({"massage":"this user is not defound"});
      }
        
  }catch(error){
   res.status(400).json({"massage":error});
  }
  });
  
   //   login
   route.post("/Login",Authorition);

  module.exports =  route ;
