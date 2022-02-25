const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();

const listAuth = [
    {
        id: 1,
        username: "admin",
        password: "admin",
        email: "admin@gmail.com"
    },
    {
        id: 2,
        username: "user",
        password: "user",
        email: "user@gmail.com"
    }
]

; (async () => {
    await prisma.auth.deleteMany({
        where: {
            id: {
               not: 0
            }
        }
    });
    await prisma.auth.createMany({
        data: listAuth
    });

    console.log("seed berhasil")
})()
