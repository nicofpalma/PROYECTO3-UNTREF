/**
 * Módulo del modelo de Sequelize para representar un trailer según lo definido en la base de datos.
 * @module trailer
 */

/**
 * Tipos de datos que soporta sequelize.
 * @const {object}
 */
const { DataTypes } = require('sequelize');

/**
 * Import del archivo de configuracion para sequelize (config.js).
 * @const {object}
 */
const sequelize = require('../config/config');

/**
 * Modelo de Sequelize para representar un trailer.
 *
 * @type {Trailer}
 */
const Trailer = sequelize.define('Trailer', {
    /**
     * Identificador único del trailer.
     */
    idTrailer: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        unique: true,
        allowNull: false
    },
    /**
     * Título del trailer.
     */
    titulo: {
        type: DataTypes.STRING(100),
        allowNull: false,
    },
    /**
     * Enlace al trailer.
     */
    link: {
        type: DataTypes.STRING(120),
        allowNull: true,
        defaultValue: null
    },
    /**
     * Resumen del trailer.
     */
    resumen: {
        type: DataTypes.STRING(1000),
        allowNull: true,
        defaultValue: null
    },
    /**
     * Enlace al póster (imágen en jpg) del trailer.
     */
    poster: {
        type: DataTypes.STRING(100),
        allowNull: true,
        defaultValue: null
    },
    /**
     * Número de temporadas de la serie o película a la que pertenece el trailer.
     */
    temporadas: {
        type: DataTypes.STRING(14),
        allowNull: true,
        defaultValue: null
    },
    /**
     * Categoría a la que pertenece el trailer.
     */
    categoria: {
        type: DataTypes.STRING(45),
        allowNull: true,
        defaultValue: null
    },
    /**
     * Lista de géneros a los que pertenece el trailer.
     */
    generos: {
        type: DataTypes.TEXT,
        allowNull: true,
        defaultValue: null
    },
    /**
     * Lista de actores que participan en el trailer.
     */
    reparto: {
        type: DataTypes.TEXT,
        allowNull: true,
        defaultValue: null
    }
}, {
    /**
     * Nombre de la vista SQL donde está toda la información de los trailers.
     */
    tableName: 'trailers',
    timestamps: false
});

/**
 * Exportación del módulo Trailer para utilizarlo en server.js
 * 
 */
module.exports = Trailer;
