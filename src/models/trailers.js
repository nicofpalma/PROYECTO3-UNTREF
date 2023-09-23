const { DataTypes } = require('sequelize');
const sequelize = require('../config/config');

const Trailer = sequelize.define('Trailer', {
    idTrailer: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        unique: true,
        allowNull: false
    },
    titulo: {
        type: DataTypes.STRING(100),
        allowNull: false,
    },
    link: {
        type: DataTypes.STRING(120),
        allowNull: true,
        defaultValue: null
    },
    resumen: {
        type: DataTypes.STRING(1000),
        allowNull: true,
        defaultValue: null
    },
    poster: {
        type: DataTypes.STRING(100),
        allowNull: true,
        defaultValue: null
    },
    temporadas: {
        type: DataTypes.STRING(14),
        allowNull: true,
        defaultValue: null
    },
    categoria: {
        type: DataTypes.STRING(45),
        allowNull: true,
        defaultValue: null
    },
    generos: {
        type: DataTypes.TEXT,
        allowNull: true,
        defaultValue: null
    },
    reparto: {
        type: DataTypes.TEXT,
        allowNull: true,
        defaultValue: null
    }
}, {
    tableName: 'trailers',
    timestamps: false
});

module.exports = Trailer;
