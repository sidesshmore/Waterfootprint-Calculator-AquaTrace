const {PrismaClient}=require('@prisma/client')
const prisma=new PrismaClient()

const searchFood=async(req,res)=>{
    try {
        const {foodItem}=req.body;
        const result=await prisma.food.findMany(
            {
                where:{
                    fooditems:{
                        search:foodItem
                    }
                }
            }
        )
        return res.status(200).json({success:true,result})
    } catch (error) {
        console.log(error);
        return res.status(400).json({success:false,message:"Internal Server Error"})
    }
}

module.exports=searchFood;