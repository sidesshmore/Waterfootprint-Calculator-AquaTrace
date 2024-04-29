const {PrismaClient}=require('@prisma/client');
const removexp = require('../utils/removexp');
const xpreduction = require('./xpreduction');
const prisma=new PrismaClient()

const removeData=async(req,res)=>{
    try {
        const id=req.params.id;
        const exist=await prisma.userdata.findFirst({
            where:{
                id:parseInt(id)
            }
        })
        if(!exist){
            return res.status(404).json({success:false})
        }
        else{
            await xpreduction(id)
            const result=await prisma.userdata.delete({
                where:(
                    {
                        id:parseInt(id)
                    }
                )
            })
            return res.status(200).json({success:true})
        }
        
    } catch (error) {
        console.log(error);
        return res.status(400).json({success:false,message:error})
    }
}

module.exports=removeData;