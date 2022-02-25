const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();

;(async() => {
    console.log("coba menerapkan seed")
    try {
        let auth = await prisma.$executeRaw`drop table if exists Auth ; create table Auth ( id int primary key auto_increment, name varchar(255), email varchar(255) password varchar(255), role varchar(255), created_at timestamp default current_timestamp, updated_at timestamp default current_timestamp on update current_timestamp )`;
        console.log(auth)
        
    } catch (error) {
        console.log(error);
    }
})()