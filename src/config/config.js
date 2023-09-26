/**
 * Import de Sequelize para instanciar la clase
 * @const {class}
 */
const { Sequelize } = require('sequelize');

/**
 * Import de dotenv para incluir las variables de entorno, para la conexión con la base de datos
 * @const 
 */
const dotenv = require('dotenv');

/**
 * Import de la libreria path para obtener funciones de resolución de directorios
 * @const 
 */
const path = require('path');

/**
 * Path en donde se encuentra el .env
 * @const {string} 
 */
const envPath = path.resolve(__dirname, '.env');
dotenv.config({ path: envPath });

/**
 * Instancia de Sequelize conectada a la base de datos MySQL.
 *
 * @type {Sequelize}
 *
 * @param {string} DB_SCHEMA El nombre del schema de trabajo de MySQL con el que nos queremos conectar
 * @param {string} DB_USER El nombre de nuestro usuario en MySQL para acceder al schema
 * @param {string} DB_PASSWORD La contraseña de nuestro usuario en MySQL al schema
 * @param {string} DB_HOST El nombre de host para conectarnos a MySQL (En local, utilizamos 'localhost')
 * 
 * @example Ejemplo de uso de este módulo
 *
 * const trailer = await sequelize.define('Trailer', {
 *     titulo: {
 *         type: DataTypes.STRING(100),
 *         allowNull: false
 *     },
 *     link: {
 *         type: DataTypes.STRING(120),
 *         allowNull: true,
 *         defaultValue: null
 *     }
 * });
 */
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