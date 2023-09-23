const { Sequelize } = require('sequelize');
const dotenv = require('dotenv');
const path = require('path');
const envPath = path.resolve(__dirname, '.env');
dotenv.config({ path: envPath });

const sequelize = new Sequelize(
    process.env.DB_SCHEMA,
    process.env.DB_USER,
    process.env.DB_PASSWORD, {
    host: process.env.DB_HOST,
    dialect: 'mysql',
    charset: 'utf8mb4',
    pool: {
        max: 5,
        min: 0,
        acquire: 30000,
        idle: 10000
    }
});

module.exports = sequelize;