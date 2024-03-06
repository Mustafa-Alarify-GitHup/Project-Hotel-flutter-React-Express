/**
 * @res  Admin Or User
 */
const { Users } = require("../models/users");

const Authorition = async (req, res, next) => {
    try {
        email = req.body.email;
        password = req.body.password;
        const respones = await Users.findOne({
            email,
            password
        });
        if (respones) {
            if (respones.isAdmin) {
                res.status(200).json({
                    "status":"true",
                    "type": `${respones.name} is Admin`
                })
            } else {
                res.status(200).json({
                    "status":"fales",
                    "type": `${respones.name} is User`
                })

            }
        } else {
            res.status(200).json({
                "status": `This Accont is not defound`
            })
        }


    } catch (error) {
        res.status(400).json({
            massage: error,
        });
    }
    next();
}


module.exports = Authorition;