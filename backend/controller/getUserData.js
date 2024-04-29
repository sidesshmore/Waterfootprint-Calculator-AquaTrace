const {PrismaClient}=require('@prisma/client')
const prisma=new PrismaClient()

const getUserData=async(req,res)=>{
    try {
        const uid=req.params.uid
        if(typeof(uid)===undefined){
            return res.status(400).json({success:false,message:'Enter a appropriate id'})
        }
        const result=await prisma.userdata.findMany({
            where:{
                uid:{
                    equals:uid 
                }
    
            }
        })

        const total=await prisma.userdata.aggregate({
            where:{
                uid:uid
            },
            _sum:{
                waterfootprint:true
            }
        })
        
        return res.status(200).json({success:true,result,"total":total._sum.waterfootprint})
    } catch (error) {
        console.log(error);
        return res.status(400).json({success:false,message:error})
    }
}

module.exports=getUserData