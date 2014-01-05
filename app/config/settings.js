var settings = {
    port       : process.env.NODE_PORT || 3000,
    database   : {
        protocol : "mysql", // or "postgresql"
        query    : { pool: true },
        host     : "127.0.0.1",
        database : "dating_with_node",
        user     : "root",
        password : ""
    }
};

module.exports = settings;